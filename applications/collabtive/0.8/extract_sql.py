import re
import hashlib
import time

install_php = "/Users/min/Code/SecSys/WebPlatform/tmp-for-sop/applications/to_be_checked/collabtive/source_repo/install.php"
with open(install_php, "r") as f:
    content = f.read()

# Extract all CREATE TABLE statements
create_tables = re.findall(r'mysql_query\("(?:\s*)(CREATE TABLE.*?)"\)', content, re.DOTALL | re.IGNORECASE)

# Extract default settings insert
settings_insert = re.search(r'mysql_query\("(INSERT INTO settings.*?)"\)', content, re.DOTALL | re.IGNORECASE)

# Generate admin user insert
admin_user = "admin"
admin_pass = "123456"
admin_pass_hash = hashlib.sha1(admin_pass.encode()).hexdigest()
user_insert = f"INSERT INTO user (name,email,company,pass,locale,tags,rate) VALUES ('{admin_user}','admin@example.com','','{admin_pass_hash}','en','',0.0);"

# Generate roles insert (from install.php logic)
roles_insert = """
INSERT INTO roles (name, projects, tasks, milestones, messages, files, chat, timetracker, admin) VALUES 
('Admin', 'a:4:{s:3:"add";i:1;s:4:"edit";i:1;s:3:"del";i:1;s:5:"close";i:1;}', 'a:4:{s:3:"add";i:1;s:4:"edit";i:1;s:3:"del";i:1;s:5:"close";i:1;}', 'a:4:{s:3:"add";i:1;s:4:"edit";i:1;s:3:"del";i:1;s:5:"close";i:1;}', 'a:4:{s:3:"add";i:1;s:4:"edit";i:1;s:3:"del";i:1;s:5:"close";i:1;}', 'a:3:{s:3:"add";i:1;s:4:"edit";i:1;s:3:"del";i:1;}', 'a:4:{s:3:"add";i:1;s:4:"edit";i:1;s:3:"del";i:1;s:4:"read";i:1;}', 'a:1:{s:3:"add";i:1;}', 'a:1:{s:3:"add";i:1;}'),
('User', 'a:4:{s:3:"add";i:1;s:4:"edit";i:1;s:3:"del";i:0;s:5:"close";i:0;}', 'a:4:{s:3:"add";i:1;s:4:"edit";i:1;s:3:"del";i:0;s:5:"close";i:1;}', 'a:4:{s:3:"add";i:1;s:4:"edit";i:1;s:3:"del";i:1;s:5:"close";i:1;}', 'a:4:{s:3:"add";i:1;s:4:"edit";i:1;s:3:"del";i:1;s:5:"close";i:1;}', 'a:3:{s:3:"add";i:1;s:4:"edit";i:1;s:3:"del";i:1;}', 'a:4:{s:3:"add";i:1;s:4:"edit";i:1;s:3:"del";i:1;s:4:"read";i:0;}', 'a:1:{s:3:"add";i:1;}', 'a:1:{s:3:"add";i:0;}'),
('Client', 'a:4:{s:3:"add";i:0;s:4:"edit";i:0;s:3:"del";i:0;s:5:"close";i:0;}', 'a:4:{s:3:"add";i:0;s:4:"edit";i:0;s:3:"del";i:0;s:5:"close";i:0;}', 'a:4:{s:3:"add";i:0;s:4:"edit";i:0;s:3:"del";i:0;s:5:"close";i:0;}', 'a:4:{s:3:"add";i:0;s:4:"edit";i:0;s:3:"del";i:0;s:5:"close";i:0;}', 'a:3:{s:3:"add";i:0;s:4:"edit";i:0;s:3:"del";i:0;}', 'a:4:{s:3:"add";i:0;s:4:"edit";i:0;s:3:"del";i:0;s:4:"read";i:0;}', 'a:1:{s:3:"add";i:0;}', 'a:1:{s:3:"add";i:0;}');
"""

# roles_assigned (admin user gets admin role)
roles_assigned_insert = "INSERT INTO roles_assigned (user, role) VALUES (1, 1);"

out = "/Users/min/Code/SecSys/WebPlatform/tmp-for-sop/applications/to_be_checked/collabtive/0.8/resources/initial-data/database-seed.sql"
with open(out, "w") as f:
    for t in create_tables:
        f.write(t + ";\n\n")
    if settings_insert:
        s = settings_insert.group(1).replace('$locale', 'en').replace('$timezone', 'UTC')
        f.write(s + ";\n\n")
    f.write(user_insert + "\n")
    f.write(roles_insert + "\n")
    f.write(roles_assigned_insert + "\n")

print("Created seed SQL.")
