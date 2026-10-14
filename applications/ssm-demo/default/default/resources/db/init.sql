SET NAMES utf8mb4;
CREATE DATABASE IF NOT EXISTS `weibo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `weibo`;

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `password` varchar(128) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `admin` (`admin_id`, `username`, `password`) VALUES
(1, 'admin', 'AdminPassword123!'),
(2, 'admin2', 'AdminPassword123!');

CREATE TABLE `location` (
  `id` varchar(32) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `location` (`id`, `name`) VALUES
('00', '北京市'),
('01', '上海市');

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `password` varchar(128) NOT NULL,
  `nickname` varchar(64) NOT NULL,
  `face` varchar(255) DEFAULT 'default.jpg',
  `sex` int(11) DEFAULT 1,
  `bir` date DEFAULT '1995-01-01',
  `province` varchar(32) DEFAULT '00',
  `city` varchar(32) DEFAULT '00',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `user` (`user_id`, `username`, `password`, `nickname`, `face`, `sex`, `bir`, `province`, `city`) VALUES
(1, 'user1', 'UserPassword123!', 'user1_nick', 'default.jpg', 1, '1995-01-01', '00', '00'),
(2, 'user2', 'UserPassword123!', 'user2_nick', 'default.jpg', 0, '1996-02-02', '00', '00');

CREATE TABLE `mention` (
  `mention_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `repostcount` int(11) DEFAULT 0,
  `commentcount` int(11) DEFAULT 0,
  `replycount` int(11) DEFAULT 0,
  `likecount` int(11) DEFAULT 0,
  `fanscount` int(11) DEFAULT 0,
  PRIMARY KEY (`mention_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `mention` (`mention_id`, `user_id`, `repostcount`, `commentcount`, `replycount`, `likecount`, `fanscount`) VALUES
(1, 1, 0, 0, 0, 0, 0),
(2, 2, 0, 0, 0, 0, 0);

CREATE TABLE `weibo` (
  `weibo_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `post_time` datetime NOT NULL,
  `content` varchar(1000) NOT NULL,
  `pic1` varchar(255) DEFAULT '',
  `pic2` varchar(255) DEFAULT '',
  `pic3` varchar(255) DEFAULT '',
  `pic4` varchar(255) DEFAULT '',
  `pic5` varchar(255) DEFAULT '',
  `pic6` varchar(255) DEFAULT '',
  `pic7` varchar(255) DEFAULT '',
  `pic8` varchar(255) DEFAULT '',
  `pic9` varchar(255) DEFAULT '',
  `original` int(11) DEFAULT 1,
  `repost_id` int(11) DEFAULT 0,
  PRIMARY KEY (`weibo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `weibo` (`weibo_id`, `user_id`, `post_time`, `content`, `original`, `repost_id`) VALUES
(1, 1, '2026-10-12 10:00:00', 'User1 Private Weibo Post for IDOR Testing', 1, 0),
(2, 2, '2026-10-12 10:05:00', 'User2 Private Weibo Post for IDOR Testing', 1, 0);

CREATE TABLE `relation` (
  `relation_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `followid` int(11) NOT NULL,
  `state` int(11) DEFAULT 1,
  PRIMARY KEY (`relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `collect` (
  `collect_id` int(11) NOT NULL AUTO_INCREMENT,
  `weibo_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `collect_time` datetime NOT NULL,
  PRIMARY KEY (`collect_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `collect` (`collect_id`, `weibo_id`, `user_id`, `collect_time`) VALUES
(1, 1, 1, '2026-10-12 10:10:00'),
(2, 2, 2, '2026-10-12 10:15:00');

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `weibo_id` int(11) NOT NULL,
  `comment_time` datetime NOT NULL,
  `comment_content` varchar(500) NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `reply` (
  `reply_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `content` varchar(500) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`reply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `likes` (
  `likes_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `weibo_id` int(11) NOT NULL,
  PRIMARY KEY (`likes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
