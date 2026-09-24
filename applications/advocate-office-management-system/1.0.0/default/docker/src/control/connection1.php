<?php
$servername = getenv('DB_HOST') ?: 'db';
$username = getenv('DB_USER') ?: 'root';
$password = getenv('DB_PASS') ?: 'benchmark-only';
$dbname = getenv('DB_NAME') ?: 'advocate1';

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>