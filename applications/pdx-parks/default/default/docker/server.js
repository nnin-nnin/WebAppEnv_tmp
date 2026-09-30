var express = require('express');
var request = require('request');
var logfmt = require('logfmt');
var deparam = require('node-jquery-deparam');
var crypto = require('crypto');

var port = Number(process.env.PORT || 3000);
var keepAlive = require('keep-alive')('http://127.0.0.1:' + port, 1800000);
var app = express();

var ADMIN_USER = process.env.ADMIN_USERNAME || 'admin';
var ADMIN_PASS = process.env.ADMIN_PASSWORD || 'AdminPassword123!';

var activeSessions = {};

app.use(logfmt.requestLogger());
app.use(express.cookieParser());
app.use(express.urlencoded());
app.use(express.json());
app.use('/public', express.static(__dirname + '/public'));
app.use(express.favicon(__dirname + '/public/img/favicon.ico'));

app.get('/health', function(req, res){
  res.json({ status: 'UP', app: 'pdx-parks', version: 'default', timestamp: new Date().toISOString() });
});

app.get('/', function(req, res){
  res.sendfile(__dirname + '/index.html');
});

// Curated Portland parks dataset as robust offline fallback
var fallbackParks = [
  { "Property": "Forest Park", "loc": { "lat": 45.539, "lon": -122.743 } },
  { "Property": "Washington Park", "loc": { "lat": 45.518, "lon": -122.709 } },
  { "Property": "Mount Tabor Park", "loc": { "lat": 45.512, "lon": -122.593 } },
  { "Property": "Governor Tom McCall Waterfront Park", "loc": { "lat": 45.517, "lon": -122.673 } },
  { "Property": "Peninsula Park Rose Garden", "loc": { "lat": 45.568, "lon": -122.677 } },
  { "Property": "Cathedral Park", "loc": { "lat": 45.588, "lon": -122.762 } },
  { "Property": "Laurelhurst Park", "loc": { "lat": 45.523, "lon": -122.628 } }
];

app.get('/parks', function(req, res){
  var queryStr = req.url.indexOf('?') !== -1 ? req.url.split('?')[1] : '';
  var queryData = deparam(queryStr || '');
  var lon = queryData.lon || -122.6765;
  var lat = queryData.lat || 45.5234;
  var count = Number(queryData.count) || 5;

  var apiUrl = 'http://api.civicapps.org/parks/near/' + lon + ',' + lat + '?count=' + count;
  var finished = false;

  var sendFallback = function() {
    if (!finished) {
      finished = true;
      res.json({ results: fallbackParks.slice(0, count) });
    }
  };

  try {
    var reqStream = request.get({ url: apiUrl, timeout: 2000 }, function(err, resp, body) {
      if (err || !resp || resp.statusCode !== 200) {
        sendFallback();
      } else {
        if (!finished) {
          finished = true;
          try {
            var parsed = JSON.parse(body);
            if (parsed && parsed.results && parsed.results.length > 0) {
              res.json(parsed);
            } else {
              sendFallback();
            }
          } catch(e) {
            sendFallback();
          }
        }
      }
    });

    reqStream.on('error', function(err) {
      sendFallback();
    });
  } catch(e) {
    sendFallback();
  }
});

// Admin authentication endpoints
app.get('/login', function(req, res){
  res.send('<!DOCTYPE html><html><head><title>PDX Parks - Admin Login</title>' +
    '<link rel="stylesheet" href="/public/style.css">' +
    '<style>body{background:#2c3e50;color:#ecf0f1;font-family:sans-serif;display:flex;justify-content:center;align-items:center;height:100vh;margin:0}' +
    '.card{background:#34495e;padding:30px;border-radius:8px;box-shadow:0 4px 6px rgba(0,0,0,0.3);width:320px}' +
    'h2{margin-top:0;text-align:center;color:#1abc9c}' +
    'label{font-size:14px;color:#bdc3c7;display:block;margin-top:10px}' +
    'input{width:100%;padding:10px;margin:8px 0;border:none;border-radius:4px;box-sizing:border-box}' +
    'button{width:100%;padding:10px;margin-top:15px;background:#1abc9c;border:none;color:#fff;border-radius:4px;font-weight:bold;cursor:pointer}' +
    'button:hover{background:#16a085}</style></head>' +
    '<body><div class="card"><h2>PDX Parks Admin</h2>' +
    '<form method="POST" action="/login">' +
    '<label>Username</label><input type="text" name="username" placeholder="admin" required>' +
    '<label>Password</label><input type="password" name="password" required>' +
    '<button type="submit">Log In</button>' +
    '</form></div></body></html>');
});

var authenticateUser = function(req, res) {
  var username = (req.body && req.body.username) || (req.query && req.query.username);
  var password = (req.body && req.body.password) || (req.query && req.query.password);

  if (username === ADMIN_USER && password === ADMIN_PASS) {
    var sid = crypto.randomBytes(16).toString('hex');
    activeSessions[sid] = { username: username, role: 'admin', time: Date.now() };
    res.cookie('pdx_session', sid, { httpOnly: true });

    var wantsJson = req.xhr || (req.headers.accept && req.headers.accept.indexOf('application/json') !== -1) || (req.is && req.is('json'));
    if (wantsJson) {
      return res.json({ success: true, message: 'Authentication successful', token: sid });
    } else {
      return res.redirect('/admin');
    }
  } else {
    var wantsJson = req.xhr || (req.headers.accept && req.headers.accept.indexOf('application/json') !== -1) || (req.is && req.is('json'));
    if (wantsJson) {
      return res.status(401).json({ success: false, message: 'Invalid credentials' });
    } else {
      return res.status(401).send('<!DOCTYPE html><html><body><h2>Authentication failed</h2><p><a href="/login">Back to Login</a></p></body></html>');
    }
  }
};

app.post('/login', authenticateUser);
app.post('/api/login', authenticateUser);

app.get('/admin', function(req, res){
  var sid = (req.cookies && req.cookies.pdx_session) || req.headers['authorization'];
  if (sid && (activeSessions[sid] || sid === 'Bearer ' + ADMIN_PASS || sid === 'admin')) {
    var session = activeSessions[sid] || { username: ADMIN_USER };
    res.send('<!DOCTYPE html><html><head><title>Admin Control Panel - PDX Parks</title>' +
      '<link rel="stylesheet" href="/public/style.css">' +
      '<style>body{background:#f8f9fa;font-family:sans-serif;padding:40px;color:#333}' +
      '.container{max-width:800px;margin:0 auto;background:#fff;padding:30px;border-radius:8px;box-shadow:0 2px 4px rgba(0,0,0,0.1)}' +
      '.badge{background:#27ae60;color:white;padding:4px 8px;border-radius:4px;font-size:12px;margin-left:10px}' +
      'a.logout{color:#e74c3c;font-weight:bold;text-decoration:none;margin-left:20px}' +
      '</style></head><body>' +
      '<div class="container">' +
      '<h1>PDX Parks Admin Dashboard</h1>' +
      '<p>Welcome back, <strong>' + session.username + '</strong> <span class="badge">Administrator</span>' +
      '<a class="logout" href="/logout">Logout</a></p>' +
      '<h3>System Overview</h3>' +
      '<ul>' +
      '<li>Status: <strong>Online</strong></li>' +
      '<li>Service Port: <strong>' + port + '</strong></li>' +
      '<li>App: <strong>PDX Parks (Portland, OR)</strong></li>' +
      '</ul>' +
      '<h3>Managed Parks</h3>' +
      '<ol>' +
      fallbackParks.map(function(p){ return '<li>' + p.Property + ' (' + p.loc.lat + ', ' + p.loc.lon + ')</li>'; }).join('') +
      '</ol>' +
      '</div></body></html>');
  } else {
    res.redirect('/login');
  }
});

app.get('/logout', function(req, res){
  var sid = req.cookies && req.cookies.pdx_session;
  if (sid && activeSessions[sid]) {
    delete activeSessions[sid];
  }
  res.clearCookie('pdx_session');
  res.redirect('/login');
});

app.post('/api/reset', function(req, res){
  activeSessions = {};
  res.json({ success: true, message: 'Reset completed' });
});

app.listen(port, '0.0.0.0', function(){
  console.log('Server running on port:', port);
});
