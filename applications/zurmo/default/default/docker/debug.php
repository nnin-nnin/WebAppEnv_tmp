<?php
    /*********************************************************************************
     * Zurmo debug configuration for production
     ********************************************************************************/

    $debugOn = false;
    $forceNoFreeze = false;
    $performanceOn = false;
    $redBeanDebugOn = false;
    $redBeanDebugLogToFileOn = false;
    $queryDataOn = false;
    $securityOptimized = false;
    $auditingOptimized = true;
    $phpLevelCaching = true;
    $memcacheLevelCaching = false;
    $dbLevelCaching = true;
    $minifyScripts = true;
    $xhtmlValidation = false;
    $submitCrashToSentry = false;

    $seleniumServerPath             = '';
    $seleniumTestBaseUrl            = '';
    $seleniumTestResultUrl          = '';
    $seleniumTestResultsPath        = '';
    $seleniumServerPort             = '4048';
    $seleniumBrowsersToRun          = 'All';
    $seleniumControlUrl             = '';

    if ($debugOn)
    {
        error_reporting(E_ALL | E_STRICT);
    }

    define('YII_DEBUG',              $debugOn);
    define('YII_TRACE_LEVEL',        $debugOn ? 3 : 0);
    define('FORCE_NO_FREEZE',        $forceNoFreeze);
    define('SHOW_PERFORMANCE',       $performanceOn);
    define('SHOW_QUERY_DATA',        $queryDataOn);
    define('REDBEAN_DEBUG',          $redBeanDebugOn);
    define('REDBEAN_DEBUG_TO_FILE',  $redBeanDebugLogToFileOn);
    define('SECURITY_OPTIMIZED',     $securityOptimized);
    define('AUDITING_OPTIMIZED',     $auditingOptimized);
    define('PHP_CACHING_ON',         $phpLevelCaching);
    define('MEMCACHE_ON',            $memcacheLevelCaching);
    define('DB_CACHING_ON',          $dbLevelCaching);
    define('MINIFY_SCRIPTS',         $minifyScripts);
    define('XHTML_VALIDATION',       $xhtmlValidation);
    define('SUBMIT_CRASH_TO_SENTRY', $submitCrashToSentry);

    assert_options(ASSERT_ACTIVE,   $debugOn);
    assert_options(ASSERT_WARNING,  $debugOn);
    assert_options(ASSERT_BAIL,     false);
    if (php_sapi_name() != 'cli')
    {
        assert_options(ASSERT_CALLBACK, 'assertFailureInBrowser');
    }
    else
    {
        assert_options(ASSERT_CALLBACK, 'assertFailureInCli');
    }

    function assertFailureInBrowser($file, $line, $message)
    {
        echo '<span style="background-color: red; color: yellow; font-weight:bold;">';
        echo "ASSERTION FAILED in $file on line $line";
        if (is_string($message) && !empty($message))
        {
            echo ": assert('$message'); ";
        }
        echo '</span><br />';
    }

    function assertFailureInCli($file, $line, $message)
    {
        throw new FailedAssertionException($file, $line, $message);
    }
?>
