import os
from eve.auth import BasicAuth
from flask import current_app, request

class AdminBasicAuth(BasicAuth):
    def check_auth(self, username, password, allowed_roles, resource, method):
        admin_user = os.environ.get('ADMIN_USERNAME', 'admin')
        admin_pass = os.environ.get('ADMIN_PASSWORD', 'AdminPassword123!')
        
        # Check against default admin
        if username == admin_user and password == admin_pass:
            self.set_user_or_token(username)
            return True
            
        # Check against database users collection
        try:
            db = current_app.data.driver.db
            user = db['users'].find_one({'username': username})
            if user and user.get('password') == password:
                self.set_user_or_token(username)
                return True
        except Exception:
            pass
            
        return False
