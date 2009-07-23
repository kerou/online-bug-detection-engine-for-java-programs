
# This is a fix for InnoDB in MySQL >= 4.1.x
# It "suspends judgement" for fkey relationships until are tables are set.
SET FOREIGN_KEY_CHECKS = 0;

#-----------------------------------------------------------------------------
#-- User
#-----------------------------------------------------------------------------

DROP TABLE IF EXISTS `User`;


CREATE TABLE `User`
(
	`id` INTEGER  NOT NULL AUTO_INCREMENT,
	`username` VARCHAR(255),
	`password` VARCHAR(255),
	`school` VARCHAR(255),
	`sex` INTEGER,
	`email` VARCHAR(255),
	PRIMARY KEY (`id`)
)Type=MyISAM;

#-----------------------------------------------------------------------------
#-- Project
#-----------------------------------------------------------------------------

DROP TABLE IF EXISTS `Project`;


CREATE TABLE `Project`
(
	`id` INTEGER  NOT NULL AUTO_INCREMENT,
	`userId` INTEGER,
	`name` VARCHAR(255),
	`create_at` DATETIME,
	PRIMARY KEY (`id`),
	INDEX `Project_FI_1` (`userId`),
	CONSTRAINT `Project_FK_1`
		FOREIGN KEY (`userId`)
		REFERENCES `User` (`id`)
)Type=MyISAM;

#-----------------------------------------------------------------------------
#-- UserConfig
#-----------------------------------------------------------------------------

DROP TABLE IF EXISTS `UserConfig`;


CREATE TABLE `UserConfig`
(
	`id` INTEGER  NOT NULL AUTO_INCREMENT,
	`userId` INTEGER,
	`PMDConfig` VARCHAR(255),
	`FBConfig` VARCHAR(255),
	PRIMARY KEY (`id`),
	INDEX `UserConfig_FI_1` (`userId`),
	CONSTRAINT `UserConfig_FK_1`
		FOREIGN KEY (`userId`)
		REFERENCES `User` (`id`)
)Type=MyISAM;

#-----------------------------------------------------------------------------
#-- PMDRules
#-----------------------------------------------------------------------------

DROP TABLE IF EXISTS `PMDRules`;


CREATE TABLE `PMDRules`
(
	`id` INTEGER  NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255),
	`ruleSet` VARCHAR(255),
	`rulePath` VARCHAR(255),
	PRIMARY KEY (`id`)
)Type=MyISAM;

#-----------------------------------------------------------------------------
#-- FBRules
#-----------------------------------------------------------------------------

DROP TABLE IF EXISTS `FBRules`;


CREATE TABLE `FBRules`
(
	`id` INTEGER  NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255),
	`category` VARCHAR(255),
	PRIMARY KEY (`id`)
)Type=MyISAM;

#-----------------------------------------------------------------------------
#-- RulesStat
#-----------------------------------------------------------------------------

DROP TABLE IF EXISTS `RulesStat`;


CREATE TABLE `RulesStat`
(
	`id` INTEGER  NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255),
	`category` VARCHAR(255),
	`type` VARCHAR(255),
	`tool` VARCHAR(255),
	`count` INTEGER,
	PRIMARY KEY (`id`)
)Type=MyISAM;

# This restores the fkey checks, after having unset them earlier
SET FOREIGN_KEY_CHECKS = 1;
