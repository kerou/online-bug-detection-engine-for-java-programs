
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
#-- project
#-----------------------------------------------------------------------------

DROP TABLE IF EXISTS `project`;


CREATE TABLE `project`
(
	`id` INTEGER  NOT NULL AUTO_INCREMENT,
	`userId` INTEGER,
	`name` VARCHAR(255),
	`create_at` DATETIME,
	PRIMARY KEY (`id`),
	INDEX `project_FI_1` (`userId`),
	CONSTRAINT `project_FK_1`
		FOREIGN KEY (`userId`)
		REFERENCES `User` (`id`)
)Type=MyISAM;

#-----------------------------------------------------------------------------
#-- PMDConfig
#-----------------------------------------------------------------------------

DROP TABLE IF EXISTS `PMDConfig`;


CREATE TABLE `PMDConfig`
(
	`id` INTEGER  NOT NULL AUTO_INCREMENT,
	`userId` INTEGER,
	`RuleId` INTEGER,
	PRIMARY KEY (`id`),
	INDEX `PMDConfig_FI_1` (`userId`),
	CONSTRAINT `PMDConfig_FK_1`
		FOREIGN KEY (`userId`)
		REFERENCES `User` (`id`),
	INDEX `PMDConfig_FI_2` (`RuleId`),
	CONSTRAINT `PMDConfig_FK_2`
		FOREIGN KEY (`RuleId`)
		REFERENCES `PMDRules` (`id`)
)Type=MyISAM;

#-----------------------------------------------------------------------------
#-- PMDRules
#-----------------------------------------------------------------------------

DROP TABLE IF EXISTS `PMDRules`;


CREATE TABLE `PMDRules`
(
	`id` INTEGER  NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255),
	`customer` INTEGER,
	`RulePath` VARCHAR(255),
	PRIMARY KEY (`id`)
)Type=MyISAM;

# This restores the fkey checks, after having unset them earlier
SET FOREIGN_KEY_CHECKS = 1;
