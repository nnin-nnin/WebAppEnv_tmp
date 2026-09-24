# TestLink Open Source Project - http://testlink.sourceforge.net/
# This script is distributed under the GNU General Public License 2 or later.
# ---------------------------------------------------------------------------------------
# @filesource testlink_create_tables.sql
#
# SQL script - create all DB tables for MySQL
# tables are in alphabetic order  
#
# ATTENTION: do not use a different naming convention, that one already in use.
#
# IMPORTANT NOTE:
# each NEW TABLE added here NEED TO BE DEFINED in object.class.php getDBTables()
#
# IMPORTANT NOTE - DATETIME or TIMESTAMP
# Extracted from MySQL Manual
#
# The TIMESTAMP column type provides a type that you can use to automatically 
# mark INSERT or UPDATE operations with the current date and time. 
# If you have multiple TIMESTAMP columns in a table, only the first one is updated automatically.
#
# Knowing this is clear that we can use in interchangable way DATETIME or TIMESTAMP
#
# Naming convention for column regarding date/time of creation or change
#
# Right or wrong from TL 1.7 we have used
#
# creation_ts
# modification_ts
#
# Then no other naming convention has to be used as:
# create_ts, modified_ts
#
# CRITIC:
# Because this file will be processed during installation doing text replaces
# to add TABLE PREFIX NAME, any NEW DDL CODE added must be respect present
# convention regarding case and spaces between DDL keywords.
# 
# ---------------------------------------------------------------------------------------
# @internal revisions
#
# ---------------------------------------------------------------------------------------


CREATE TABLE assignment_types (
  `id` int(10) unsigned NOT NULL auto_increment,
  `fk_table` varchar(30) default '',
  `description` varchar(100) NOT NULL default 'unknown',
  PRIMARY KEY  (`id`)
) DEFAULT CHARSET=utf8;


CREATE TABLE assignment_status (
  `id` int(10) unsigned NOT NULL auto_increment,
  `description` varchar(100) NOT NULL default 'unknown',
  PRIMARY KEY  (`id`)
) DEFAULT CHARSET=utf8;


CREATE TABLE attachments (
  `id` int(10) unsigned NOT NULL auto_increment,
  `fk_id` int(10) unsigned NOT NULL default '0',
  `fk_table` varchar(250) default '',
  `title` varchar(250) default '',
  `description` varchar(250) default '',
  `file_name` varchar(250) NOT NULL default '',
  `file_path` varchar(250) default '',
  `file_size` int(11) NOT NULL default '0',
  `file_type` varchar(250) NOT NULL default '',
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  `content` longblob,
  `compression_type` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY attachments_idx1(fk_id)
) DEFAULT CHARSET=utf8; 


CREATE TABLE builds (
  `id` int(10) unsigned NOT NULL auto_increment,
  `testplan_id` int(10) unsigned NOT NULL default '0',
  `name` varchar(100) NOT NULL default 'undefined',
  `notes` text,
  `active` tinyint(1) NOT NULL default '1',
  `is_open` tinyint(1) NOT NULL default '1',
  `author_id` int(10) unsigned default NULL,
  `creation_ts` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `release_date` date NULL,
  `closed_on_date` date NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY name (`testplan_id`,`name`),
  KEY testplan_id (`testplan_id`)
) DEFAULT CHARSET=utf8 COMMENT='Available builds';


CREATE TABLE cfield_build_design_values (
  `field_id` int(10) NOT NULL default '0',
  `node_id` int(10) NOT NULL default '0',
  `value` varchar(4000) NOT NULL default '',
  PRIMARY KEY  (`field_id`,`node_id`),
  KEY idx_cfield_build_design_values (`node_id`)
) DEFAULT CHARSET=utf8;


CREATE TABLE cfield_design_values (
  `field_id` int(10) NOT NULL default '0',
  `node_id` int(10) NOT NULL default '0',
  `value` varchar(4000) NOT NULL default '',
  PRIMARY KEY  (`field_id`,`node_id`),
  KEY idx_cfield_design_values (`node_id`)
) DEFAULT CHARSET=utf8;


CREATE TABLE cfield_execution_values (
  `field_id`     int(10) NOT NULL default '0',
  `execution_id` int(10) NOT NULL default '0',
  `testplan_id` int(10) NOT NULL default '0',
  `tcversion_id` int(10) NOT NULL default '0',
  `value` varchar(4000) NOT NULL default '',
  PRIMARY KEY  (`field_id`,`execution_id`,`testplan_id`,`tcversion_id`)
) DEFAULT CHARSET=utf8;


CREATE TABLE cfield_node_types (
  `field_id` int(10) NOT NULL default '0',
  `node_type_id` int(10) NOT NULL default '0',
  PRIMARY KEY  (`field_id`,`node_type_id`),
  KEY idx_custom_fields_assign (`node_type_id`)
) DEFAULT CHARSET=utf8;


CREATE TABLE cfield_testprojects (
  `field_id` int(10) unsigned NOT NULL default '0',
  `testproject_id` int(10) unsigned NOT NULL default '0',
  `display_order` smallint(5) unsigned NOT NULL default '1',
  `location` smallint(5) unsigned NOT NULL default '1',
  `active` tinyint(1) NOT NULL default '1',
  `required` tinyint(1) NOT NULL default '0',
  `required_on_design` tinyint(1) NOT NULL default '0',
  `required_on_execution` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`field_id`,`testproject_id`)
) DEFAULT CHARSET=utf8;


CREATE TABLE cfield_testplan_design_values (
  `field_id` int(10) NOT NULL default '0',
  `link_id` int(10) NOT NULL default '0' COMMENT 'point to testplan_tcversion id',   
  `value` varchar(4000) NOT NULL default '',
  PRIMARY KEY  (`field_id`,`link_id`),
  KEY idx_cfield_tplan_design_val (`link_id`)
) DEFAULT CHARSET=utf8;


# new fields to display custom fields in new areas
# test case linking to testplan (test plan design)
CREATE TABLE custom_fields (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(64) NOT NULL default '',
  `label` varchar(64) NOT NULL default '' COMMENT 'label to display on user interface' ,
  `type` smallint(6) NOT NULL default '0',
  `possible_values` varchar(4000) NOT NULL default '',
  `default_value` varchar(4000) NOT NULL default '',
  `valid_regexp` varchar(255) NOT NULL default '',
  `length_min` int(10) NOT NULL default '0',
  `length_max` int(10) NOT NULL default '0',
  `show_on_design` tinyint(3) unsigned NOT NULL default '1' COMMENT '1=> show it during specification design',
  `enable_on_design` tinyint(3) unsigned NOT NULL default '1' COMMENT '1=> user can write/manage it during specification design',
  `show_on_execution` tinyint(3) unsigned NOT NULL default '0' COMMENT '1=> show it during test case execution',
  `enable_on_execution` tinyint(3) unsigned NOT NULL default '0' COMMENT '1=> user can write/manage it during test case execution',
  `show_on_testplan_design` tinyint(3) unsigned NOT NULL default '0' ,
  `enable_on_testplan_design` tinyint(3) unsigned NOT NULL default '0' ,
  PRIMARY KEY  (`id`),
  UNIQUE KEY idx_custom_fields_name (`name`)
) DEFAULT CHARSET=utf8;


CREATE TABLE db_version (
  `version` varchar(50) NOT NULL default 'unknown',
  `upgrade_ts` datetime NOT NULL default '0000-00-00 00:00:00',
  `notes` text,
  PRIMARY KEY  (`version`)
) DEFAULT CHARSET=utf8;


CREATE TABLE events (
  `id` int(10) unsigned NOT NULL auto_increment,
  `transaction_id` int(10) unsigned NOT NULL default '0',
  `log_level` smallint(5) unsigned NOT NULL default '0',
  `source` varchar(45) default NULL,
  `description` text NOT NULL,
  `fired_at` int(10) unsigned NOT NULL default '0',
  `activity` varchar(45) default NULL,
  `object_id` int(10) unsigned default NULL,
  `object_type` varchar(45) default NULL,
  PRIMARY KEY  (`id`),
  KEY transaction_id (`transaction_id`),
  KEY fired_at (`fired_at`)
) DEFAULT CHARSET=utf8;


CREATE TABLE execution_bugs (
  `execution_id` int(10) unsigned NOT NULL default '0',
  `bug_id` varchar(64) NOT NULL default '0',
  PRIMARY KEY  (`execution_id`,`bug_id`)
) DEFAULT CHARSET=utf8;


CREATE TABLE executions (
  id int(10) unsigned NOT NULL auto_increment,
  build_id int(10) NOT NULL default '0',
  tester_id int(10) unsigned default NULL,
  execution_ts datetime default NULL,
  status char(1) default NULL,
  testplan_id int(10) unsigned NOT NULL default '0',
  tcversion_id int(10) unsigned NOT NULL default '0',
  tcversion_number smallint(5) unsigned NOT NULL default '1',
  platform_id int(10) unsigned NOT NULL default '0',
  execution_type tinyint(1) NOT NULL default '1' COMMENT '1 -> manual, 2 -> automated',
  execution_duration decimal(6,2) NULL COMMENT 'NULL will be considered as NO DATA Provided by user',
  notes text,
  PRIMARY KEY  (id),
  KEY executions_idx1(testplan_id,tcversion_id,platform_id,build_id),
  KEY executions_idx2(execution_type),
  KEY executions_idx3(tcversion_id)
) DEFAULT CHARSET=utf8;


CREATE TABLE execution_tcsteps (
   id int(10) unsigned NOT NULL auto_increment,
   execution_id int(10) unsigned NOT NULL default '0',
   tcstep_id int(10) unsigned NOT NULL default '0',
   notes text,
   status char(1) default NULL,
  PRIMARY KEY  (id),
  UNIQUE KEY execution_tcsteps_idx1(`execution_id`,`tcstep_id`)
) DEFAULT CHARSET=utf8;


CREATE TABLE inventory (
  id int(10) unsigned NOT NULL auto_increment,
	`testproject_id` INT( 10 ) UNSIGNED NOT NULL ,
	`owner_id` INT(10) UNSIGNED NOT NULL ,
	`name` VARCHAR(255) NOT NULL ,
	`ipaddress` VARCHAR(255)  NOT NULL ,
	`content` TEXT NULL ,
	`creation_ts` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`modification_ts` TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`),
	KEY inventory_idx1 (`testproject_id`)
) DEFAULT CHARSET=utf8; 


CREATE TABLE keywords (
  `id` int(10) unsigned NOT NULL auto_increment,
  `keyword` varchar(100) NOT NULL default '',
  `testproject_id` int(10) unsigned NOT NULL default '0',
  `notes` text,
  PRIMARY KEY  (`id`),
  KEY testproject_id (`testproject_id`),
  KEY keyword (`keyword`)
) DEFAULT CHARSET=utf8;


CREATE TABLE milestones (
  id int(10) unsigned NOT NULL auto_increment,
  testplan_id int(10) unsigned NOT NULL default '0',
  target_date date NULL,
  start_date date NOT NULL default '0000-00-00',
  a tinyint(3) unsigned NOT NULL default '0',
  b tinyint(3) unsigned NOT NULL default '0',
  c tinyint(3) unsigned NOT NULL default '0',
  name varchar(100) NOT NULL default 'undefined',
  PRIMARY KEY  (id),
  KEY testplan_id (`testplan_id`),
  UNIQUE KEY name_testplan_id (`name`,`testplan_id`)
) DEFAULT CHARSET=utf8;


CREATE TABLE node_types (
  `id` int(10) unsigned NOT NULL auto_increment,
  `description` varchar(100) NOT NULL default 'testproject',
  PRIMARY KEY  (`id`)
) DEFAULT CHARSET=utf8;


CREATE TABLE nodes_hierarchy (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `parent_id` int(10) unsigned default NULL,
  `node_type_id` int(10) unsigned NOT NULL default '1',
  `node_order` int(10) unsigned default NULL,
  PRIMARY KEY  (`id`),
  KEY pid_m_nodeorder (`parent_id`,`node_order`)
) DEFAULT CHARSET=utf8;


CREATE TABLE platforms (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(100) NOT NULL,
  testproject_id int(10) UNSIGNED NOT NULL,
  notes text NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY idx_platforms (testproject_id,name)
) DEFAULT CHARSET=utf8;


CREATE TABLE req_coverage (
  `req_id` int(10) NOT NULL,
  `testcase_id` int(10) NOT NULL,
  `author_id` int(10) unsigned default NULL,
  `creation_ts` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `review_requester_id` int(10) unsigned default NULL,
  `review_request_ts` TIMESTAMP NULL DEFAULT NULL,
  KEY req_testcase (`req_id`,`testcase_id`)
) DEFAULT CHARSET=utf8 COMMENT='relation test case ** requirements';

CREATE TABLE req_specs (
  `id` int(10) unsigned NOT NULL,
  `testproject_id` int(10) unsigned NOT NULL,
  `doc_id` varchar(64) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY testproject_id (`testproject_id`),
  UNIQUE KEY req_spec_uk1(`doc_id`,`testproject_id`)
) DEFAULT CHARSET=utf8 COMMENT='Dev. Documents (e.g. System Requirements Specification)';

CREATE TABLE requirements (
  `id` int(10) unsigned NOT NULL,
  `srs_id` int(10) unsigned NOT NULL,
  `req_doc_id` varchar(64) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY requirements_req_doc_id (`srs_id`,`req_doc_id`)
) DEFAULT CHARSET=utf8;

CREATE TABLE req_versions (
  `id` int(10) unsigned NOT NULL,
  `version` smallint(5) unsigned NOT NULL default '1',
  `revision` smallint(5) unsigned NOT NULL default '1', 
  `scope` text,
  `status` char(1) NOT NULL default 'V',
  `type` char(1) default NULL,
  `active` tinyint(1) NOT NULL default '1',
  `is_open` tinyint(1) NOT NULL default '1',
  `expected_coverage` int(10) NOT NULL default '1',
  `author_id` int(10) unsigned default NULL,
  `creation_ts` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_id` int(10) unsigned default NULL,
  `modification_ts` datetime NOT NULL default '0000-00-00 00:00:00',
  `log_message` text,
  PRIMARY KEY  (`id`)
) DEFAULT CHARSET=utf8;

CREATE TABLE req_relations (
  `id` int(10) unsigned NOT NULL auto_increment,
  `source_id` int(10) unsigned NOT NULL,
  `destination_id` int(10) unsigned NOT NULL,
  `relation_type` smallint(5) unsigned NOT NULL default '1',
  `author_id` int(10) unsigned default NULL,
  `creation_ts` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) DEFAULT CHARSET=utf8;


CREATE TABLE rights (
  `id` int(10) unsigned NOT NULL auto_increment,
  `description` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY rights_descr (`description`)
) DEFAULT CHARSET=utf8;


CREATE TABLE risk_assignments (
  `id` int(10) unsigned NOT NULL auto_increment,
  `testplan_id` int(10) unsigned NOT NULL default '0',
  `node_id` int(10) unsigned NOT NULL default '0',
  `risk` char(1) NOT NULL default '2',
  `importance` char(1) NOT NULL default 'M',
  PRIMARY KEY  (`id`),
  UNIQUE KEY risk_assignments_tplan_node_id (`testplan_id`,`node_id`)
) DEFAULT CHARSET=utf8;


CREATE TABLE role_rights (
  `role_id` int(10) NOT NULL default '0',
  `right_id` int(10) NOT NULL default '0',
  PRIMARY KEY  (`role_id`,`right_id`)
) DEFAULT CHARSET=utf8;


CREATE TABLE roles (
  `id` int(10) unsigned NOT NULL auto_increment,
  `description` varchar(100) NOT NULL default '',
  `notes` text,
  PRIMARY KEY  (`id`),
  UNIQUE KEY role_rights_roles_descr (`description`)
) DEFAULT CHARSET=utf8;


CREATE TABLE testcase_keywords (
  `testcase_id` int(10) unsigned NOT NULL default '0',
  `keyword_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`testcase_id`,`keyword_id`)
) DEFAULT CHARSET=utf8;

CREATE TABLE tcversions (
  `id` int(10) unsigned NOT NULL,
  `tc_external_id` int(10) unsigned NULL,
  `version` smallint(5) unsigned NOT NULL default '1',
  `layout` smallint(5) unsigned NOT NULL default '1',
  `status` smallint(5) unsigned NOT NULL default '1',
  `summary` text,
  `preconditions` text,
  `importance` smallint(5) unsigned NOT NULL default '2',
  `author_id` int(10) unsigned default NULL,
  `creation_ts` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater_id` int(10) unsigned default NULL,
  `modification_ts` datetime NOT NULL default '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL default '1',
  `is_open` tinyint(1) NOT NULL default '1',
  `execution_type` tinyint(1) NOT NULL default '1' COMMENT '1 -> manual, 2 -> automated',
  `estimated_exec_duration` decimal(6,2) NULL COMMENT 'NULL will be considered as NO DATA Provided by user',
  PRIMARY KEY  (`id`)
) DEFAULT CHARSET=utf8;


CREATE TABLE tcsteps (  
  id int(10) unsigned NOT NULL,
  step_number INT NOT NULL DEFAULT '1',
  actions TEXT,
  expected_results TEXT,
  active tinyint(1) NOT NULL default '1',
  execution_type tinyint(1) NOT NULL default '1' COMMENT '1 -> manual, 2 -> automated',
  PRIMARY KEY (id)
) DEFAULT CHARSET=utf8;


CREATE TABLE testplan_tcversions (
  id int(10) unsigned NOT NULL auto_increment,
  testplan_id int(10) unsigned NOT NULL default '0',
  tcversion_id int(10) unsigned NOT NULL default '0',
  node_order int(10) unsigned NOT NULL default '1',
  urgency smallint(5) NOT NULL default '2',
  platform_id int(10) unsigned NOT NULL default '0',
  author_id int(10) unsigned default NULL,
  creation_ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY  (id),
  UNIQUE KEY testplan_tcversions_tplan_tcversion (testplan_id,tcversion_id,platform_id)
) DEFAULT CHARSET=utf8;


CREATE TABLE testplans (
  `id` int(10) unsigned NOT NULL,
  `testproject_id` int(10) unsigned NOT NULL default '0',
  `notes` text,
  `active` tinyint(1) NOT NULL default '1',
  `is_open` tinyint(1) NOT NULL default '1',
  `is_public` tinyint(1) NOT NULL default '1',
  `api_key` varchar(64) NOT NULL default '829a2ded3ed0829a2dedd8ab81dfa2c77e8235bc3ed0d8ab81dfa2c77e8235bc',
  PRIMARY KEY  (`id`),
  KEY testplans_testproject_id_active (`testproject_id`,`active`),
  UNIQUE KEY testplans_api_key (`api_key`) 
) DEFAULT CHARSET=utf8;


CREATE TABLE testplan_platforms (
  id int(10) unsigned NOT NULL auto_increment,
  testplan_id int(10) unsigned NOT NULL,
  platform_id int(10) unsigned NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY idx_testplan_platforms(testplan_id,platform_id)
) DEFAULT CHARSET=utf8 COMMENT='Connects a testplan with platforms';


CREATE TABLE testprojects (
  `id` int(10) unsigned NOT NULL,
  `notes` text,
  `color` varchar(12) NOT NULL default '#9BD',
  `active` tinyint(1) NOT NULL default '1',
  `option_reqs` tinyint(1) NOT NULL default '0',
  `option_priority` tinyint(1) NOT NULL default '0',
  `option_automation` tinyint(1) NOT NULL default '0',  
  `options` text,
  `prefix` varchar(16) NOT NULL,
  `tc_counter` int(10) unsigned NOT NULL default '0',
  `is_public` tinyint(1) NOT NULL default '1',
  `issue_tracker_enabled` tinyint(1) NOT NULL default '0',
  `reqmgr_integration_enabled` tinyint(1) NOT NULL default '0',
  `api_key` varchar(64) NOT NULL default '0d8ab81dfa2c77e8235bc829a2ded3edfa2c78235bc829a27eded3ed0d8ab81d',
  PRIMARY KEY  (`id`),
  KEY testprojects_id_active (`id`,`active`),
  UNIQUE KEY testprojects_prefix (`prefix`),
  UNIQUE KEY testprojects_api_key (`api_key`) 
) DEFAULT CHARSET=utf8;


CREATE TABLE testsuites (
  `id` int(10) unsigned NOT NULL,
  `details` text,
  PRIMARY KEY  (`id`)
) DEFAULT CHARSET=utf8;


CREATE TABLE transactions (
  `id` int(10) unsigned NOT NULL auto_increment,
  `entry_point` varchar(45) NOT NULL default '',
  `start_time` int(10) unsigned NOT NULL default '0',
  `end_time` int(10) unsigned NOT NULL default '0',
  `user_id` int(10) unsigned NOT NULL default '0',
  `session_id` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) DEFAULT CHARSET=utf8;


CREATE TABLE user_assignments (
  `id` int(10) unsigned NOT NULL auto_increment,
  `type` int(10) unsigned NOT NULL default '1',
  `feature_id` int(10) unsigned NOT NULL default '0',
  `user_id` int(10) unsigned default '0',
  `build_id` int(10) unsigned default '0',
  `deadline_ts` datetime NULL,
  `assigner_id`  int(10) unsigned default '0',
  `creation_ts` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(10) unsigned default '1',
  PRIMARY KEY  (`id`),
  KEY user_assignments_feature_id (`feature_id`)
) DEFAULT CHARSET=utf8;


CREATE TABLE users (
  `id` int(10) unsigned NOT NULL auto_increment,
  `login` varchar(30) NOT NULL default '',
  `password` varchar(32) NOT NULL default '',
  `role_id` int(10) unsigned NOT NULL default '0',
  `email` varchar(100) NOT NULL default '',
  `first` varchar(30) NOT NULL default '',
  `last` varchar(30) NOT NULL default '',
  `locale` varchar(10) NOT NULL default 'en_GB',
  `default_testproject_id` int(10) default NULL,
  `active` tinyint(1) NOT NULL default '1',
  `script_key` varchar(32) NULL,
  `cookie_string` varchar(64) NOT NULL default '',
  `auth_method` varchar(10) NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY users_login (`login`),
  UNIQUE KEY users_cookie_string (`cookie_string`)
) DEFAULT CHARSET=utf8 COMMENT='User information';


CREATE TABLE user_testproject_roles (
  `user_id` int(10) NOT NULL default '0',
  `testproject_id` int(10) NOT NULL default '0',
  `role_id` int(10) NOT NULL default '0',
  PRIMARY KEY  (`user_id`,`testproject_id`)
) DEFAULT CHARSET=utf8;


CREATE TABLE user_testplan_roles (
  `user_id` int(10) NOT NULL default '0',
  `testplan_id` int(10) NOT NULL default '0',
  `role_id` int(10) NOT NULL default '0',
  PRIMARY KEY  (`user_id`,`testplan_id`)
) DEFAULT CHARSET=utf8;


CREATE TABLE object_keywords (
  `id` int(10) unsigned NOT NULL auto_increment,
  `fk_id` int(10) unsigned NOT NULL default '0',
  `fk_table` varchar(30) default '',
  `keyword_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) DEFAULT CHARSET=utf8; 


# not used - group users for large companies 
CREATE TABLE user_group (
  `id` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(100) NOT NULL,
  `description` text,
  PRIMARY KEY  (`id`),
  UNIQUE KEY idx_user_group (`title`)
) DEFAULT CHARSET=utf8;


# not used - group users for large companies 
CREATE TABLE user_group_assign (
  `usergroup_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  UNIQUE KEY idx_user_group_assign (`usergroup_id`,`user_id`)
) DEFAULT CHARSET=utf8;




# ----------------------------------------------------------------------------------
# BUGID 4056
# ----------------------------------------------------------------------------------
CREATE TABLE req_revisions (
  `parent_id` int(10) unsigned NOT NULL,
  `id` int(10) unsigned NOT NULL,
  `revision` smallint(5) unsigned NOT NULL default '1',
  `req_doc_id` varchar(64) NULL,   /* it's OK to allow a simple update query on code */
  `name` varchar(100) NULL,
  `scope` text,
  `status` char(1) NOT NULL default 'V',
  `type` char(1) default NULL,
  `active` tinyint(1) NOT NULL default '1',
  `is_open` tinyint(1) NOT NULL default '1',
  `expected_coverage` int(10) NOT NULL default '1',
  `log_message` text,
  `author_id` int(10) unsigned default NULL,
  `creation_ts` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_id` int(10) unsigned default NULL,
  `modification_ts` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`),
  UNIQUE KEY req_revisions_uidx1 (`parent_id`,`revision`)
) DEFAULT CHARSET=utf8;



# ----------------------------------------------------------------------------------
# TICKET 4661
# ----------------------------------------------------------------------------------
CREATE TABLE req_specs_revisions (
  `parent_id` int(10) unsigned NOT NULL,
  `id` int(10) unsigned NOT NULL,
  `revision` smallint(5) unsigned NOT NULL default '1',
  `doc_id` varchar(64) NULL,   /* it's OK to allow a simple update query on code */
  `name` varchar(100) NULL,
  `scope` text,
  `total_req` int(10) NOT NULL default '0',  
  `status` int(10) unsigned default '1',
  `type` char(1) default NULL,
  `log_message` text,
  `author_id` int(10) unsigned default NULL,
  `creation_ts` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_id` int(10) unsigned default NULL,
  `modification_ts` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`),
  UNIQUE KEY req_specs_revisions_uidx1 (`parent_id`,`revision`)
) DEFAULT CHARSET=utf8;


CREATE TABLE issuetrackers
(
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `type` int(10) default 0,
  `cfg` text,
  PRIMARY KEY  (`id`),
  UNIQUE KEY issuetrackers_uidx1 (`name`)
) DEFAULT CHARSET=utf8;


CREATE TABLE testproject_issuetracker
(
  `testproject_id` int(10) unsigned NOT NULL,
  `issuetracker_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`testproject_id`)
) DEFAULT CHARSET=utf8;


CREATE TABLE reqmgrsystems
(
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `type` int(10) default 0,
  `cfg` text,
  PRIMARY KEY  (`id`),
  UNIQUE KEY reqmgrsystems_uidx1 (`name`)
) DEFAULT CHARSET=utf8;


CREATE TABLE testproject_reqmgrsystem
(
  `testproject_id` int(10) unsigned NOT NULL,
  `reqmgrsystem_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`testproject_id`)
) DEFAULT CHARSET=utf8;

CREATE TABLE text_templates (
  id int(10) unsigned NOT NULL,
  type smallint(5) unsigned NOT NULL,
  title varchar(100) NOT NULL,
  template_data text,
  author_id int(10) unsigned default NULL,
  creation_ts datetime NOT NULL default '1900-00-00 01:00:00',
  is_public tinyint(1) NOT NULL default '0',
  UNIQUE KEY idx_text_templates (type,title)
) DEFAULT CHARSET=utf8 COMMENT='Global Project Templates';



CREATE TABLE testcase_relations (
  `id` int(10) unsigned NOT NULL auto_increment,
  `source_id` int(10) unsigned NOT NULL,
  `destination_id` int(10) unsigned NOT NULL,
  `relation_type` smallint(5) unsigned NOT NULL default '1',
  `author_id` int(10) unsigned default NULL,
  `creation_ts` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) DEFAULT CHARSET=utf8;
# TestLink Open Source Project - http://testlink.sourceforge.net/
# testlink_create_default_data.sql
# SQL script - create default data (rights & admin account)
#
# Database Type: MySQL
# ---------------------------------------------------------------------------------

# Database version
INSERT INTO db_version (version,notes,upgrade_ts) VALUES('DB 1.9.14', 'TestLink 1.9.14',CURRENT_TIMESTAMP());

# Node types -
INSERT INTO node_types  (id,description) VALUES (1,'testproject');
INSERT INTO node_types  (id,description) VALUES (2,'testsuite');
INSERT INTO node_types  (id,description) VALUES (3,'testcase');
INSERT INTO node_types  (id,description) VALUES (4,'testcase_version');
INSERT INTO node_types  (id,description) VALUES (5,'testplan');
INSERT INTO node_types  (id,description) VALUES (6,'requirement_spec');
INSERT INTO node_types  (id,description) VALUES (7,'requirement');
INSERT INTO node_types  (id,description) VALUES (8,'requirement_version');
INSERT INTO node_types  (id,description) VALUES (9,'testcase_step');
INSERT INTO node_types  (id,description) VALUES (10,'requirement_revision');
INSERT INTO node_types  (id,description) VALUES (11,'requirement_spec_revision');
INSERT INTO node_types  (id,description) VALUES (12,'build');
INSERT INTO node_types  (id,description) VALUES (13,'platform');
INSERT INTO node_types  (id,description) VALUES (14,'user');


# Roles -
INSERT INTO roles  (id,description) VALUES (1, '<reserved system role 1>');
INSERT INTO roles  (id,description) VALUES (2, '<reserved system role 2>');
INSERT INTO roles  (id,description) VALUES (3, '<no rights>');
INSERT INTO roles  (id,description) VALUES (4, 'test designer');
INSERT INTO roles  (id,description) VALUES (5, 'guest');
INSERT INTO roles  (id,description) VALUES (6, 'senior tester');
INSERT INTO roles  (id,description) VALUES (7, 'tester');
INSERT INTO roles  (id,description) VALUES (8, 'admin');
INSERT INTO roles  (id,description) VALUES (9, 'leader');

# Rights - 
INSERT INTO rights  (id,description) VALUES (1 ,'testplan_execute');
INSERT INTO rights  (id,description) VALUES (2 ,'testplan_create_build');
INSERT INTO rights  (id,description) VALUES (3 ,'testplan_metrics');
INSERT INTO rights  (id,description) VALUES (4 ,'testplan_planning');
INSERT INTO rights  (id,description) VALUES (5 ,'testplan_user_role_assignment');
INSERT INTO rights  (id,description) VALUES (6 ,'mgt_view_tc');
INSERT INTO rights  (id,description) VALUES (7 ,'mgt_modify_tc');
INSERT INTO rights  (id,description) VALUES (8 ,'mgt_view_key');
INSERT INTO rights  (id,description) VALUES (9 ,'mgt_modify_key');
INSERT INTO rights  (id,description) VALUES (10,'mgt_view_req');
INSERT INTO rights  (id,description) VALUES (11,'mgt_modify_req');
INSERT INTO rights  (id,description) VALUES (12,'mgt_modify_product');
INSERT INTO rights  (id,description) VALUES (13,'mgt_users');
INSERT INTO rights  (id,description) VALUES (14,'role_management');
INSERT INTO rights  (id,description) VALUES (15,'user_role_assignment');
INSERT INTO rights  (id,description) VALUES (16,'mgt_testplan_create');
INSERT INTO rights  (id,description) VALUES (17,'cfield_view');
INSERT INTO rights  (id,description) VALUES (18,'cfield_management');
INSERT INTO rights  (id,description) VALUES (19,'system_configuration');
INSERT INTO rights  (id,description) VALUES (20,'mgt_view_events');
INSERT INTO rights  (id,description) VALUES (21,'mgt_view_usergroups');
INSERT INTO rights  (id,description) VALUES (22,'events_mgt');
INSERT INTO rights  (id,description) VALUES (23,'testproject_user_role_assignment');
INSERT INTO rights  (id,description) VALUES (24,'platform_management');
INSERT INTO rights  (id,description) VALUES (25,'platform_view');
INSERT INTO rights  (id,description) VALUES (26,'project_inventory_management');
INSERT INTO rights  (id,description) VALUES (27,'project_inventory_view');
INSERT INTO rights  (id,description) VALUES (28,'req_tcase_link_management');
INSERT INTO rights  (id,description) VALUES (29,'keyword_assignment');
INSERT INTO rights  (id,description) VALUES (30,'mgt_unfreeze_req');
INSERT INTO rights  (id,description) VALUES (31,'issuetracker_management');
INSERT INTO rights  (id,description) VALUES (32,'issuetracker_view');
INSERT INTO rights  (id,description) VALUES (33,'reqmgrsystem_management');
INSERT INTO rights  (id,description) VALUES (34,'reqmgrsystem_view');
INSERT INTO rights  (id,description) VALUES (35,'exec_edit_notes');
INSERT INTO rights  (id,description) VALUES (36,'exec_delete');
INSERT INTO rights  (id,description) VALUES (37,'testplan_unlink_executed_testcases');
INSERT INTO rights  (id,description) VALUES (38,'testproject_delete_executed_testcases');
INSERT INTO rights  (id,description) VALUES (39,'testproject_edit_executed_testcases');

# since 1.9.10
INSERT INTO rights  (id,description) VALUES (40,'testplan_milestone_overview');
INSERT INTO rights  (id,description) VALUES (41,'exec_testcases_assigned_to_me');
INSERT INTO rights  (id,description) VALUES (42,'testproject_metrics_dashboard');
INSERT INTO rights  (id,description) VALUES (43,'testplan_add_remove_platforms');
INSERT INTO rights  (id,description) VALUES (44,'testplan_update_linked_testcase_versions');
INSERT INTO rights  (id,description) VALUES (45,'testplan_set_urgent_testcases');
INSERT INTO rights  (id,description) VALUES (46,'testplan_show_testcases_newest_versions');



# Rights for Administrator role
INSERT INTO role_rights (role_id,right_id) VALUES (8,1 );
INSERT INTO role_rights (role_id,right_id) VALUES (8,2 );
INSERT INTO role_rights (role_id,right_id) VALUES (8,3 );
INSERT INTO role_rights (role_id,right_id) VALUES (8,4 );
INSERT INTO role_rights (role_id,right_id) VALUES (8,5 );
INSERT INTO role_rights (role_id,right_id) VALUES (8,6 );
INSERT INTO role_rights (role_id,right_id) VALUES (8,7 );
INSERT INTO role_rights (role_id,right_id) VALUES (8,8 );
INSERT INTO role_rights (role_id,right_id) VALUES (8,9 );
INSERT INTO role_rights (role_id,right_id) VALUES (8,10);
INSERT INTO role_rights (role_id,right_id) VALUES (8,11);
INSERT INTO role_rights (role_id,right_id) VALUES (8,12);
INSERT INTO role_rights (role_id,right_id) VALUES (8,13);
INSERT INTO role_rights (role_id,right_id) VALUES (8,14);
INSERT INTO role_rights (role_id,right_id) VALUES (8,15);
INSERT INTO role_rights (role_id,right_id) VALUES (8,16);
INSERT INTO role_rights (role_id,right_id) VALUES (8,17);
INSERT INTO role_rights (role_id,right_id) VALUES (8,18);
INSERT INTO role_rights (role_id,right_id) VALUES (8,19);
INSERT INTO role_rights (role_id,right_id) VALUES (8,20);
INSERT INTO role_rights (role_id,right_id) VALUES (8,21);
INSERT INTO role_rights (role_id,right_id) VALUES (8,22);
INSERT INTO role_rights (role_id,right_id) VALUES (8,23);
INSERT INTO role_rights (role_id,right_id) VALUES (8,24);
INSERT INTO role_rights (role_id,right_id) VALUES (8,25);
INSERT INTO role_rights (role_id,right_id) VALUES (8,26);
INSERT INTO role_rights (role_id,right_id) VALUES (8,27);
INSERT INTO role_rights (role_id,right_id) VALUES (8,30);
INSERT INTO role_rights (role_id,right_id) VALUES (8,31);
INSERT INTO role_rights (role_id,right_id) VALUES (8,32);
INSERT INTO role_rights (role_id,right_id) VALUES (8,33);
INSERT INTO role_rights (role_id,right_id) VALUES (8,34);
INSERT INTO role_rights (role_id,right_id) VALUES (8,35);
INSERT INTO role_rights (role_id,right_id) VALUES (8,36);
INSERT INTO role_rights (role_id,right_id) VALUES (8,37);
INSERT INTO role_rights (role_id,right_id) VALUES (8,38);
INSERT INTO role_rights (role_id,right_id) VALUES (8,39);
INSERT INTO role_rights (role_id,right_id) VALUES (8,40);
INSERT INTO role_rights (role_id,right_id) VALUES (8,41);
INSERT INTO role_rights (role_id,right_id) VALUES (8,42);
INSERT INTO role_rights (role_id,right_id) VALUES (8,43);
INSERT INTO role_rights (role_id,right_id) VALUES (8,44);
INSERT INTO role_rights (role_id,right_id) VALUES (8,45);
INSERT INTO role_rights (role_id,right_id) VALUES (8,46);


# Rights for guest role
INSERT INTO role_rights (role_id,right_id) VALUES (5,3 );
INSERT INTO role_rights (role_id,right_id) VALUES (5,6 );
INSERT INTO role_rights (role_id,right_id) VALUES (5,8 );

# Rights for test designer role
INSERT INTO role_rights (role_id,right_id) VALUES (4,3 );
INSERT INTO role_rights (role_id,right_id) VALUES (4,6 );
INSERT INTO role_rights (role_id,right_id) VALUES (4,7 );
INSERT INTO role_rights (role_id,right_id) VALUES (4,8 );
INSERT INTO role_rights (role_id,right_id) VALUES (4,9 );
INSERT INTO role_rights (role_id,right_id) VALUES (4,10);
INSERT INTO role_rights (role_id,right_id) VALUES (4,11);

# Rights for tester role
INSERT INTO role_rights (role_id,right_id) VALUES (7,1 );
INSERT INTO role_rights (role_id,right_id) VALUES (7,3 );
INSERT INTO role_rights (role_id,right_id) VALUES (7,6 );
INSERT INTO role_rights (role_id,right_id) VALUES (7,8 );

# Rights for senior tester role
INSERT INTO role_rights (role_id,right_id) VALUES (6,1 );
INSERT INTO role_rights (role_id,right_id) VALUES (6,2 );
INSERT INTO role_rights (role_id,right_id) VALUES (6,3 );
INSERT INTO role_rights (role_id,right_id) VALUES (6,6 );
INSERT INTO role_rights (role_id,right_id) VALUES (6,7 );
INSERT INTO role_rights (role_id,right_id) VALUES (6,8 );
INSERT INTO role_rights (role_id,right_id) VALUES (6,9 );
INSERT INTO role_rights (role_id,right_id) VALUES (6,11);
INSERT INTO role_rights (role_id,right_id) VALUES (6,25);
INSERT INTO role_rights (role_id,right_id) VALUES (6,27);

# Rights for leader role
INSERT INTO role_rights (role_id,right_id) VALUES (9,1 );
INSERT INTO role_rights (role_id,right_id) VALUES (9,2 );
INSERT INTO role_rights (role_id,right_id) VALUES (9,3 );
INSERT INTO role_rights (role_id,right_id) VALUES (9,4 );
INSERT INTO role_rights (role_id,right_id) VALUES (9,5 );
INSERT INTO role_rights (role_id,right_id) VALUES (9,6 );
INSERT INTO role_rights (role_id,right_id) VALUES (9,7 );
INSERT INTO role_rights (role_id,right_id) VALUES (9,8 );
INSERT INTO role_rights (role_id,right_id) VALUES (9,9 );
INSERT INTO role_rights (role_id,right_id) VALUES (9,10);
INSERT INTO role_rights (role_id,right_id) VALUES (9,11);
INSERT INTO role_rights (role_id,right_id) VALUES (9,15);
INSERT INTO role_rights (role_id,right_id) VALUES (9,16);
INSERT INTO role_rights (role_id,right_id) VALUES (9,24);
INSERT INTO role_rights (role_id,right_id) VALUES (9,25);
INSERT INTO role_rights (role_id,right_id) VALUES (9,26);
INSERT INTO role_rights (role_id,right_id) VALUES (9,27);

# admin account 
# SECURITY: change password after first login
#
# TICKET 4342: Security problem with multiple Testlink installations on the same server 
INSERT INTO users (login,password,role_id,email,first,last,locale,active,cookie_string)
			VALUES ('admin',MD5('admin'), 8,'', 'Testlink','Administrator', 'en_GB',1,CONCAT(MD5(RAND()),MD5('admin')));


# Assignment types
INSERT INTO assignment_types (id,fk_table,description) VALUES(1,'testplan_tcversions','testcase_execution');
INSERT INTO assignment_types (id,fk_table,description) VALUES(2,'tcversions','testcase_review');

# Assignment status
INSERT INTO assignment_status (id,description) VALUES(1,'open');
INSERT INTO assignment_status (id,description) VALUES(2,'closed');
INSERT INTO assignment_status (id,description) VALUES(3,'completed');
INSERT INTO assignment_status (id,description) VALUES(4,'todo_urgent');
INSERT INTO assignment_status (id,description) VALUES(5,'todo');