<?php
  if (session_status() == PHP_SESSION_NONE) {
    session_start();
  }
  $servername = getenv('DB_HOST') ?: "db";
  $dBUsername = getenv('DB_USER') ?: "root";
  $dBPassword = getenv('DB_PASS') ?: "AdminPassword123!";
  $dBName = getenv('DB_NAME') ?: "hostel_management_system";

  $conn = mysqli_connect($servername, $dBUsername, $dBPassword, $dBName);

  if (!$conn) {
    die("Connection Failed: ".mysqli_connect_error());
  }
?>
