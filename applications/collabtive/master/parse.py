import re
with open("src/install.php", "r") as f:
    content = f.read()
tables = re.findall(r"mysql_query\(\s*\"[\r\n\s]*(CREATE TABLE [^\"]+)\"\)", content, re.IGNORECASE | re.DOTALL)
out = ";\n\n".join(tables) + ";\n\n"

out += """
INSERT INTO settings (name,subtitle,locale,timezone,dateformat,template,mailnotify,mailfrom,mailmethod) VALUES ('Collabtive','Projectmanagement','en','Europe/Berlin','d.m.Y','standard',1,'collabtive@localhost','mail');

INSERT INTO user (name,email,company,pass,locale,tags,rate) VALUES ('admin','admin@example.com','','7c4a8d09ca3762af61e59520943dc26494f8941b','en','',0);

INSERT INTO roles (ID, name, projects, tasks, milestones, messages, files, timetracker, chat, admin) VALUES 
(1, 'Admin', 'a:4:{s:3:"add";i:1;s:4:"edit";i:1;s:3:"del";i:1;s:5:"close";i:1;}', 'a:4:{s:3:"add";i:1;s:4:"edit";i:1;s:3:"del";i:1;s:5:"close";i:1;}', 'a:4:{s:3:"add";i:1;s:4:"edit";i:1;s:3:"del";i:1;s:5:"close";i:1;}', 'a:4:{s:3:"add";i:1;s:4:"edit";i:1;s:3:"del";i:1;s:5:"close";i:1;}', 'a:3:{s:3:"add";i:1;s:4:"edit";i:1;s:3:"del";i:1;}', 'a:1:{s:3:"add";i:1;}', 'a:4:{s:3:"add";i:1;s:4:"edit";i:1;s:3:"del";i:1;s:4:"read";i:1;}', 'a:1:{s:3:"add";i:1;}'),
(2, 'User', 'a:4:{s:3:"add";i:1;s:4:"edit";i:1;s:3:"del";i:0;s:5:"close";i:0;}', 'a:4:{s:3:"add";i:1;s:4:"edit";i:1;s:3:"del";i:0;s:5:"close";i:1;}', 'a:4:{s:3:"add";i:1;s:4:"edit";i:1;s:3:"del";i:1;s:5:"close";i:1;}', 'a:4:{s:3:"add";i:1;s:4:"edit";i:1;s:3:"del";i:1;s:5:"close";i:1;}', 'a:3:{s:3:"add";i:1;s:4:"edit";i:1;s:3:"del";i:1;}', 'a:1:{s:3:"add";i:1;}', 'a:4:{s:3:"add";i:1;s:4:"edit";i:1;s:3:"del";i:1;s:4:"read";i:0;}', 'a:1:{s:3:"add";i:0;}'),
(3, 'Client', 'a:4:{s:3:"add";i:0;s:4:"edit";i:0;s:3:"del";i:0;s:5:"close";i:0;}', 'a:4:{s:3:"add";i:0;s:4:"edit";i:0;s:3:"del";i:0;s:5:"close";i:0;}', 'a:4:{s:3:"add";i:0;s:4:"edit";i:0;s:3:"del";i:0;s:5:"close";i:0;}', 'a:4:{s:3:"add";i:0;s:4:"edit";i:0;s:3:"del";i:0;s:5:"close";i:0;}', 'a:3:{s:3:"add";i:0;s:4:"edit";i:0;s:3:"del";i:0;}', 'a:1:{s:3:"add";i:0;}', 'a:4:{s:3:"add";i:0;s:4:"edit";i:0;s:3:"del";i:0;s:4:"read";i:0;}', 'a:1:{s:3:"add";i:0;}');

INSERT INTO roles_assigned (user, role) VALUES (1, 1);
"""

with open("database-seed.sql", "w") as f:
    f.write(out)
