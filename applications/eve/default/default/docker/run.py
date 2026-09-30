import os
from eve import Eve
from auth import AdminBasicAuth
from flask import jsonify, request

app = Eve(settings='settings.py', auth=AdminBasicAuth)

@app.route('/health', methods=['GET'])
def health():
    return jsonify({
        'status': 'healthy',
        'service': 'eve',
        'version': '2.3.1'
    }), 200

@app.route('/login', methods=['GET', 'POST'])
def login():
    admin_user = os.environ.get('ADMIN_USERNAME', 'admin')
    admin_pass = os.environ.get('ADMIN_PASSWORD', 'AdminPassword123!')
    
    # Check Basic Auth headers
    auth = request.authorization
    if auth:
        if auth.username == admin_user and auth.password == admin_pass:
            return jsonify({
                'status': 'success',
                'code': 200,
                'message': 'Login successful',
                'user': {'username': admin_user, 'role': 'Administrator'}
            }), 200
        # Check database
        try:
            db = app.data.driver.db
            user = db['users'].find_one({'username': auth.username})
            if user and user.get('password') == auth.password:
                return jsonify({
                    'status': 'success',
                    'code': 200,
                    'message': 'Login successful',
                    'user': {'username': auth.username, 'role': user.get('role', 'User')}
                }), 200
        except Exception:
            pass
        return jsonify({'status': 'error', 'code': 401, 'message': 'Invalid credentials'}), 401
        
    # Check POST payload
    if request.method == 'POST':
        data = request.get_json(silent=True) or request.form
        if data:
            username = data.get('username')
            password = data.get('password')
            if username == admin_user and password == admin_pass:
                return jsonify({
                    'status': 'success',
                    'code': 200,
                    'message': 'Login successful',
                    'user': {'username': admin_user, 'role': 'Administrator'}
                }), 200
            try:
                db = app.data.driver.db
                user = db['users'].find_one({'username': username})
                if user and user.get('password') == password:
                    return jsonify({
                        'status': 'success',
                        'code': 200,
                        'message': 'Login successful',
                        'user': {'username': username, 'role': user.get('role', 'User')}
                    }), 200
            except Exception:
                pass
        return jsonify({'status': 'error', 'code': 401, 'message': 'Invalid username or password'}), 401
        
    # GET /login without auth
    return jsonify({
        'status': 'info',
        'endpoint': '/login',
        'message': 'Eve API authentication gateway. Provide HTTP Basic Auth or POST username and password.'
    }), 200

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port)
