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
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (1, 'puppets', 'a', 1, 0, 'Skill', 'Distillery');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (2, 'carpenter1', 'b', 1, 0, 'John', 'Doe');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (3, 'zaptos_rulez', 'electric1', 1, 0, 'Ed', 'Electric');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (4, 'Dane_drywalls', 'drywaller1', 1, 0, 'Dan', 'Dane');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (5, 'hardcore_1986', 'framer1', 1, 0, 'Fred', 'Fane');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (6, 'mason1', 'mason1', 1, 0, 'Mo', 'Mane');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (7, 'paintbrush45cal', 'painter1', 1, 0, 'Peter', 'Poe');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (8, 'wallz_up_dude', 'wallpaperhanger1', 1, 0, 'Willy', 'Wane');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (9, 'plumber1', 'plumber1', 1, 0, 'Plumb', 'Pane');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (10, 'roofer1', 'roofer1', 1, 0, 'Roger', 'Rabbit');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (11, 'hvac1', 'hvac1', 1, 0, 'Henry', 'Habbit');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (12, 'carlitos94', 'cabinet1', 1, 0, 'Carl', 'Carlton');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (13, 'cementer1', 'cementer1', 1, 0, 'Chris', 'Christensan');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (14, 'welder1', 'welder1', 1, 0, 'Oscar', 'Estrada');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (15, 'LarryLane24', 'laborer1', 1, 0, 'Larry', 'Lane');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (16, 'window1', 'window1', 1, 0, 'Warg', 'Wargenson');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (17, 'siding1', 'siding1', 1, 0, 'Sally', 'Sosa');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (18, 'Farrel_23', 'flooring1', 1, 0, 'Fargo', 'Farrel');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (19, 'landscaping1', 'landscaping1', 1, 0, 'Luke', 'Skywalker');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (20, 'pooler1', 'pooler1', 1, 0, 'Paul', 'Poole');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (21, 'java1', 'java1', 1, 0, 'Jake', 'Johnson');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (22, 'cplus', 'cplus', 1, 0, 'Cat', 'Catherine');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (23, 'python1', 'python1', 1, 0, 'PJ', 'Force');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (24, 'brandon', 'b', 1, 0, 'Brandon', 'Stine');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (25, 'tim', 't', 1, 0, 'Tim', 'Shumway');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (26, 'shaun', 's', 1, 0, 'Shaun', 'Reass');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (27, 'dave', 'd', 1, 0, 'David', 'Estrada');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`) VALUES (28, 'admin', 'a', 1, 1, 'Boss', 'Man');

COMMIT;


-- -----------------------------------------------------
-- Data for table `trade`
-- -----------------------------------------------------
START TRANSACTION;
USE `contractingdb`;
INSERT INTO `trade` (`id`, `name`) VALUES (1, 'Full-Stack Developer');
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
INSERT INTO `contractor` (`id`, `company_name`, `user_id`, `trade_id`) VALUES (1, 'Sadistic Puppets\' Developers', 1, 1);
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
INSERT INTO `contractor` (`id`, `company_name`, `user_id`, `trade_id`) VALUES (23, 'Hyrdo Specialists', 20, 20);
INSERT INTO `contractor` (`id`, `company_name`, `user_id`, `trade_id`) VALUES (24, 'Brandon Stine\'s Full Stack Co.', 24, 1);
INSERT INTO `contractor` (`id`, `company_name`, `user_id`, `trade_id`) VALUES (25, 'Tim Shumway\'s Full Stack Co.', 25, 1);
INSERT INTO `contractor` (`id`, `company_name`, `user_id`, `trade_id`) VALUES (26, 'Shaun Reass\' Full Stack Co.', 26, 1);
INSERT INTO `contractor` (`id`, `company_name`, `user_id`, `trade_id`) VALUES (27, 'David Estrada\'s Full Stack Co.', 27, 1);
INSERT INTO `contractor` (`id`, `company_name`, `user_id`, `trade_id`) VALUES (28, 'General Contractor Corp.', 28, 15);

COMMIT;


-- -----------------------------------------------------
-- Data for table `job`
-- -----------------------------------------------------
START TRANSACTION;
USE `contractingdb`;
INSERT INTO `job` (`id`, `job_name`, `location`, `start_date`, `end_date`, `is_complete`, `job_description`, `authorized_overtime`, `total_man_hours`, `hours_of_operation`, `miscellaneous`, `user_id`) VALUES (1, 'Skill Distillery Midterm', '7400 E Orchard Rd #1450n, Greenwood Village, CO 80111', '2021-07-15', '2021-07-23', 0, 'Provide full stack Java software development', 1, 300, 'All day long', 'APIE', 1);
INSERT INTO `job` (`id`, `job_name`, `location`, `start_date`, `end_date`, `is_complete`, `job_description`, `authorized_overtime`, `total_man_hours`, `hours_of_operation`, `miscellaneous`, `user_id`) VALUES (2, 'Hard Work', '123 Main Street', '2021-07-16', '2021-07-17', 0, 'Hammer the nails. Cut the wood. Do your thing.', 1, 100, 'All day long', 'Good luck', 2);
INSERT INTO `job` (`id`, `job_name`, `location`, `start_date`, `end_date`, `is_complete`, `job_description`, `authorized_overtime`, `total_man_hours`, `hours_of_operation`, `miscellaneous`, `user_id`) VALUES (3, 'SD Midterm: backend', 'Remote', '2021-07-15', '2021-07-23', 0, 'All the Java coding through Eclipse IDE.', 1, 200, 'Normal school hours', 'Don\'t forget those semicolons.', 28);
INSERT INTO `job` (`id`, `job_name`, `location`, `start_date`, `end_date`, `is_complete`, `job_description`, `authorized_overtime`, `total_man_hours`, `hours_of_operation`, `miscellaneous`, `user_id`) VALUES (4, 'SD Midterm: frontend', 'Remote', '2021-07-15', '2021-07-23', 0, 'Design each view / web page', 1, 150, 'Normal class time', 'utilize JSTL tags', 28);
INSERT INTO `job` (`id`, `job_name`, `location`, `start_date`, `end_date`, `is_complete`, `job_description`, `authorized_overtime`, `total_man_hours`, `hours_of_operation`, `miscellaneous`, `user_id`) VALUES (5, 'SD Midterm: repository', 'Remote', '2021-07-15', '2021-07-23', 0, 'Create the repo on Github', 1, 175, 'ongoing', 'share with team members', 28);
INSERT INTO `job` (`id`, `job_name`, `location`, `start_date`, `end_date`, `is_complete`, `job_description`, `authorized_overtime`, `total_man_hours`, `hours_of_operation`, `miscellaneous`, `user_id`) VALUES (6, 'SD Midterm: MySQL Workbench', 'Remote', '2021-07-15', '2021-07-23', 0, 'Create Database', 1, 50, 'ongoing', 'forward engineer', 28);
INSERT INTO `job` (`id`, `job_name`, `location`, `start_date`, `end_date`, `is_complete`, `job_description`, `authorized_overtime`, `total_man_hours`, `hours_of_operation`, `miscellaneous`, `user_id`) VALUES (7, 'SD Midterm: Presentations', 'Remote through zoom', '2021-07-15', '2021-07-23', 0, 'Give final presentations to classmates', 0, 8, '4pm Friday', 'speak loud and clearly', 28);
INSERT INTO `job` (`id`, `job_name`, `location`, `start_date`, `end_date`, `is_complete`, `job_description`, `authorized_overtime`, `total_man_hours`, `hours_of_operation`, `miscellaneous`, `user_id`) VALUES (8, 'SD Final Projects', 'Remote', '2021-08-23', '2021-08-25', 0, 'Give final presentations on final projects', 1, 299, 'all day long', 'speak clearly', 28);
INSERT INTO `job` (`id`, `job_name`, `location`, `start_date`, `end_date`, `is_complete`, `job_description`, `authorized_overtime`, `total_man_hours`, `hours_of_operation`, `miscellaneous`, `user_id`) VALUES (9, 'SD: Make Change', 'Remote', '2021-05-25', '2021-05-27', 1, 'Make change from a cash register', 0, 65, 'weekend', 'none', 28);
INSERT INTO `job` (`id`, `job_name`, `location`, `start_date`, `end_date`, `is_complete`, `job_description`, `authorized_overtime`, `total_man_hours`, `hours_of_operation`, `miscellaneous`, `user_id`) VALUES (10, 'SD: FilmQuery', 'Remote', '2021-07-01', '2021-07-03', 1, 'Full CRUD operations for our Film DB', 0, 64, 'weekend', 'none', 28);
INSERT INTO `job` (`id`, `job_name`, `location`, `start_date`, `end_date`, `is_complete`, `job_description`, `authorized_overtime`, `total_man_hours`, `hours_of_operation`, `miscellaneous`, `user_id`) VALUES (11, 'SD: PresidentsDAO', 'Remote', '2021-06-24', '2021-06-25', 1, 'Learning about DAO methods', 0, 8, 'in class lab', 'none', 28);
INSERT INTO `job` (`id`, `job_name`, `location`, `start_date`, `end_date`, `is_complete`, `job_description`, `authorized_overtime`, `total_man_hours`, `hours_of_operation`, `miscellaneous`, `user_id`) VALUES (12, 'SD: CesarCipher', 'Remote', '2021-05-24', '2021-05-26', 1, 'Weekend project', 0, 34, 'weekend ', 'none', 28);
INSERT INTO `job` (`id`, `job_name`, `location`, `start_date`, `end_date`, `is_complete`, `job_description`, `authorized_overtime`, `total_man_hours`, `hours_of_operation`, `miscellaneous`, `user_id`) VALUES (13, 'SD: FizzBuzz', 'Remote', '2021-05-15', '2021-05-17', 1, 'weekend project', 0, 32, 'weekend homework', 'none', 28);
INSERT INTO `job` (`id`, `job_name`, `location`, `start_date`, `end_date`, `is_complete`, `job_description`, `authorized_overtime`, `total_man_hours`, `hours_of_operation`, `miscellaneous`, `user_id`) VALUES (14, 'SD: CRUD Solo Project', 'Remote', '2021-07-01', '2021-07-03', 1, 'weekend project', 0, 54, 'weekend homework', 'none', 28);
INSERT INTO `job` (`id`, `job_name`, `location`, `start_date`, `end_date`, `is_complete`, `job_description`, `authorized_overtime`, `total_man_hours`, `hours_of_operation`, `miscellaneous`, `user_id`) VALUES (15, 'SD: PreWork', 'Remote', '2021-04-21', '2021-05-10', 1, 'prework before cohort begins', 0, 124, 'before 1st day of class', 'none', 28);
INSERT INTO `job` (`id`, `job_name`, `location`, `start_date`, `end_date`, `is_complete`, `job_description`, `authorized_overtime`, `total_man_hours`, `hours_of_operation`, `miscellaneous`, `user_id`) VALUES (16, 'SD: Jets Project', 'Remote', '2021-06-01', '2021-06-04', 1, 'Jets project with Scanner CRUD', 0, 46, 'weekend project', 'none', 28);
INSERT INTO `job` (`id`, `job_name`, `location`, `start_date`, `end_date`, `is_complete`, `job_description`, `authorized_overtime`, `total_man_hours`, `hours_of_operation`, `miscellaneous`, `user_id`) VALUES (17, 'SD: Blackjack Project', 'Remote', '2021-06-07', '2021-06-09', 1, 'Working Blackjack application', 0, 48, 'weekend homework', 'none', 28);
INSERT INTO `job` (`id`, `job_name`, `location`, `start_date`, `end_date`, `is_complete`, `job_description`, `authorized_overtime`, `total_man_hours`, `hours_of_operation`, `miscellaneous`, `user_id`) VALUES (18, 'Casablanca - East Wing', '1600 Pennsylvania Ave', '2021-12-01', '2021-12-25', 0, 'Extension of the East Wing of the White House', 1, 10000, 'Normal business hours', 'Use Eastern Gate, don\'t forget your clearance code.', 28);
INSERT INTO `job` (`id`, `job_name`, `location`, `start_date`, `end_date`, `is_complete`, `job_description`, `authorized_overtime`, `total_man_hours`, `hours_of_operation`, `miscellaneous`, `user_id`) VALUES (19, 'Willy Wonka Chocolate Factory', '1250 S. Boulevard Highway, Nowhere, CA, 91222', '2021-02-24', '2021-03-15', 1, 'Build Willy Wonka\'s Chocolate Factory', 0, 5000, 'Top Secret', 'none', 28);
INSERT INTO `job` (`id`, `job_name`, `location`, `start_date`, `end_date`, `is_complete`, `job_description`, `authorized_overtime`, `total_man_hours`, `hours_of_operation`, `miscellaneous`, `user_id`) VALUES (20, 'Hollingsworth House', '755 Rosen Street, Hiilsdale, CA 95450', '2021-08-15', '2021-08-30', 0, 'Put in a new pool house and pool', 0, 300, '8am - 4pm', 'none', 28);
INSERT INTO `job` (`id`, `job_name`, `location`, `start_date`, `end_date`, `is_complete`, `job_description`, `authorized_overtime`, `total_man_hours`, `hours_of_operation`, `miscellaneous`, `user_id`) VALUES (21, 'San Diego Zoo: Giraffe Housing', '2920 Zoo Dr, San Diego, CA 92101', '2021-08-10', '2021-09-23', 0, 'Create new housing areas for the giraffes', 0, 240, '9am - 3pm', 'Did you know Giraffes fight?', 28);
INSERT INTO `job` (`id`, `job_name`, `location`, `start_date`, `end_date`, `is_complete`, `job_description`, `authorized_overtime`, `total_man_hours`, `hours_of_operation`, `miscellaneous`, `user_id`) VALUES (22, 'Denver Zoo: Giraffe Housing', '2300 Steele St, Denver, CO 80205', '2022-01-04', '2022-02-21', 0, 'Create new housing pits for the giraffes', 0, 450, '8am - 2pm', 'We love giraffes', 28);
INSERT INTO `job` (`id`, `job_name`, `location`, `start_date`, `end_date`, `is_complete`, `job_description`, `authorized_overtime`, `total_man_hours`, `hours_of_operation`, `miscellaneous`, `user_id`) VALUES (23, 'Los Angeles Zoo: Giraffe Housing', '5333 Zoo Dr, Los Angeles, CA 90027', '2022-03-01', '2022-04-15', 0, 'Create new housing pits for the giraffes', 0, 500, '8am - 4pm', 'Giraffes are seriously great', 28);
INSERT INTO `job` (`id`, `job_name`, `location`, `start_date`, `end_date`, `is_complete`, `job_description`, `authorized_overtime`, `total_man_hours`, `hours_of_operation`, `miscellaneous`, `user_id`) VALUES (24, 'San Francisco Zoo: Giraffe Housing', 'Sloat Blvd & Great Hwy, San Francisco, CA 94132', '2022-04-04', '2022-05-21', 0, 'Create new housing pits for giraffes', 0, 456, '8am - 5pm', 'We are the giraffe housing pros', 28);
INSERT INTO `job` (`id`, `job_name`, `location`, `start_date`, `end_date`, `is_complete`, `job_description`, `authorized_overtime`, `total_man_hours`, `hours_of_operation`, `miscellaneous`, `user_id`) VALUES (25, 'Montery Bay Aquarium: Shark pool', '886 Cannery Row, Monterey, CA 93940', '2021-08-01', '2021-08-30', 0, 'Bring back sharks to the Aquarium by improving their outdated housing', 1, 354, '9am - 4pm', 'Free clam chowder vouchers upon completion!', 28);

COMMIT;


-- -----------------------------------------------------
-- Data for table `message`
-- -----------------------------------------------------
START TRANSACTION;
USE `contractingdb`;
INSERT INTO `message` (`id`, `message_body`, `creation_time`, `job_id`, `user_id`) VALUES (1, 'Always be coding!', '2021-07-16 12:00:00', 1, 1);
INSERT INTO `message` (`id`, `message_body`, `creation_time`, `job_id`, `user_id`) VALUES (2, 'Hello everyone, I know we\'re still 5 months out from breaking ground, but just wanted to get you all on board with this new application, CMS. It\'s awesome!', '2021-07-21 8:45:00', 18, 28);
INSERT INTO `message` (`id`, `message_body`, `creation_time`, `job_id`, `user_id`) VALUES (3, 'Welcome to Contract Management System everyone!', '2021-07-21 8:00:00', 18, 28);
INSERT INTO `message` (`id`, `message_body`, `creation_time`, `job_id`, `user_id`) VALUES (4, 'Yes, I will be providing security clearance numbers for all contractors and they will be required to show face and get pictures taken before we break ground', '2021-07-22 5:05:00', 18, 28);
INSERT INTO `message` (`id`, `message_body`, `creation_time`, `job_id`, `user_id`) VALUES (5, 'This site is awesome! Where was this 10 years ago.', '2021-07-21 9:08:00', 18, 15);
INSERT INTO `message` (`id`, `message_body`, `creation_time`, `job_id`, `user_id`) VALUES (6, 'Thanks for introducing us to this Boss Man', '2021-07-21 9:07:45', 18, 12);
INSERT INTO `message` (`id`, `message_body`, `creation_time`, `job_id`, `user_id`) VALUES (7, 'Sweet, now I don\'t have to worry about anyone trying to cut my wires and get away with it', '2021-07-21 15:45:04', 18, 3);
INSERT INTO `message` (`id`, `message_body`, `creation_time`, `job_id`, `user_id`) VALUES (8, 'Hey Boss Man, how do we get past security? The White House is a fortress', '2021-07-21 23:04:32', 18, 6);
INSERT INTO `message` (`id`, `message_body`, `creation_time`, `job_id`, `user_id`) VALUES (9, 'Yeah, what he said. Do we need to get security clearance badges or something?', '2021-07-22 4:44:34', 18, 8);
INSERT INTO `message` (`id`, `message_body`, `creation_time`, `job_id`, `user_id`) VALUES (10, 'Hey Boss Man, this is cool as heck. Should help us stay on track 4 sure', '2021-07-21 11:13:56', 18, 18);
INSERT INTO `message` (`id`, `message_body`, `creation_time`, `job_id`, `user_id`) VALUES (11, 'I never cut anyone\'s damn wires!', '2021-07-21 15:56:01', 18, 4);
INSERT INTO `message` (`id`, `message_body`, `creation_time`, `job_id`, `user_id`) VALUES (12, 'That\'s not what I heard Dane, some jobs in North Carolina say otherwise', '2021-07-21 20:42:08', 18, 7);

COMMIT;


-- -----------------------------------------------------
-- Data for table `task`
-- -----------------------------------------------------
START TRANSACTION;
USE `contractingdb`;
INSERT INTO `task` (`id`, `is_complete`, `task_name`, `task_details`, `job_id`, `priority_number`, `contractor_id`, `begin_time`, `end_time`, `trade_id`) VALUES (1, 0, 'Trello board', 'create a checklist on Trello', 1, 1, 1, '2021-07-15 08:00:00', '2021-07-23 17:00:00', 1);
INSERT INTO `task` (`id`, `is_complete`, `task_name`, `task_details`, `job_id`, `priority_number`, `contractor_id`, `begin_time`, `end_time`, `trade_id`) VALUES (2, 0, 'Hard Work Task', 'Do hard work', 2, 1, 2, '2021-07-16 09:00:00', '2021-07-22 15:00:00', 20);
INSERT INTO `task` (`id`, `is_complete`, `task_name`, `task_details`, `job_id`, `priority_number`, `contractor_id`, `begin_time`, `end_time`, `trade_id`) VALUES (3, 0, 'Midterm front-end', 'Create JSP and web pages. Use CSS', 1, 5, 1, '2021-07-15 08:00:00', '2021-07-23 17:00:00', 1);
INSERT INTO `task` (`id`, `is_complete`, `task_name`, `task_details`, `job_id`, `priority_number`, `contractor_id`, `begin_time`, `end_time`, `trade_id`) VALUES (4, 0, 'Midterm back-end', 'All the logic through Java programming', 1, 2, 1, '2021-07-15 08:00:00', '2021-07-23 17:00:00', 1);
INSERT INTO `task` (`id`, `is_complete`, `task_name`, `task_details`, `job_id`, `priority_number`, `contractor_id`, `begin_time`, `end_time`, `trade_id`) VALUES (5, 0, 'Controllers', 'Correct mapping to DAOs and web views', 1, 3, 1, '2021-07-15 08:00:00', '2021-07-23 17:00:00', 1);
INSERT INTO `task` (`id`, `is_complete`, `task_name`, `task_details`, `job_id`, `priority_number`, `contractor_id`, `begin_time`, `end_time`, `trade_id`) VALUES (6, 0, 'DAO methods', 'Correct logic and syntax with all working DAO methods', 1, 3, 1, '2021-07-15 08:00:00', '2021-07-23 17:00:00', 1);
INSERT INTO `task` (`id`, `is_complete`, `task_name`, `task_details`, `job_id`, `priority_number`, `contractor_id`, `begin_time`, `end_time`, `trade_id`) VALUES (7, 0, 'JSP views', 'All views are functional & eye-catching', 1, 5, 1, '2021-07-15 08:00:00', '2021-07-23 17:00:00', 1);
INSERT INTO `task` (`id`, `is_complete`, `task_name`, `task_details`, `job_id`, `priority_number`, `contractor_id`, `begin_time`, `end_time`, `trade_id`) VALUES (8, 0, 'Bootstrap', 'Link bootstrap and utilize modals, cards, etc', 1, 2, 1, '2021-07-15 08:00:00', '2021-07-23 17:00:00', 1);
INSERT INTO `task` (`id`, `is_complete`, `task_name`, `task_details`, `job_id`, `priority_number`, `contractor_id`, `begin_time`, `end_time`, `trade_id`) VALUES (9, 0, 'Entities', 'Create entities reflecting DB tables', 1, 1, 1, '2021-07-15 08:00:00', '2021-07-23 17:00:00', 1);
INSERT INTO `task` (`id`, `is_complete`, `task_name`, `task_details`, `job_id`, `priority_number`, `contractor_id`, `begin_time`, `end_time`, `trade_id`) VALUES (10, 0, 'Database created', 'DBA do his job right?', 1, 1, 1, '2021-07-15 08:00:00', '2021-07-23 17:00:00', 1);
INSERT INTO `task` (`id`, `is_complete`, `task_name`, `task_details`, `job_id`, `priority_number`, `contractor_id`, `begin_time`, `end_time`, `trade_id`) VALUES (11, 0, 'Repository', 'Repo owner shared with team?', 1, 1, 1, '2021-07-15 08:00:00', '2021-07-23 17:00:00', 1);
INSERT INTO `task` (`id`, `is_complete`, `task_name`, `task_details`, `job_id`, `priority_number`, `contractor_id`, `begin_time`, `end_time`, `trade_id`) VALUES (12, 0, 'Connect power', 'Wire up underground cables get connected to the grid', 18, 1, 6, '2021-12-01 08:30:00', '2021-12-05 08:30:00', 2);
INSERT INTO `task` (`id`, `is_complete`, `task_name`, `task_details`, `job_id`, `priority_number`, `contractor_id`, `begin_time`, `end_time`, `trade_id`) VALUES (13, 0, 'Indoor shelving ', 'Build shelves ', 18, 3, 2, '2021-12-09 08:30:00', '2021-12-15 08:30:00', 3);
INSERT INTO `task` (`id`, `is_complete`, `task_name`, `task_details`, `job_id`, `priority_number`, `contractor_id`, `begin_time`, `end_time`, `trade_id`) VALUES (14, 0, 'Dry-walling', 'Put up the dry-wall ', 18, 3, 7, '2021-12-09 08:30:00', '2021-12-15 08:30:00', 4);
INSERT INTO `task` (`id`, `is_complete`, `task_name`, `task_details`, `job_id`, `priority_number`, `contractor_id`, `begin_time`, `end_time`, `trade_id`) VALUES (15, 0, 'Main building Framing', 'Frame the main structure', 18, 2, 8, '2021-12-05 08:30:00', '2021-12-09 08:30:00', 5);
INSERT INTO `task` (`id`, `is_complete`, `task_name`, `task_details`, `job_id`, `priority_number`, `contractor_id`, `begin_time`, `end_time`, `trade_id`) VALUES (16, 0, 'Courtyard bricking', 'Set up the foundation of the courtyard with bricks', 18, 5, 9, '2021-12-20 08:30:00', '2021-12-25 08:30:00', 6);
INSERT INTO `task` (`id`, `is_complete`, `task_name`, `task_details`, `job_id`, `priority_number`, `contractor_id`, `begin_time`, `end_time`, `trade_id`) VALUES (17, 0, 'Paint entire Extension', 'Paint the entire outside infrastructure & indoor walls eggshel white', 18, 5, 10, '2021-12-20 08:30:00', '2021-12-25 08:30:00', 7);
INSERT INTO `task` (`id`, `is_complete`, `task_name`, `task_details`, `job_id`, `priority_number`, `contractor_id`, `begin_time`, `end_time`, `trade_id`) VALUES (18, 0, 'Bathroom wallpaper', 'Wallpaper the bathrooms ', 18, 5, 11, '2021-12-20 08:30:00', '2021-12-25 08:30:00', 8);
INSERT INTO `task` (`id`, `is_complete`, `task_name`, `task_details`, `job_id`, `priority_number`, `contractor_id`, `begin_time`, `end_time`, `trade_id`) VALUES (19, 0, 'Plumbing & Piping', 'Setup all the underground pipes and plumbing ', 18, 1, 12, '2021-12-01 08:30:00', '2021-12-05 08:30:00', 9);
INSERT INTO `task` (`id`, `is_complete`, `task_name`, `task_details`, `job_id`, `priority_number`, `contractor_id`, `begin_time`, `end_time`, `trade_id`) VALUES (20, 0, 'Roofing', 'Establish a wide security roof -- see GC for Secret Service instructions', 18, 4, 13, '2021-12-15 08:30:00', '2021-12-20 08:30:00', 10);
INSERT INTO `task` (`id`, `is_complete`, `task_name`, `task_details`, `job_id`, `priority_number`, `contractor_id`, `begin_time`, `end_time`, `trade_id`) VALUES (21, 0, 'HVAC Setup', 'Get Air conditioning and heating working', 18, 5, 14, '2021-12-20 08:30:00', '2021-12-25 08:30:00', 11);
INSERT INTO `task` (`id`, `is_complete`, `task_name`, `task_details`, `job_id`, `priority_number`, `contractor_id`, `begin_time`, `end_time`, `trade_id`) VALUES (22, 0, 'Cabinets', 'Set up cabinets in the locker rooms, kitchen and break areas', 18, 5, 15, '2021-12-20 08:30:00', '2021-12-25 08:30:00', 12);
INSERT INTO `task` (`id`, `is_complete`, `task_name`, `task_details`, `job_id`, `priority_number`, `contractor_id`, `begin_time`, `end_time`, `trade_id`) VALUES (23, 0, 'Cement foundation', 'Lay the foundation once wiring and plumbing has been setup', 18, 2, 16, '2021-12-05 08:30:00', '2021-12-09 08:30:00', 13);
INSERT INTO `task` (`id`, `is_complete`, `task_name`, `task_details`, `job_id`, `priority_number`, `contractor_id`, `begin_time`, `end_time`, `trade_id`) VALUES (24, 0, 'Metal handrails', 'Weld the courtyard handrails and get those in place ', 18, 5, 17, '2021-12-20 08:30:00', '2021-12-25 08:30:00', 14);
INSERT INTO `task` (`id`, `is_complete`, `task_name`, `task_details`, `job_id`, `priority_number`, `contractor_id`, `begin_time`, `end_time`, `trade_id`) VALUES (25, 0, 'General Labor', 'See GC for specific daily tasks', 18, 2, 18, '2021-12-05 08:30:00', '2021-12-09 08:30:00', 15);
INSERT INTO `task` (`id`, `is_complete`, `task_name`, `task_details`, `job_id`, `priority_number`, `contractor_id`, `begin_time`, `end_time`, `trade_id`) VALUES (26, 0, 'Windows / Doors', 'Place the doors and windows in all their frames', 18, 4, 19, '2021-12-15 08:30:00', '2021-12-20 08:30:00', 16);
INSERT INTO `task` (`id`, `is_complete`, `task_name`, `task_details`, `job_id`, `priority_number`, `contractor_id`, `begin_time`, `end_time`, `trade_id`) VALUES (27, 0, 'Siding', 'Do the siding of the main structure', 18, 3, 20, '2021-12-09 08:30:00', '2021-12-15 08:30:00', 17);
INSERT INTO `task` (`id`, `is_complete`, `task_name`, `task_details`, `job_id`, `priority_number`, `contractor_id`, `begin_time`, `end_time`, `trade_id`) VALUES (28, 0, 'Flooring / Tile', 'Marble in the main lobby, tile in the main hallways, carpet in the offices and wood elsewhere', 18, 2, 21, '2021-12-05 08:30:00', '2021-12-09 08:30:00', 18);
INSERT INTO `task` (`id`, `is_complete`, `task_name`, `task_details`, `job_id`, `priority_number`, `contractor_id`, `begin_time`, `end_time`, `trade_id`) VALUES (29, 0, 'Landscaping', 'See GC for desired landscaping design ', 18, 5, 22, '2021-12-20 08:30:00', '2021-12-25 08:30:00', 19);
INSERT INTO `task` (`id`, `is_complete`, `task_name`, `task_details`, `job_id`, `priority_number`, `contractor_id`, `begin_time`, `end_time`, `trade_id`) VALUES (30, 0, 'Courtyard fountain', 'Set up the flowing water in the courtyard fountain', 18, 4, 23, '2021-12-15 08:30:00', '2021-12-20 08:30:00', 20);

COMMIT;

