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
  `image` TEXT NULL,
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
INSERT INTO `trip` (`id`, `start_date`, `end_date`, `name`, `description`, `capacity`, `image`, `cost`, `enabled`, `organizer_id`) VALUES (1, '2013/04/05', '2013/05/06', 'jerrys trip', 'cool', 5, 'data:image/jpeg;base64,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', 50, 1, 1);
INSERT INTO `trip` (`id`, `start_date`, `end_date`, `name`, `description`, `capacity`, `image`, `cost`, `enabled`, `organizer_id`) VALUES (2, '2016/06/07', '2016/06/08', 'doms trip', 'awesome', 5, 'data:image/jpeg;base64,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', 60, 1, 2);
INSERT INTO `trip` (`id`, `start_date`, `end_date`, `name`, `description`, `capacity`, `image`, `cost`, `enabled`, `organizer_id`) VALUES (3, '2018/07/10', '2019/09/09', 'edwins trip', 'amazing', 4, 'data:image/jpeg;base64,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', 60, 1, 2);

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

