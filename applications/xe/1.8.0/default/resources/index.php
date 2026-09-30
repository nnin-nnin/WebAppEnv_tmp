<?php
session_start();

$admin_user = getenv('ADMIN_USERNAME') ?: 'admin';
$admin_pass = getenv('ADMIN_PASSWORD') ?: 'Admin123456!';

$msg = '';
$logged_in = false;

if (isset($_SESSION['user']) && $_SESSION['user'] === $admin_user) {
    $logged_in = true;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $u = isset($_POST['username']) ? trim($_POST['username']) : (isset($_POST['user_id']) ? trim($_POST['user_id']) : '');
    $p = isset($_POST['password']) ? trim($_POST['password']) : '';

    if ($u === $admin_user && $p === $admin_pass) {
        $_SESSION['user'] = $u;
        $logged_in = true;
        $msg = 'Login successful! Logged in as ' . htmlspecialchars($admin_user);
    } else {
        $msg = 'Invalid username or password';
    }
}

if (isset($_GET['act']) && $_GET['act'] === 'dispMemberLogout') {
    session_destroy();
    $logged_in = false;
    $msg = 'Logged out successfully';
}

header('Content-Type: text/html; charset=utf-8');
http_response_code(200);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>XpressEngine 1.8.0</title>
    <style>
        body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; margin: 40px; background: #f5f6f8; }
        .container { max-width: 600px; margin: 0 auto; background: #fff; padding: 30px; border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); }
        h1 { color: #1e3a8a; margin-top: 0; }
        .status { padding: 10px 15px; border-radius: 4px; margin-bottom: 20px; }
        .status-ok { background: #dcfce7; color: #166534; }
        .status-err { background: #fee2e2; color: #991b1b; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input[type="text"], input[type="password"] { width: 100%; padding: 8px; box-sizing: border-box; border: 1px solid #ccc; border-radius: 4px; }
        button { background: #2563eb; color: #fff; border: none; padding: 10px 20px; border-radius: 4px; cursor: pointer; }
        button:hover { background: #1d4ed8; }
        .info { margin-top: 20px; font-size: 0.9em; color: #6b7280; }
    </style>
</head>
<body>
    <div class="container">
        <h1>XpressEngine Core 1.8.0</h1>
        <p>Welcome to XpressEngine (XE) 1.8.0 benchmark environment.</p>

        <?php if (!empty($msg)): ?>
            <div class="status <?php echo $logged_in ? 'status-ok' : 'status-err'; ?>">
                <?php echo htmlspecialchars($msg); ?>
            </div>
        <?php endif; ?>

        <?php if ($logged_in): ?>
            <div class="status status-ok">
                <strong>Status:</strong> Logged in as administrator (<?php echo htmlspecialchars($admin_user); ?>).
            </div>
            <p><a href="?act=dispMemberLogout">Logout</a></p>
        <?php else: ?>
            <form method="POST" action="index.php">
                <div class="form-group">
                    <label for="username">Username / ID:</label>
                    <input type="text" id="username" name="username" value="admin" required>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <button type="submit">Sign In</button>
            </form>
        <?php endif; ?>

        <div class="info">
            <p><strong>Version:</strong> 1.8.0</p>
            <p><strong>PHP Version:</strong> <?php echo PHP_VERSION; ?></p>
            <p><strong>Server:</strong> Apache / <?php echo $_SERVER['SERVER_SOFTWARE'] ?? 'PHP'; ?></p>
        </div>
    </div>
</body>
</html>
