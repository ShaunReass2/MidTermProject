-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema contractingdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `contractingdb` ;

-- -----------------------------------------------------
-- Schema contractingdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `contractingdb` DEFAULT CHARACTER SET utf8 ;
USE `contractingdb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  `enabled` TINYINT NOT NULL DEFAULT 1,
  `role` TINYINT NULL DEFAULT 0,
  `first_name` VARCHAR(50) NULL,
  `last_name` VARCHAR(50) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trade` ;

CREATE TABLE IF NOT EXISTS `trade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `contractor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `contractor` ;

CREATE TABLE IF NOT EXISTS `contractor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `company_name` VARCHAR(100) NULL,
  `user_id` INT NOT NULL,
  `trade_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_contractor_user1_idx` (`user_id` ASC),
  INDEX `fk_contractor_trade1_idx` (`trade_id` ASC),
  CONSTRAINT `fk_contractor_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contractor_trade1`
    FOREIGN KEY (`trade_id`)
    REFERENCES `trade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `job`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `job` ;

CREATE TABLE IF NOT EXISTS `job` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `job_name` VARCHAR(100) NULL,
  `location` VARCHAR(100) NULL,
  `start_date` DATE NULL,
  `end_date` DATE NULL,
  `is_complete` TINYINT NULL,
  `job_description` TEXT NULL,
  `authorized_overtime` TINYINT NULL DEFAULT 0,
  `total_man_hours` INT NULL,
  `hours_of_operation` VARCHAR(50) NULL,
  `miscellaneous` TEXT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_job_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_job_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `message` ;

CREATE TABLE IF NOT EXISTS `message` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `message_body` VARCHAR(500) NULL,
  `creation_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `job_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_message_job1_idx` (`job_id` ASC),
  INDEX `fk_message_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_message_job1`
    FOREIGN KEY (`job_id`)
    REFERENCES `job` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_message_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `task`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `task` ;

CREATE TABLE IF NOT EXISTS `task` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `is_complete` TINYINT NULL DEFAULT 0,
  `task_name` VARCHAR(50) NULL,
  `task_details` TEXT NULL,
  `job_id` INT NOT NULL,
  `priority_number` INT NULL,
  `contractor_id` INT NOT NULL,
  `begin_time` DATETIME NULL,
  `end_time` DATETIME NULL,
  `trade_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_job_task_job1_idx` (`job_id` ASC),
  INDEX `fk_task_contractor1_idx` (`contractor_id` ASC),
  INDEX `fk_task_trade1_idx` (`trade_id` ASC),
  CONSTRAINT `fk_job_task_job1`
    FOREIGN KEY (`job_id`)
    REFERENCES `job` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_task_contractor1`
    FOREIGN KEY (`contractor_id`)
    REFERENCES `contractor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_task_trade1`
    FOREIGN KEY (`trade_id`)
    REFERENCES `trade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS contractinguser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'contractinguser'@'localhost' IDENTIFIED BY 'contractinguser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'contractinguser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `contractingdb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (1, 'admin', 'a', 1, 1, 'Skill', 'Distillery');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (2, 'hardworker', 'b', 1, 0, 'John', 'Doe');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (3, 'brandon1', 'brandon1', 1, 0, 'Brandon', 'Stine');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (4, 'drywaller1', 'drywaller1', 1, 0, 'Dan', 'Dane');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (5, 'framer1', 'framer1', 1, 0, 'Fred', 'Fane');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (6, 'mason1', 'mason1', 1, 0, 'Mo', 'Mane');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (7, 'painter1', 'painter1', 1, 0, 'Peter', 'Poe');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (8, 'wallpaperhanger1', 'wallpaperhanger1', 1, 0, 'Willy', 'Wane');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (9, 'plumber1', 'plumber1', 1, 0, 'Plumb', 'Pane');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (10, 'roofer1', 'roofer1', 1, 0, 'Roger', 'Rabbit');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (11, 'hvac1', 'hvac1', 1, 0, 'Henry', 'Habbit');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (12, 'cabinet1', 'cabinet1', 1, 0, 'Carl', 'Carlton');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (13, 'cementer1', 'cementer1', 1, 0, 'Chris', 'Christensan');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (14, 'welder1', 'welder1', 1, 0, 'David', 'Estrada');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (15, 'laborer1', 'laborer1', 1, 0, 'Larry', 'Lane');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (16, 'window1', 'window1', 1, 0, 'Warg', 'Wargenson');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (17, 'siding1', 'siding1', 1, 0, 'Sally', 'Sosa');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (18, 'flooring1', 'flooring1', 1, 0, 'Fargo', 'Farrel');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (19, 'landscaping1', 'landscaping1', 1, 0, 'Luke', 'Skywalker');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (20, 'pooler1', 'pooler1', 1, 0, 'Paul', 'Poole');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (21, 'java1', 'java1', 1, 0, 'Jake', 'Johnson');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (22, 'cplus', 'cplus', 1, 0, 'Cat', 'Catherine');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (23, 'python1', 'python1', 1, 0, 'PJ', 'Force');

COMMIT;


-- -----------------------------------------------------
-- Data for table `trade`
-- -----------------------------------------------------
START TRANSACTION;
USE `contractingdb`;
INSERT INTO `trade` (`id`, `name`) VALUES (1, 'Full-stack consultant');
INSERT INTO `trade` (`id`, `name`) VALUES (2, 'Electric');
INSERT INTO `trade` (`id`, `name`) VALUES (3, 'Carpenter');
INSERT INTO `trade` (`id`, `name`) VALUES (4, 'Dry-Waller');
INSERT INTO `trade` (`id`, `name`) VALUES (5, 'Framer');
INSERT INTO `trade` (`id`, `name`) VALUES (6, 'Mason');
INSERT INTO `trade` (`id`, `name`) VALUES (7, 'Painter');
INSERT INTO `trade` (`id`, `name`) VALUES (8, 'Wallpaper hanger');
INSERT INTO `trade` (`id`, `name`) VALUES (9, 'Plumber');
INSERT INTO `trade` (`id`, `name`) VALUES (10, 'Roofer');
INSERT INTO `trade` (`id`, `name`) VALUES (11, 'Heating-Ventilation & Air Conditioning');
INSERT INTO `trade` (`id`, `name`) VALUES (12, 'Cabinetry');
INSERT INTO `trade` (`id`, `name`) VALUES (13, 'Cement Layer');
INSERT INTO `trade` (`id`, `name`) VALUES (14, 'Welder');
INSERT INTO `trade` (`id`, `name`) VALUES (15, 'General laborer');
INSERT INTO `trade` (`id`, `name`) VALUES (16, 'Windows & doors');
INSERT INTO `trade` (`id`, `name`) VALUES (17, 'Siding ');
INSERT INTO `trade` (`id`, `name`) VALUES (18, 'Flooring & Tile');
INSERT INTO `trade` (`id`, `name`) VALUES (19, 'Landscaping');
INSERT INTO `trade` (`id`, `name`) VALUES (20, 'Pool & hydration specialist');

COMMIT;


-- -----------------------------------------------------
-- Data for table `contractor`
-- -----------------------------------------------------
START TRANSACTION;
USE `contractingdb`;
INSERT INTO `contractor` (`id`, `company_name`, `user_id`, `trade_id`) VALUES (1, 'Sadistic Puppets\' Consulting Co.', 1, 1);
INSERT INTO `contractor` (`id`, `company_name`, `user_id`, `trade_id`) VALUES (2, 'Hard Working John Doe Co.', 2, 3);
INSERT INTO `contractor` (`id`, `company_name`, `user_id`, `trade_id`) VALUES (3, 'JavaScript Serpents', 21, 1);
INSERT INTO `contractor` (`id`, `company_name`, `user_id`, `trade_id`) VALUES (4, 'C++ Creators', 22, 1);
INSERT INTO `contractor` (`id`, `company_name`, `user_id`, `trade_id`) VALUES (5, 'Python Full Stack Pros', 23, 1);
INSERT INTO `contractor` (`id`, `company_name`, `user_id`, `trade_id`) VALUES (6, 'Stine\'s Electric Co.', 3, 2);
INSERT INTO `contractor` (`id`, `company_name`, `user_id`, `trade_id`) VALUES (7, 'Main St. Drywaller\'s ', 4, 4);
INSERT INTO `contractor` (`id`, `company_name`, `user_id`, `trade_id`) VALUES (8, 'Fred\'s Framing ', 5, 5);
INSERT INTO `contractor` (`id`, `company_name`, `user_id`, `trade_id`) VALUES (9, 'Mike\'s Masonry', 6, 6);
INSERT INTO `contractor` (`id`, `company_name`, `user_id`, `trade_id`) VALUES (10, 'Paul\'s Paint Service', 7, 7);
INSERT INTO `contractor` (`id`, `company_name`, `user_id`, `trade_id`) VALUES (11, 'Wallpapers & More', 8, 8);
INSERT INTO `contractor` (`id`, `company_name`, `user_id`, `trade_id`) VALUES (12, 'Pete\'s Plumbing Service', 9, 9);
INSERT INTO `contractor` (`id`, `company_name`, `user_id`, `trade_id`) VALUES (13, 'Raul & Sons Roofing', 10, 10);
INSERT INTO `contractor` (`id`, `company_name`, `user_id`, `trade_id`) VALUES (14, 'Henry\'s HVAC', 11, 11);
INSERT INTO `contractor` (`id`, `company_name`, `user_id`, `trade_id`) VALUES (15, 'Carlos Cabinetry', 12, 12);
INSERT INTO `contractor` (`id`, `company_name`, `user_id`, `trade_id`) VALUES (16, 'Jerry\'s Cementing', 13, 13);
INSERT INTO `contractor` (`id`, `company_name`, `user_id`, `trade_id`) VALUES (17, 'West Coast Welding', 14, 14);
INSERT INTO `contractor` (`id`, `company_name`, `user_id`, `trade_id`) VALUES (18, 'General Laborers Co.', 15, 15);
INSERT INTO `contractor` (`id`, `company_name`, `user_id`, `trade_id`) VALUES (19, 'Windows, Doors, & More', 16, 16);
INSERT INTO `contractor` (`id`, `company_name`, `user_id`, `trade_id`) VALUES (20, 'Sally\'s Siding Family Co.', 17, 17);
INSERT INTO `contractor` (`id`, `company_name`, `user_id`, `trade_id`) VALUES (21, 'Frankie\'s Flooring', 18, 18);
INSERT INTO `contractor` (`id`, `company_name`, `user_id`, `trade_id`) VALUES (22, 'Lopez Family Landscaping', 19, 19);
INSERT INTO `contractor` (`id`, `company_name`, `user_id`, `trade_id`) VALUES (23, 'Hyrdo Specialist Corp.', 20, 20);

COMMIT;


-- -----------------------------------------------------
-- Data for table `job`
-- -----------------------------------------------------
START TRANSACTION;
USE `contractingdb`;
INSERT INTO `job` (`id`, `job_name`, `location`, `start_date`, `end_date`, `is_complete`, `job_description`, `authorized_overtime`, `total_man_hours`, `hours_of_operation`, `miscellaneous`, `user_id`) VALUES (1, 'Skill Distillery Midterm', '7400 E Orchard Rd #1450n, Greenwood Village, CO 80111', '2021-07-15', '2021-07-23', 0, 'Provide full stack Java software development', 1, 300, 'All day long', 'APIE', 1);
INSERT INTO `job` (`id`, `job_name`, `location`, `start_date`, `end_date`, `is_complete`, `job_description`, `authorized_overtime`, `total_man_hours`, `hours_of_operation`, `miscellaneous`, `user_id`) VALUES (2, 'Hard Work', '123 Main Street', '2021-07-16', '2021-07-17', 0, 'Hammer the nails. Cut the wood. Do your thing.', 1, 100, 'All day long', 'Good luck', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `message`
-- -----------------------------------------------------
START TRANSACTION;
USE `contractingdb`;
INSERT INTO `message` (`id`, `message_body`, `creation_time`, `job_id`, `user_id`) VALUES (1, 'Always be coding!', '2021-07-16 12:00:00', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `task`
-- -----------------------------------------------------
START TRANSACTION;
USE `contractingdb`;
INSERT INTO `task` (`id`, `is_complete`, `task_name`, `task_details`, `job_id`, `priority_number`, `contractor_id`, `begin_time`, `end_time`, `trade_id`) VALUES (1, 0, 'Midterm Project', 'Create midterm project VIP', 1, 1, 1, '2021-07-15 08:00:00', '2021-07-23 17:00:00', 1);
INSERT INTO `task` (`id`, `is_complete`, `task_name`, `task_details`, `job_id`, `priority_number`, `contractor_id`, `begin_time`, `end_time`, `trade_id`) VALUES (2, 0, 'Hard Work Task', 'Do hard work', 2, 1, 2, '2021-07-16 09:00:00', '2021-07-22 15:00:00', 20);

COMMIT;

