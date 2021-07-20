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
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (2, 'non-admin', 'b', 1, 1, 'David', 'Estrada');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (3, 'hardworker', 'c', 1, 1, 'John', 'Doe');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (4, 'better worker', 'bc', 1, 1, 'Jonny', 'Doe');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (5, 'best worker', 'bw', 1, 1, 'Johnathon ', 'Doe');

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
INSERT INTO `contractor` (`id`, `company_name`, `user_id`, `trade_id`) VALUES (2, 'Hard Working John Doe Co.', 3, 20);
INSERT INTO `contractor` (`id`, `company_name`, `user_id`, `trade_id`) VALUES (3, 'Ayo Daaayooo', 2, 1);
INSERT INTO `contractor` (`id`, `company_name`, `user_id`, `trade_id`) VALUES (4, 'We Do It Better', 4, 1);
INSERT INTO `contractor` (`id`, `company_name`, `user_id`, `trade_id`) VALUES (5, 'No, We Do It Best', 5, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `job`
-- -----------------------------------------------------
START TRANSACTION;
USE `contractingdb`;
INSERT INTO `job` (`id`, `job_name`, `location`, `start_date`, `end_date`, `is_complete`, `job_description`, `authorized_overtime`, `total_man_hours`, `hours_of_operation`, `miscellaneous`, `user_id`) VALUES (1, 'Skill Distillery Midterm', '7400 E Orchard Rd #1450n, Greenwood Village, CO 80111', '2021-07-15', '2021-07-16', 0, 'Provide full stack Java software development', 1, 300, 'All day long', 'APIE', 1);
INSERT INTO `job` (`id`, `job_name`, `location`, `start_date`, `end_date`, `is_complete`, `job_description`, `authorized_overtime`, `total_man_hours`, `hours_of_operation`, `miscellaneous`, `user_id`) VALUES (2, 'Hard Work', '123 Main Street', '2021-07-16', '2021-07-17', 0, 'Do hard work', 1, 100, 'All day long', 'Good luck', 3);

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

