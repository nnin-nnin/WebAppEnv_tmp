SET NAMES utf8mb4;
CREATE DATABASE IF NOT EXISTS `wx-shop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `wx-shop`;

CREATE TABLE `account_level` (
  `id` varchar(64) NOT NULL,
  `account_id` int(11) DEFAULT '0',
  `name` varchar(64) DEFAULT NULL,
  `level` int(11) DEFAULT '1',
  `need_ronus_point` int(11) DEFAULT '0',
  `next_level_need_point` int(11) DEFAULT '100',
  `reduct_percent` double DEFAULT '1',
  `consume_scale` varchar(32) DEFAULT '1',
  `free_frequency` int(11) DEFAULT '0',
  `is_enable` tinyint(1) DEFAULT '1',
  `remarks` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(10) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `account` (
  `id` varchar(64) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `nickname` varchar(64) DEFAULT NULL,
  `account_level_id` varchar(64) DEFAULT NULL,
  `credit` varchar(32) DEFAULT 'WELL',
  `username` varchar(64) NOT NULL,
  `password` varchar(128) NOT NULL,
  `bonus_point_usable` int(11) DEFAULT '0',
  `bonus_point_upgrade` int(11) DEFAULT '100',
  `balance` decimal(10,2) DEFAULT '0.00',
  `is_employee` tinyint(1) DEFAULT '0',
  `ip` varchar(64) DEFAULT '127.0.0.1',
  `source_from` varchar(32) DEFAULT 'NO',
  `remarks` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(10) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `member` (
  `id` varchar(64) NOT NULL,
  `account_id` varchar(64) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `employer` varchar(128) DEFAULT NULL,
  `mobile` varchar(32) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `idcard` varchar(32) DEFAULT NULL,
  `sex` varchar(16) DEFAULT 'UNKNOW',
  `birthday` datetime DEFAULT NULL,
  `region_province_id` int(11) DEFAULT '110000',
  `region_city_id` int(11) DEFAULT '110100',
  `region_country_id` int(11) DEFAULT '110101',
  `telephone` varchar(32) DEFAULT NULL,
  `post_code` varchar(16) DEFAULT NULL,
  `income_month` varchar(32) DEFAULT NULL,
  `job` varchar(64) DEFAULT NULL,
  `hobby` varchar(128) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(10) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `delivery_address` (
  `id` varchar(64) NOT NULL,
  `account_id` varchar(64) NOT NULL,
  `region_province_id` varchar(32) DEFAULT '110000',
  `region_city_id` varchar(32) DEFAULT '110100',
  `region_country_id` varchar(32) DEFAULT '110101',
  `consignee` varchar(64) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobile` varchar(32) DEFAULT NULL,
  `sex` varchar(16) DEFAULT '1',
  `tag` varchar(32) DEFAULT 'HOME',
  `telephone` varchar(32) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `post_code` varchar(16) DEFAULT '100000',
  `is_default` tinyint(1) DEFAULT '1',
  `remarks` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(10) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `account_level` (`id`, `account_id`, `name`, `level`, `need_ronus_point`, `next_level_need_point`, `reduct_percent`, `consume_scale`, `free_frequency`, `is_enable`, `remarks`, `status`) VALUES
('lvl-admin', 1, '内部员工管理员级', 9, 0, 99999, 1.0, '1', 99, 1, 'Admin Level', '1'),
('lvl-user', 0, '普通会员级', 1, 0, 100, 1.0, '1', 0, 1, 'Standard Level', '1');

INSERT INTO `account` (`id`, `avatar`, `nickname`, `account_level_id`, `credit`, `username`, `password`, `bonus_point_usable`, `bonus_point_upgrade`, `balance`, `is_employee`, `ip`, `source_from`, `remarks`, `status`) VALUES
('acc-admin-1', '', 'Primary Admin', 'lvl-admin', 'WELL', 'admin', 'AdminPassword123!', 9999, 99999, 10000.00, 1, '127.0.0.1', 'NO', 'Primary Administrator', '1'),
('acc-admin-2', '', 'Secondary Admin', 'lvl-admin', 'WELL', 'admin2', 'AdminPassword123!', 9999, 99999, 10000.00, 1, '127.0.0.1', 'NO', 'Secondary Administrator', '1'),
('acc-user-1', '', 'Standard User 1', 'lvl-user', 'WELL', 'user1', 'UserPassword123!', 100, 100, 500.00, 0, '127.0.0.1', 'NO', 'Standard User A', '1'),
('acc-user-2', '', 'Standard User 2', 'lvl-user', 'WELL', 'user2', 'UserPassword123!', 200, 100, 300.00, 0, '127.0.0.1', 'NO', 'Standard User B', '1');

INSERT INTO `member` (`id`, `account_id`, `name`, `employer`, `mobile`, `address`, `email`, `idcard`, `sex`, `status`) VALUES
('mem-admin-1', 'acc-admin-1', 'Admin One', 'HQ', '13800000001', 'Admin HQ Bldg 1', 'admin@example.com', '110101199001010001', '1', '1'),
('mem-admin-2', 'acc-admin-2', 'Admin Two', 'HQ', '13800000002', 'Admin HQ Bldg 2', 'admin2@example.com', '110101199001010002', '1', '1'),
('mem-user-1', 'acc-user-1', 'User One', 'Corp A', '13800138001', 'User1 Private Rd 101', 'user1@example.com', '110101199201010001', '1', '1'),
('mem-user-2', 'acc-user-2', 'User Two', 'Corp B', '13800138002', 'User2 Private Rd 202', 'user2@example.com', '110101199201010002', '0', '1');

INSERT INTO `delivery_address` (`id`, `account_id`, `consignee`, `address`, `mobile`, `email`, `is_default`, `remarks`, `status`) VALUES
('addr-user-1', 'acc-user-1', 'User One', '北京市海淀区User1专属收货地址101号', '13800138001', 'user1@example.com', 1, 'User1 Isolated Address', '1'),
('addr-user-2', 'acc-user-2', 'User Two', '上海市浦东新区User2专属收货地址202号', '13800138002', 'user2@example.com', 1, 'User2 Isolated Address', '1');
