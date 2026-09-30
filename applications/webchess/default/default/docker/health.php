<?php
require_once 'connectdb.php';
header('Content-Type: application/json');
if ($dbh && mysqli_ping($dbh)) {
    http_response_code(200);
    echo json_encode([
        'status' => 'UP',
        'app' => 'webchess',
        'database' => 'connected',
        'timestamp' => date('c')
    ]);
} else {
    http_response_code(500);
    echo json_encode([
        'status' => 'DOWN',
        'app' => 'webchess',
        'database' => 'disconnected',
        'timestamp' => date('c')
    ]);
}
