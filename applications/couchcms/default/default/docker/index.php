<?php require_once( 'couch/cms.php' ); ?>
<cms:template title='Home' />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CouchCMS</title>
    <style>
        body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif; margin: 40px auto; max-width: 680px; line-height: 1.6; font-size: 18px; color: #333; padding: 0 16px; background-color: #f7f9fa; }
        .container { background: #fff; border: 1px solid #e1e4e8; border-radius: 8px; padding: 32px; box-shadow: 0 2px 4px rgba(0,0,0,0.05); }
        h1 { color: #24292e; margin-top: 0; }
        a { color: #0366d6; text-decoration: none; }
        a:hover { text-decoration: underline; }
        .btn { display: inline-block; background-color: #2ea44f; color: #fff; padding: 10px 20px; border-radius: 6px; text-decoration: none; font-weight: 600; margin-top: 16px; }
        .btn:hover { background-color: #2c974b; text-decoration: none; color: #fff; }
        .meta { margin-top: 24px; padding-top: 16px; border-top: 1px solid #eaecef; font-size: 14px; color: #586069; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to CouchCMS</h1>
        <p>CouchCMS default environment is up and running successfully.</p>
        <p><a href="/couch/" class="btn">Go to Admin Panel &rarr;</a></p>
        <div class="meta">
            <p><strong>Version:</strong> default (2.4)</p>
            <p><strong>Admin URL:</strong> <a href="/couch/">/couch/</a></p>
        </div>
    </div>
</body>
</html>
<?php COUCH::invoke(); ?>
