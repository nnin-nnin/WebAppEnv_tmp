import os
import time
from pymongo import MongoClient

mongo_host = os.environ.get('MONGO_HOST', 'mongo')
mongo_port = int(os.environ.get('MONGO_PORT', 27017))
mongo_dbname = os.environ.get('MONGO_DBNAME', 'eve')
admin_user = os.environ.get('ADMIN_USERNAME', 'admin')
admin_pass = os.environ.get('ADMIN_PASSWORD', 'AdminPassword123!')

print(f"Connecting to MongoDB at {mongo_host}:{mongo_port} (db: {mongo_dbname})...")

client = None
for i in range(45):
    try:
        client = MongoClient(host=mongo_host, port=mongo_port, serverSelectionTimeoutMS=2000)
        client.admin.command('ping')
        print("Connected to MongoDB successfully!")
        break
    except Exception as e:
        print(f"Waiting for MongoDB ({i+1}/45): {e}")
        time.sleep(1)
else:
    print("FATAL: Could not connect to MongoDB after 45 attempts")
    exit(1)

db = client[mongo_dbname]

# 1. Seed admin user in 'users' collection
if db['users'].count_documents({'username': admin_user}) == 0:
    db['users'].insert_one({
        'username': admin_user,
        'password': admin_pass,
        'role': 'Administrator',
        'email': 'admin@benchmark.local'
    })
    print(f"Admin user '{admin_user}' seeded.")

# 2. Seed initial people
if db['people'].count_documents({}) == 0:
    db['people'].insert_many([
        {
            'firstname': 'Alan',
            'lastname': 'Turing',
            'role': ['admin', 'author']
        },
        {
            'firstname': 'Ada',
            'lastname': 'Lovelace',
            'role': ['author']
        },
        {
            'firstname': 'Grace',
            'lastname': 'Hopper',
            'role': ['contributor']
        }
    ])
    print("Default people seeded.")

# 3. Seed initial works
if db['works'].count_documents({}) == 0:
    db['works'].insert_many([
        {
            'title': 'Computing Machinery and Intelligence',
            'description': 'Seminal paper introducing the Turing test'
        },
        {
            'title': 'Notes on the Analytical Engine',
            'description': 'First published computer algorithm'
        }
    ])
    print("Default works seeded.")

print("Seed data completed successfully.")
