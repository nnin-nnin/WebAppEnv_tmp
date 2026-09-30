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

-- Seed administrator account (admin / AdminPassword123!)
INSERT INTO players (playerID, password, firstName, lastName, nick, userlevel, lastAccess)
VALUES (1, '$2y$10$LDnJHLPWV6KvZ4QfxjE9Z.SNlFCMBcmt9UnEZJ/2xrj1MEtyVEhYi', 'System', 'Admin', 'admin', 5, NOW())
ON DUPLICATE KEY UPDATE nick=nick;

-- Seed default preferences for admin
INSERT INTO preferences (playerID, preference, value) VALUES
(1, 'history', 'yes'),
(1, 'historylayout', 'horizontal'),
(1, 'theme', 'default'),
(1, 'autoreload', '30'),
(1, 'emailnotification', 'no'),
(1, 'replayall', 'no')
ON DUPLICATE KEY UPDATE preference=preference;
