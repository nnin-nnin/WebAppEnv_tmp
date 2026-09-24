<?php
/**
 * OrangeHRM Configuration File
 */

class Conf
{
    private string $dbHost;
    private string $dbPort;
    private string $dbName;
    private string $dbUser;
    private string $dbPass;

    public function __construct()
    {
        $this->dbHost = getenv('ORANGEHRM_DATABASE_HOST') ?: 'db';
        $this->dbPort = getenv('ORANGEHRM_DATABASE_PORT') ?: '3306';
        $dbName = getenv('ORANGEHRM_DATABASE_NAME') ?: 'orangehrm';
        if (defined('ENVIRONMENT') && ENVIRONMENT == 'test') {
            $prefix = defined('TEST_DB_PREFIX') ? TEST_DB_PREFIX : '';
            $this->dbName = $prefix . 'test_' . $dbName;
        } else {
            $this->dbName = $dbName;
        }
        $this->dbUser = getenv('ORANGEHRM_DATABASE_USER') ?: 'orangehrm';
        $this->dbPass = getenv('ORANGEHRM_DATABASE_PASSWORD') ?: 'orangehrm_pass';
    }

    public function getDbHost(): string
    {
        return $this->dbHost;
    }

    public function getDbPort(): string
    {
        return $this->dbPort;
    }

    public function getDbName(): string
    {
        return $this->dbName;
    }

    public function getDbUser(): string
    {
        return $this->dbUser;
    }

    public function getDbPass(): string
    {
        return $this->dbPass;
    }
}
