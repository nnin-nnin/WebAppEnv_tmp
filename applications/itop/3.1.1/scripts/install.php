<?php
declare(strict_types=1);

chdir('/var/www/html');
require_once '/var/www/html/approot.inc.php';
require_once APPROOT.'core/config.class.inc.php';
require_once APPROOT.'setup/parameters.class.inc.php';
require_once APPROOT.'setup/applicationinstaller.class.inc.php';
require_once APPROOT.'setup/modulediscovery.class.inc.php';
require_once APPROOT.'setup/runtimeenv.class.inc.php';
require_once APPROOT.'core/log.class.inc.php';

$passwordFile = getenv('ITOP_ADMIN_PASSWORD_FILE') ?: '';
$adminPassword = $passwordFile !== '' ? trim((string) file_get_contents($passwordFile)) : '';
if ($adminPassword === '') {
    throw new RuntimeException('管理员密码未通过受控 secret 提供');
}

function collectChoices(SimpleXMLElement $node, array &$modules, array &$extensions): void
{
    foreach ($node->children() as $step) {
        foreach (['options', 'alternatives'] as $groupName) {
            if (!isset($step->{$groupName})) {
                continue;
            }
            $choices = [];
            foreach ($step->{$groupName}->choice as $choice) {
                $isSelected = ((string) ($choice->mandatory ?? '') === 'true') || ((string) ($choice->default ?? '') === 'true');
                if ($isSelected) {
                    $choices[] = $choice;
                }
            }
            if ($groupName === 'alternatives' && count($choices) === 0 && isset($step->{$groupName}->choice[0])) {
                $choices[] = $step->{$groupName}->choice[0];
            }
            foreach ($choices as $choice) {
                $code = trim((string) ($choice->extension_code ?? ''));
                if ($code !== '') {
                    $extensions[] = $code;
                }
                foreach ($choice->modules->module ?? [] as $module) {
                    $modules[] = trim((string) $module);
                }
                if (isset($choice->sub_options)) {
                    collectChoices($choice->sub_options, $modules, $extensions);
                }
            }
        }
    }
}

$modules = [];
$extensions = [];
$installation = simplexml_load_file(APPROOT.'datamodels/2.x/installation.xml');
if ($installation === false) {
    throw new RuntimeException('无法读取 iTop 安装模块清单');
}
collectChoices($installation->steps, $modules, $extensions);

$available = ModuleDiscovery::GetAvailableModules([APPROOT.'datamodels/2.x'], true);
$selected = array_fill_keys(array_filter($modules), true);
$selected['authent-local'] = true;
foreach ($available as $id => $info) {
    if (($info['category'] ?? '') === 'authentication' && !isset($info['auto_select'])) {
        $selected[$id] = true;
    }
}
do {
    $added = false;
    SetupInfo::SetSelectedModules($selected);
    foreach ($available as $id => $info) {
        if (isset($selected[$id]) || !isset($info['auto_select'])) {
            continue;
        }
        $enabled = false;
        eval('$enabled = ('.$info['auto_select'].');');
        if ($enabled) {
            $selected[$id] = true;
            $added = true;
        }
    }
} while ($added);

$pending = array_keys($selected);
while ($pending !== []) {
    $id = array_pop($pending);
    foreach (($available[$id]['dependencies'] ?? []) as $dependency) {
        if (!isset($selected[$dependency]) && isset($available[$dependency])) {
            $selected[$dependency] = true;
            $pending[] = $dependency;
        }
    }
}

$params = new PHPParameters();
$params->LoadFromHash([
    'mode' => 'install',
    'preinstall' => ['copies' => []],
    'source_dir' => 'datamodels/2.x',
    'datamodel_version' => SetupUtils::GetDataModelVersion(APPROOT.'datamodels/2.x'),
    'previous_configuration_file' => '',
    'extensions_dir' => 'extensions',
    'target_env' => 'production',
    'workspace_dir' => '',
    'database' => [
        'server' => '127.0.0.1', 'user' => 'itop', 'pwd' => 'itop-internal-db', 'name' => 'itop',
        'db_tls_enabled' => false, 'db_tls_ca' => '', 'prefix' => '',
    ],
    'url' => 'http://localhost:18515/',
    'graphviz_path' => '/usr/bin/dot',
    'admin_account' => ['user' => 'admin', 'pwd' => $adminPassword, 'language' => 'EN US'],
    'language' => 'EN US',
    'selected_modules' => array_keys($selected),
    'selected_extensions' => array_values(array_unique($extensions)),
    'sample_data' => false,
    'old_addon' => false,
    'options' => [],
    'mysql_bindir' => '',
]);

$installer = new ApplicationInstaller($params);
$message = null;
if (!$installer->ExecuteAllSteps(false, $message, 'Standard all-in-one build')) {
    throw new RuntimeException('iTop 初始化失败: '.(string) $message);
}

unset($adminPassword);
@unlink($passwordFile);
