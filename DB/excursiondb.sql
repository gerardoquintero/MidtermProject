-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema excursiondb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `excursiondb` ;

-- -----------------------------------------------------
-- Schema excursiondb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `excursiondb` DEFAULT CHARACTER SET utf8 ;
USE `excursiondb` ;

-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `country` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `postal_code` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `enabled` TINYINT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `enabled` TINYINT NOT NULL,
  `role` VARCHAR(45) NULL,
  `image` VARCHAR(2500) NULL,
  `biography` TEXT NULL,
  `email_address` VARCHAR(100) NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `address_id` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  INDEX `fk_user_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_user_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trip`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trip` ;

CREATE TABLE IF NOT EXISTS `trip` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `start_date` DATE NULL,
  `end_date` DATE NULL,
  `name` VARCHAR(45) NULL,
  `description` TEXT NULL,
  `capacity` INT NULL,
  `image` VARCHAR(2500) NULL,
  `cost` DECIMAL(5,2) NULL,
  `enabled` TINYINT NULL,
  `organizer_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_trip_user1_idx` (`organizer_id` ASC),
  CONSTRAINT `fk_trip_user1`
    FOREIGN KEY (`organizer_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `review` ;

CREATE TABLE IF NOT EXISTS `review` (
  `user_id` INT NOT NULL,
  `trip_id` INT NOT NULL,
  `comment` VARCHAR(45) NULL,
  `create_date` DATETIME NULL,
  `rating` INT NULL,
  `last_updated` DATETIME NULL,
  `enabled` TINYINT NULL,
  PRIMARY KEY (`user_id`, `trip_id`),
  INDEX `fk_review_user1_idx` (`user_id` ASC),
  INDEX `fk_review_trip1_idx` (`trip_id` ASC),
  CONSTRAINT `fk_review_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_trip1`
    FOREIGN KEY (`trip_id`)
    REFERENCES `trip` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transportation_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `transportation_type` ;

CREATE TABLE IF NOT EXISTS `transportation_type` (
  `id` INT NOT NULL,
  `type` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transportation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `transportation` ;

CREATE TABLE IF NOT EXISTS `transportation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `company` VARCHAR(45) NULL,
  `departure_date` DATETIME NULL,
  `arrival_date` DATETIME NULL,
  `cost` DECIMAL(5,2) NULL,
  `image` VARCHAR(2500) NULL,
  `description` TEXT NULL,
  `enabled` TINYINT NULL,
  `transportation_type_id` INT NULL,
  `departure_address_id` INT NULL,
  `arrival_address_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_transportation_transportation_type1_idx` (`transportation_type_id` ASC),
  INDEX `fk_transportation_address1_idx` (`departure_address_id` ASC),
  INDEX `fk_transportation_address2_idx` (`arrival_address_id` ASC),
  CONSTRAINT `fk_transportation_transportation_type1`
    FOREIGN KEY (`transportation_type_id`)
    REFERENCES `transportation_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transportation_address1`
    FOREIGN KEY (`departure_address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transportation_address2`
    FOREIGN KEY (`arrival_address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lodging`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lodging` ;

CREATE TABLE IF NOT EXISTS `lodging` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `price` DECIMAL(5,2) NULL,
  `check_in_time` DATETIME NULL,
  `check_out_time` DATETIME NULL,
  `image` VARCHAR(2500) NULL,
  `enabled` TINYINT NULL,
  `address_id` INT NOT NULL,
  `trip_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_accomodation_address1_idx` (`address_id` ASC),
  INDEX `fk_lodging_trip1_idx` (`trip_id` ASC),
  CONSTRAINT `fk_accomodation_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lodging_trip1`
    FOREIGN KEY (`trip_id`)
    REFERENCES `trip` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_has_trip`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_has_trip` ;

CREATE TABLE IF NOT EXISTS `user_has_trip` (
  `user_id` INT NOT NULL,
  `trip_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `trip_id`),
  INDEX `fk_user_has_trip_trip1_idx` (`trip_id` ASC),
  INDEX `fk_user_has_trip_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_trip_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_trip_trip1`
    FOREIGN KEY (`trip_id`)
    REFERENCES `trip` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `activity_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `activity_type` ;

CREATE TABLE IF NOT EXISTS `activity_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `activity_type` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `activity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `activity` ;

CREATE TABLE IF NOT EXISTS `activity` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `start_date` DATETIME NULL,
  `description` VARCHAR(45) NULL,
  `image` VARCHAR(2500) NULL,
  `cost` DECIMAL(5,2) NULL,
  `end_date` DATETIME NULL,
  `approved` TINYINT NULL,
  `enabled` TINYINT NULL,
  `address_id` INT NOT NULL,
  `trip_id` INT NOT NULL,
  `activity_type_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_attraction_address1_idx` (`address_id` ASC),
  INDEX `fk_activity_activity_type1_idx` (`activity_type_id` ASC),
  INDEX `fk_activity_trip1_idx` (`trip_id` ASC),
  CONSTRAINT `fk_attraction_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_activity_activity_type1`
    FOREIGN KEY (`activity_type_id`)
    REFERENCES `activity_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_activity_trip1`
    FOREIGN KEY (`trip_id`)
    REFERENCES `trip` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lodging_amenities`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lodging_amenities` ;

CREATE TABLE IF NOT EXISTS `lodging_amenities` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lodging_has_lodging_amenities`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lodging_has_lodging_amenities` ;

CREATE TABLE IF NOT EXISTS `lodging_has_lodging_amenities` (
  `lodging_id` INT NOT NULL,
  `lodging_amenities_id` INT NOT NULL,
  PRIMARY KEY (`lodging_id`, `lodging_amenities_id`),
  INDEX `fk_lodging_has_lodging_amenities_lodging_amenities1_idx` (`lodging_amenities_id` ASC),
  INDEX `fk_lodging_has_lodging_amenities_lodging1_idx` (`lodging_id` ASC),
  CONSTRAINT `fk_lodging_has_lodging_amenities_lodging1`
    FOREIGN KEY (`lodging_id`)
    REFERENCES `lodging` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lodging_has_lodging_amenities_lodging_amenities1`
    FOREIGN KEY (`lodging_amenities_id`)
    REFERENCES `lodging_amenities` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trip_message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trip_message` ;

CREATE TABLE IF NOT EXISTS `trip_message` (
  `id` INT NOT NULL,
  `message` TEXT NOT NULL,
  `created_date` DATETIME NULL,
  `trip_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_trip_message_trip1_idx` (`trip_id` ASC),
  INDEX `fk_trip_message_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_trip_message_trip1`
    FOREIGN KEY (`trip_id`)
    REFERENCES `trip` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_trip_message_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_has_friend`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_has_friend` ;

CREATE TABLE IF NOT EXISTS `user_has_friend` (
  `user_id` INT NOT NULL,
  `friend_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `friend_id`),
  INDEX `fk_user_has_user_user2_idx` (`friend_id` ASC),
  INDEX `fk_user_has_user_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_user_user2`
    FOREIGN KEY (`friend_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `private_message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `private_message` ;

CREATE TABLE IF NOT EXISTS `private_message` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `message` TEXT NULL,
  `create_date` DATETIME NULL,
  `enabled` TINYINT NULL,
  `sender_id` INT NOT NULL,
  `reciever_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_private_message_user1_idx` (`sender_id` ASC),
  INDEX `fk_private_message_user2_idx` (`reciever_id` ASC),
  CONSTRAINT `fk_private_message_user1`
    FOREIGN KEY (`sender_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_private_message_user2`
    FOREIGN KEY (`reciever_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS edwin@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'edwin'@'localhost' IDENTIFIED BY 'edwin';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'edwin'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `excursiondb`;
INSERT INTO `address` (`id`, `country`, `city`, `postal_code`, `address`, `phone`, `state`, `enabled`) VALUES (1, 'USA', 'Twin Peaks', '567543', 'Main Street', '506789536', 'California', 1);
INSERT INTO `address` (`id`, `country`, `city`, `postal_code`, `address`, `phone`, `state`, `enabled`) VALUES (2, 'USA', 'Los Angeles', '478245', 'Washington Street', '589909333', 'California', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `excursiondb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `image`, `biography`, `email_address`, `first_name`, `last_name`, `address_id`) VALUES (1, 'admin', 'admin', 1, 'admin', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `image`, `biography`, `email_address`, `first_name`, `last_name`, `address_id`) VALUES (2, 'Dom', 'Dom', 1, 'user', NULL, NULL, NULL, NULL, NULL, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `trip`
-- -----------------------------------------------------
START TRANSACTION;
USE `excursiondb`;
INSERT INTO `trip` (`id`, `start_date`, `end_date`, `name`, `description`, `capacity`, `image`, `cost`, `enabled`, `organizer_id`) VALUES (1, '2013/05/12', '2013/06/07', 'Jerrys Trip', 'Friends Trip', NULL, NULL, 50, 1, 1);
INSERT INTO `trip` (`id`, `start_date`, `end_date`, `name`, `description`, `capacity`, `image`, `cost`, `enabled`, `organizer_id`) VALUES (2, '2016/07/11', '2016/09/04', 'Doms Trip', 'Awesome Trip', NULL, NULL, 60, 1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `review`
-- -----------------------------------------------------
START TRANSACTION;
USE `excursiondb`;
INSERT INTO `review` (`user_id`, `trip_id`, `comment`, `create_date`, `rating`, `last_updated`, `enabled`) VALUES (1, 1, 'Great Trip', NULL, NULL, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `transportation_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `excursiondb`;
INSERT INTO `transportation_type` (`id`, `type`) VALUES (1, 'Airplane');

COMMIT;


-- -----------------------------------------------------
-- Data for table `transportation`
-- -----------------------------------------------------
START TRANSACTION;
USE `excursiondb`;
INSERT INTO `transportation` (`id`, `company`, `departure_date`, `arrival_date`, `cost`, `image`, `description`, `enabled`, `transportation_type_id`, `departure_address_id`, `arrival_address_id`) VALUES (1, 'American Airlines', '2019/11/09', '2019/10/10', 65, '', NULL, 1, 1, 1, 1);
INSERT INTO `transportation` (`id`, `company`, `departure_date`, `arrival_date`, `cost`, `image`, `description`, `enabled`, `transportation_type_id`, `departure_address_id`, `arrival_address_id`) VALUES (2, 'AmTrak', '2020/04/05', '2020/06/07', 78, NULL, NULL, 1, 1, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `lodging`
-- -----------------------------------------------------
START TRANSACTION;
USE `excursiondb`;
INSERT INTO `lodging` (`id`, `name`, `description`, `price`, `check_in_time`, `check_out_time`, `image`, `enabled`, `address_id`, `trip_id`) VALUES (1, 'Marriott', NULL, NULL, NULL, NULL, NULL, 1, 1, 1);
INSERT INTO `lodging` (`id`, `name`, `description`, `price`, `check_in_time`, `check_out_time`, `image`, `enabled`, `address_id`, `trip_id`) VALUES (2, 'Hilton', NULL, NULL, NULL, NULL, NULL, 1, 2, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_has_trip`
-- -----------------------------------------------------
START TRANSACTION;
USE `excursiondb`;
INSERT INTO `user_has_trip` (`user_id`, `trip_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `activity_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `excursiondb`;
INSERT INTO `activity_type` (`id`, `activity_type`) VALUES (1, 'Attraction');
INSERT INTO `activity_type` (`id`, `activity_type`) VALUES (2, 'Dinner');

COMMIT;


-- -----------------------------------------------------
-- Data for table `activity`
-- -----------------------------------------------------
START TRANSACTION;
USE `excursiondb`;
INSERT INTO `activity` (`id`, `name`, `start_date`, `description`, `image`, `cost`, `end_date`, `approved`, `enabled`, `address_id`, `trip_id`, `activity_type_id`) VALUES (1, 'Disney World', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `lodging_amenities`
-- -----------------------------------------------------
START TRANSACTION;
USE `excursiondb`;
INSERT INTO `lodging_amenities` (`id`, `name`) VALUES (1, 'Pool');
INSERT INTO `lodging_amenities` (`id`, `name`) VALUES (2, 'Gym');

COMMIT;


-- -----------------------------------------------------
-- Data for table `lodging_has_lodging_amenities`
-- -----------------------------------------------------
START TRANSACTION;
USE `excursiondb`;
INSERT INTO `lodging_has_lodging_amenities` (`lodging_id`, `lodging_amenities_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `trip_message`
-- -----------------------------------------------------
START TRANSACTION;
USE `excursiondb`;
INSERT INTO `trip_message` (`id`, `message`, `created_date`, `trip_id`, `user_id`) VALUES (1, 'hi', NULL, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_has_friend`
-- -----------------------------------------------------
START TRANSACTION;
USE `excursiondb`;
INSERT INTO `user_has_friend` (`user_id`, `friend_id`) VALUES (1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `private_message`
-- -----------------------------------------------------
START TRANSACTION;
USE `excursiondb`;
INSERT INTO `private_message` (`id`, `message`, `create_date`, `enabled`, `sender_id`, `reciever_id`) VALUES (1, 'hi bob', NULL, 1, 1, 1);

COMMIT;

