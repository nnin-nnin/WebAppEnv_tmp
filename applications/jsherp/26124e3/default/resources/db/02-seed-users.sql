USE `jsh_erp`;

-- 1. 更新主系统管理员 admin 的密码为 AdminPassword123! 的 MD5 (1c269c612413b6c46a21cfd70e50bfb3)
UPDATE `jsh_user` SET `password` = '1c269c612413b6c46a21cfd70e50bfb3', `Status` = 0 WHERE `login_name` = 'admin';

-- 确保主管理员角色关联存在 (role 4: 管理员)
INSERT INTO `jsh_user_business` (`type`, `key_id`, `value`, `delete_flag`)
SELECT 'UserRole', '120', '[4]', '0'
WHERE NOT EXISTS (SELECT 1 FROM `jsh_user_business` WHERE `type` = 'UserRole' AND `key_id` = '120' AND `value` = '[4]');

-- 2. 插入同级管理员 admin2 (用于测试管理员间横向隔离与越权)，密码为 AdminPassword123!
DELETE FROM `jsh_user` WHERE `login_name` = 'admin2';
INSERT INTO `jsh_user` (`id`, `username`, `login_name`, `password`, `leader_flag`, `position`, `department`, `email`, `phonenum`, `ismanager`, `isystem`, `Status`, `description`, `remark`, `weixin_open_id`, `tenant_id`)
VALUES ('121', '次席管理员', 'admin2', '1c269c612413b6c46a21cfd70e50bfb3', '0', '运维管理员', '管理部', 'admin2@secsys.local', '13800000002', '1', '0', '0', '同级特权管理员，用于测试管理员间横向越权与日志隔离', null, null, '0');

DELETE FROM `jsh_user_business` WHERE `type` = 'UserRole' AND `key_id` = '121';
INSERT INTO `jsh_user_business` (`type`, `key_id`, `value`, `delete_flag`)
VALUES ('UserRole', '121', '[4]', '0');

-- 3. 插入普通业务用户 user1 (专为 IDOR 与水平越权测试设计)，密码为 UserPassword123! (MD5: 9f76e79f3ea65e7fdc651f96a68c56ad)
DELETE FROM `jsh_user` WHERE `login_name` = 'user1';
INSERT INTO `jsh_user` (`id`, `username`, `login_name`, `password`, `leader_flag`, `position`, `department`, `email`, `phonenum`, `ismanager`, `isystem`, `Status`, `description`, `remark`, `weixin_open_id`, `tenant_id`)
VALUES ('132', '业务用户A', 'user1', '9f76e79f3ea65e7fdc651f96a68c56ad', '0', '销售员', '销售一部', 'user1@secsys.local', '13800000003', '1', '0', '0', '标准业务用户 A，具备独立业务数据空间', null, null, '63');

DELETE FROM `jsh_user_business` WHERE `type` = 'UserRole' AND `key_id` = '132';
INSERT INTO `jsh_user_business` (`type`, `key_id`, `value`, `tenant_id`, `delete_flag`)
VALUES ('UserRole', '132', '[17]', '63', '0');

DELETE FROM `jsh_user_business` WHERE `type` = 'UserDepot' AND `key_id` = '132';
INSERT INTO `jsh_user_business` (`type`, `key_id`, `value`, `tenant_id`, `delete_flag`)
VALUES ('UserDepot', '132', '[14]', '63', '0');

-- 4. 插入普通业务用户 user2 (专为 IDOR 与水平越权测试设计)，密码为 UserPassword123! (MD5: 9f76e79f3ea65e7fdc651f96a68c56ad)
DELETE FROM `jsh_user` WHERE `login_name` = 'user2';
INSERT INTO `jsh_user` (`id`, `username`, `login_name`, `password`, `leader_flag`, `position`, `department`, `email`, `phonenum`, `ismanager`, `isystem`, `Status`, `description`, `remark`, `weixin_open_id`, `tenant_id`)
VALUES ('133', '业务用户B', 'user2', '9f76e79f3ea65e7fdc651f96a68c56ad', '0', '销售员', '销售二部', 'user2@secsys.local', '13800000004', '1', '0', '0', '标准业务用户 B，用于水平越权与 IDOR 测试靶标', null, null, '63');

DELETE FROM `jsh_user_business` WHERE `type` = 'UserRole' AND `key_id` = '133';
INSERT INTO `jsh_user_business` (`type`, `key_id`, `value`, `tenant_id`, `delete_flag`)
VALUES ('UserRole', '133', '[17]', '63', '0');

DELETE FROM `jsh_user_business` WHERE `type` = 'UserDepot' AND `key_id` = '133';
INSERT INTO `jsh_user_business` (`type`, `key_id`, `value`, `tenant_id`, `delete_flag`)
VALUES ('UserDepot', '133', '[15]', '63', '0');
