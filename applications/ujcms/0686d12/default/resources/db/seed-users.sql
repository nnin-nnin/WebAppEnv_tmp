-- Seed users for Academic Security & Access Control Evaluation (Dual-Peer 4-Account Matrix)
-- Admin Password (admin, admin2): AdminPassword123!
-- PBKDF2 Hash: {pbkdf2}duCxtawl7JDZtUg/biVn6i0Vc9Qxmi0pNliNrY9rIBZ1gNHNycML0A==
-- Test User Password (user1, user2): UserPassword123!
-- BCrypt Hash: {bcrypt}$2a$12$1A02lblzWt2m7yNrFRFbxenorrcfUoreRj.uRRduBYTwZa1dF6Quq

-- 1. Administrator Level: Admin 2 (ID: 100) - Peer Administrator for Horizontal Admin Isolation Testing
INSERT INTO ujcms_user (id_, group_id_, org_id_, username_, password_, email_, mobile_, alias_, nickname_, real_name_, gender_, avatar_, password_modified_, rank_, type_, status_) 
VALUES (100, 8, 1, 'admin2', '{pbkdf2}duCxtawl7JDZtUg/biVn6i0Vc9Qxmi0pNliNrY9rIBZ1gNHNycML0A==', 'admin2@example.com', NULL, 'admin2', 'Secondary Admin', 'Admin Two', 1, NULL, NOW(), 0, 4, 0)
ON DUPLICATE KEY UPDATE password_ = VALUES(password_), status_ = 0;

INSERT INTO ujcms_user_ext (id_, birthday_, location_, bio_, created_, history_password_, login_date_, login_ip_, login_count_, error_date_, error_count_) 
VALUES (100, NULL, 'Beijing, CN', 'Secondary System Administrator - Horizontal Admin BAC Target', NOW(), NULL, NOW(), '127.0.0.1', 0, NOW(), 0)
ON DUPLICATE KEY UPDATE login_ip_ = VALUES(login_ip_);

INSERT INTO ujcms_user_role (user_id_, role_id_, order_)
VALUES (100, 1, 9999)
ON DUPLICATE KEY UPDATE order_ = VALUES(order_);

-- 2. Standard User Level: Peer User 1 (ID: 101) - IDOR Target Entity A
INSERT INTO ujcms_user (id_, group_id_, org_id_, username_, password_, email_, mobile_, alias_, nickname_, real_name_, gender_, avatar_, password_modified_, rank_, type_, status_) 
VALUES (101, 10, 0, 'user1', '{bcrypt}$2a$12$1A02lblzWt2m7yNrFRFbxenorrcfUoreRj.uRRduBYTwZa1dF6Quq', 'user1@example.com', NULL, 'user1', 'Alpha User', 'Test User 1', 1, NULL, NOW(), 0, 5, 0)
ON DUPLICATE KEY UPDATE password_ = VALUES(password_), status_ = 0;

INSERT INTO ujcms_user_ext (id_, birthday_, location_, bio_, created_, history_password_, login_date_, login_ip_, login_count_, error_date_, error_count_) 
VALUES (101, NULL, 'Beijing, CN', 'Horizontal Test User A - Independent Data Scope', NOW(), NULL, NOW(), '127.0.0.1', 0, NOW(), 0)
ON DUPLICATE KEY UPDATE login_ip_ = VALUES(login_ip_);

-- 3. Standard User Level: Peer User 2 (ID: 102) - IDOR Target Entity B
INSERT INTO ujcms_user (id_, group_id_, org_id_, username_, password_, email_, mobile_, alias_, nickname_, real_name_, gender_, avatar_, password_modified_, rank_, type_, status_) 
VALUES (102, 10, 0, 'user2', '{bcrypt}$2a$12$1A02lblzWt2m7yNrFRFbxenorrcfUoreRj.uRRduBYTwZa1dF6Quq', 'user2@example.com', NULL, 'user2', 'Beta User', 'Test User 2', 1, NULL, NOW(), 0, 5, 0)
ON DUPLICATE KEY UPDATE password_ = VALUES(password_), status_ = 0;

INSERT INTO ujcms_user_ext (id_, birthday_, location_, bio_, created_, history_password_, login_date_, login_ip_, login_count_, error_date_, error_count_) 
VALUES (102, NULL, 'Shanghai, CN', 'Horizontal Test User B - IDOR Target Entity', NOW(), NULL, NOW(), '127.0.0.1', 0, NOW(), 0)
ON DUPLICATE KEY UPDATE login_ip_ = VALUES(login_ip_);
