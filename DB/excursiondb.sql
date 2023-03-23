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
  `cost` DECIMAL(7,2) NULL,
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
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `image`, `biography`, `email_address`, `first_name`, `last_name`, `address_id`) VALUES (2, 'Bob', 'Bob', 1, 'user', NULL, 'Bob was born in a small town in the Midwest, the youngest of three siblings. He grew up with a passion for sports, particularly football and baseball, and was a star athlete in high school.', 'Bob@Bob', 'Bob', 'Builder', 1);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `image`, `biography`, `email_address`, `first_name`, `last_name`, `address_id`) VALUES (3, 'Joe', 'Joe', 1, 'user', NULL, 'Joe was born in a small town in the Northeast, the middle child of five siblings. He grew up with a love for music and taught himself to play the guitar at a young age.', 'Joe@Joe', 'Joe', 'Shmoe', 1);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `image`, `biography`, `email_address`, `first_name`, `last_name`, `address_id`) VALUES (4, 'Suzy', 'Suzy', 1, 'user', NULL, 'Suzy was born in a bustling city on the West Coast and grew up with a passion for the arts. From a young age, she loved to draw and paint, and she often spent hours lost in her own world of imagination.\n\n', 'Suzy@Suzy', 'Suzy', 'Lucy', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `trip`
-- -----------------------------------------------------
START TRANSACTION;
USE `excursiondb`;
INSERT INTO `trip` (`id`, `start_date`, `end_date`, `name`, `description`, `capacity`, `image`, `cost`, `enabled`, `organizer_id`) VALUES (1, '2023/07/05', '2023/08/06', 'Italy Trip', 'Join me, Bob, on this trip to Italy , where we\'ll experience the enchanting beauty of its historic cities, indulge in its world-renowned cuisine, soak up the warm Mediterranean sunshine, and create unforgettable memories together. From the stunning architecture of Rome to the charming canals of Venice, Italy promises to be an unforgettable adventure.', 5, 'data:image/jpeg;base64,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', 1000, 1, 2);
INSERT INTO `trip` (`id`, `start_date`, `end_date`, `name`, `description`, `capacity`, `image`, `cost`, `enabled`, `organizer_id`) VALUES (2, '2023/08/07', '2023/08/11', 'France Trip', 'Join me, Joe on this trip to France\nand let\'s explore the beautiful cities, savor the delicious cuisine, and immerse ourselves in the rich culture and history of this wonderful country.', 5, 'https://thumbs.dreamstime.com/b/paris-eiffel-tower-river-seine-sunset-france-one-most-iconic-landmarks-107376702.jpg', 500, 1, 3);
INSERT INTO `trip` (`id`, `start_date`, `end_date`, `name`, `description`, `capacity`, `image`, `cost`, `enabled`, `organizer_id`) VALUES (3, '2023/09/10', '2023/09/12', 'Japan Trip', 'Join me, Suzy, on this trip to Japan as we explore the unique blend of ancient traditions and modern technology that this amazing country has to offer. From the bustling streets of Tokyo to the serene temples of Kyoto, we will immerse ourselves in the rich culture and experience the vibrant energy that Japan is known for. ', 4, 'data:image/jpeg;base64,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', 1200, 1, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `review`
-- -----------------------------------------------------
START TRANSACTION;
USE `excursiondb`;
INSERT INTO `review` (`user_id`, `trip_id`, `comment`, `create_date`, `rating`, `last_updated`, `enabled`) VALUES (2, 1, 'Great Trip', NULL, 5, NULL, 1);
INSERT INTO `review` (`user_id`, `trip_id`, `comment`, `create_date`, `rating`, `last_updated`, `enabled`) VALUES (3, 2, 'Would do it again', NULL, 4, NULL, 1);
INSERT INTO `review` (`user_id`, `trip_id`, `comment`, `create_date`, `rating`, `last_updated`, `enabled`) VALUES (4, 3, 'Awesome Time', NULL, 4, NULL, 1);

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
INSERT INTO `private_message` (`id`, `message`, `create_date`, `enabled`, `sender_id`, `reciever_id`) VALUES (2, 'hi joe', NULL, 1, 2, 3);
INSERT INTO `private_message` (`id`, `message`, `create_date`, `enabled`, `sender_id`, `reciever_id`) VALUES (3, 'hi bob', NULL, NULL, 3, 2);

COMMIT;

