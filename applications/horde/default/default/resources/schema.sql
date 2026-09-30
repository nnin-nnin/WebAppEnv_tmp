-- Horde base SQL schema for MySQL/MariaDB
CREATE TABLE IF NOT EXISTS `horde_users` (
  `user_uid` varchar(255) NOT NULL,
  `user_pass` varchar(255) NOT NULL,
  `user_soft_expiration_date` int(11) DEFAULT NULL,
  `user_hard_expiration_date` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `horde_prefs` (
  `pref_uid` varchar(255) NOT NULL,
  `pref_scope` varchar(16) NOT NULL DEFAULT '',
  `pref_name` varchar(32) NOT NULL,
  `pref_value` longtext,
  PRIMARY KEY (`pref_uid`,`pref_scope`,`pref_name`),
  KEY `horde_prefs_pref_uid_idx` (`pref_uid`),
  KEY `horde_prefs_pref_scope_idx` (`pref_scope`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `horde_groups` (
  `group_uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL,
  `group_parents` varchar(255) NOT NULL,
  `group_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`group_uid`),
  UNIQUE KEY `horde_groups_group_name_idx` (`group_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `horde_groups_members` (
  `group_uid` int(10) unsigned NOT NULL,
  `user_uid` varchar(255) NOT NULL,
  KEY `horde_groups_members_group_uid_idx` (`group_uid`),
  KEY `horde_groups_members_user_uid_idx` (`user_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `horde_perms` (
  `perm_id` int(11) NOT NULL AUTO_INCREMENT,
  `perm_name` varchar(255) NOT NULL,
  `perm_parents` varchar(255) NOT NULL,
  `perm_data` text,
  PRIMARY KEY (`perm_id`),
  UNIQUE KEY `horde_perms_perm_name_idx` (`perm_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `horde_locks` (
  `lock_id` varchar(36) NOT NULL,
  `lock_owner` varchar(32) NOT NULL,
  `lock_scope` varchar(32) NOT NULL,
  `lock_principal` varchar(255) NOT NULL,
  `lock_origin_timestamp` bigint(20) NOT NULL,
  `lock_update_timestamp` bigint(20) NOT NULL,
  `lock_expiry_timestamp` bigint(20) NOT NULL,
  `lock_type` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`lock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `horde_tokens` (
  `token_address` varchar(100) NOT NULL,
  `token_id` varchar(32) NOT NULL,
  `token_timestamp` bigint(20) NOT NULL,
  PRIMARY KEY (`token_address`,`token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `horde_alarms` (
  `alarm_id` varchar(255) NOT NULL,
  `alarm_uid` varchar(255) DEFAULT NULL,
  `alarm_start` datetime NOT NULL,
  `alarm_end` datetime DEFAULT NULL,
  `alarm_methods` varchar(255) DEFAULT NULL,
  `alarm_params` text,
  `alarm_title` varchar(255) NOT NULL,
  `alarm_text` text,
  `alarm_snooze` datetime DEFAULT NULL,
  `alarm_dismissed` tinyint(1) NOT NULL DEFAULT 0,
  `alarm_internal` text,
  PRIMARY KEY (`alarm_id`),
  KEY `horde_alarms_alarm_uid_idx` (`alarm_uid`),
  KEY `horde_alarms_alarm_start_idx` (`alarm_start`),
  KEY `horde_alarms_alarm_end_idx` (`alarm_end`),
  KEY `horde_alarms_alarm_snooze_idx` (`alarm_snooze`),
  KEY `horde_alarms_alarm_dismissed_idx` (`alarm_dismissed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `horde_histories` (
  `history_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `object_uid` varchar(255) NOT NULL,
  `history_action` varchar(32) NOT NULL,
  `history_ts` bigint(20) NOT NULL,
  `history_desc` text,
  `history_who` varchar(255) DEFAULT NULL,
  `history_extra` text,
  PRIMARY KEY (`history_id`),
  KEY `horde_histories_history_action_idx` (`history_action`),
  KEY `horde_histories_history_ts_idx` (`history_ts`),
  KEY `horde_histories_object_uid_idx` (`object_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `horde_sessionhandler` (
  `session_id` varchar(32) NOT NULL,
  `session_lastmodified` int(11) NOT NULL,
  `session_data` longblob,
  PRIMARY KEY (`session_id`),
  KEY `horde_sessionhandler_session_lastmodified_idx` (`session_lastmodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
