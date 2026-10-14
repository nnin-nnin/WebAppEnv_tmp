CREATE DATABASE IF NOT EXISTS webchess CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE webchess;

CREATE TABLE IF NOT EXISTS games (
	gameID SMALLINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	whitePlayer MEDIUMINT NOT NULL,
	blackPlayer MEDIUMINT NOT NULL,
	gameMessage ENUM('', 'playerInvited', 'inviteDeclined', 'draw', 'playerResigned', 'checkMate') NULL,
	messageFrom ENUM('', 'black', 'white') NULL,
	dateCreated DATETIME NOT NULL,
	lastMove DATETIME NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS history (
	timeOfMove DATETIME NOT NULL,
	gameID SMALLINT NOT NULL,
	curPiece ENUM('pawn', 'bishop', 'knight', 'rook', 'queen', 'king') NOT NULL,
	curColor ENUM('white', 'black') NOT NULL,
	fromRow SMALLINT NOT NULL,
	fromCol SMALLINT NOT NULL,
	toRow SMALLINT NOT NULL,
	toCol SMALLINT NOT NULL,
	replaced ENUM('pawn', 'bishop', 'knight', 'rook', 'queen', 'king') NULL,
	promotedTo ENUM('pawn', 'bishop', 'knight', 'rook', 'queen', 'king') NULL,
	isInCheck BOOL NOT NULL,
	PRIMARY KEY(timeOfMove, gameID),
	INDEX idx_gameID (gameID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS messages (
	msgID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	gameID SMALLINT NOT NULL,
	msgType ENUM('undo', 'draw') NOT NULL,
	msgStatus ENUM('request', 'approved', 'denied') NOT NULL,
	destination ENUM('black', 'white') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS pieces (
	gameID SMALLINT NOT NULL,
	color ENUM('white','black') NOT NULL,
	piece ENUM('pawn','rook','knight','bishop','queen','king') NOT NULL,
	col SMALLINT NOT NULL,
	row SMALLINT NOT NULL,
	INDEX idx_gameID (gameID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS players (
	playerID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	password CHAR(60) NOT NULL,
	firstName varchar(64) NOT NULL,
	lastName varchar(64) NOT NULL,
	nick varchar(64) NOT NULL UNIQUE,
	userlevel tinyint(1) NOT NULL DEFAULT 1,
	lastAccess DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS preferences (
	playerID INT NOT NULL,
	preference CHAR(20) NOT NULL,
	value CHAR(50) NULL,
	PRIMARY KEY(playerID, preference)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS communication (
  commID smallint(6) NOT NULL AUTO_INCREMENT,
  gameID smallint(6) default NULL,
  fromID mediumint(9) default NULL,
  toID mediumint(9) default NULL,
  title varchar(255) default NULL,
  text longtext,
  postDate datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  expireDate datetime DEFAULT CURRENT_TIMESTAMP,
  ack tinyint(4) default '0',
  commType smallint(6) default '0',
  PRIMARY KEY (commID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =========================================================================
-- Seed Multi-Account Matrix (2 Administrators + 2 Standard Users)
-- Admin Password: AdminPassword123! ($2y$10$LDnJHLPWV6KvZ4QfxjE9Z.SNlFCMBcmt9UnEZJ/2xrj1MEtyVEhYi)
-- User Password:  UserPassword123!  ($2y$10$sCHKdkQYzMmZrWnxxKPd7.261fhGVKFqfM60tJ7.2S9dZrIZiyu42)
-- =========================================================================
INSERT INTO players (playerID, password, firstName, lastName, nick, userlevel, lastAccess) VALUES
(1, '$2y$10$LDnJHLPWV6KvZ4QfxjE9Z.SNlFCMBcmt9UnEZJ/2xrj1MEtyVEhYi', 'System', 'Admin', 'admin', 5, NOW()),
(2, '$2y$10$LDnJHLPWV6KvZ4QfxjE9Z.SNlFCMBcmt9UnEZJ/2xrj1MEtyVEhYi', 'Secondary', 'Admin', 'admin2', 5, NOW()),
(3, '$2y$10$sCHKdkQYzMmZrWnxxKPd7.261fhGVKFqfM60tJ7.2S9dZrIZiyu42', 'Standard', 'UserOne', 'user1', 1, NOW()),
(4, '$2y$10$sCHKdkQYzMmZrWnxxKPd7.261fhGVKFqfM60tJ7.2S9dZrIZiyu42', 'Standard', 'UserTwo', 'user2', 1, NOW())
ON DUPLICATE KEY UPDATE nick=nick;

-- Seed default preferences for all players
INSERT INTO preferences (playerID, preference, value) VALUES
(1, 'history', 'yes'),
(1, 'historylayout', 'horizontal'),
(1, 'theme', 'default'),
(1, 'autoreload', '30'),
(1, 'emailnotification', 'no'),
(1, 'replayall', 'no'),
(2, 'history', 'yes'),
(2, 'historylayout', 'horizontal'),
(2, 'theme', 'default'),
(2, 'autoreload', '30'),
(2, 'emailnotification', 'no'),
(2, 'replayall', 'no'),
(3, 'history', 'yes'),
(3, 'historylayout', 'horizontal'),
(3, 'theme', 'default'),
(3, 'autoreload', '30'),
(3, 'emailnotification', 'no'),
(3, 'replayall', 'no'),
(4, 'history', 'yes'),
(4, 'historylayout', 'horizontal'),
(4, 'theme', 'default'),
(4, 'autoreload', '30'),
(4, 'emailnotification', 'no'),
(4, 'replayall', 'no')
ON DUPLICATE KEY UPDATE preference=preference;

-- Seed initial test games for horizontal IDOR / authorization evaluation
INSERT INTO games (gameID, whitePlayer, blackPlayer, gameMessage, messageFrom, dateCreated, lastMove) VALUES
(1, 3, 4, 'playerInvited', 'white', NOW(), NOW()),
(2, 1, 2, 'playerInvited', 'white', NOW(), NOW())
ON DUPLICATE KEY UPDATE gameID=gameID;

-- Seed communication messages for peer isolation & IDOR evaluation
INSERT INTO communication (commID, gameID, fromID, toID, title, text, postDate, expireDate, ack, commType) VALUES
(1, NULL, 1, 2, 'Admin Privileged Notification', 'Confidential administration audit note between admin and admin2.', NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY), 0, 0),
(2, 1, 3, 4, 'Chess Challenge', 'Invitation to match from user1 to user2.', NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY), 0, 0),
(3, 1, 4, 3, 'Challenge Accepted', 'user2 accepted the invitation from user1.', NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY), 0, 0)
ON DUPLICATE KEY UPDATE commID=commID;
