-- MySQL Script generated by MySQL Workbench
-- Sun Feb 12 18:18:02 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema TransportationSystem
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `TransportationSystem` ;

-- -----------------------------------------------------
-- Schema TransportationSystem
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TransportationSystem` DEFAULT CHARACTER SET utf8 ;
USE `TransportationSystem` ;

-- -----------------------------------------------------
-- Table `TransportationSystem`.`Person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TransportationSystem`.`Person` ;

CREATE TABLE IF NOT EXISTS `TransportationSystem`.`Person` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `address` VARCHAR(100) NULL,
  `phone_number` VARCHAR(45) NULL,
  `email` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TransportationSystem`.`Driver`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TransportationSystem`.`Driver` ;

CREATE TABLE IF NOT EXISTS `TransportationSystem`.`Driver` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `license_number` VARCHAR(45) NULL,
  `years_of_experience` INT NULL,
  `person_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Driver_Person1_idx` (`person_id` ASC)  ,
  CONSTRAINT `fk_Driver_Person1`
    FOREIGN KEY (`person_id`)
    REFERENCES `TransportationSystem`.`Person` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TransportationSystem`.`Passenger`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TransportationSystem`.`Passenger` ;

CREATE TABLE IF NOT EXISTS `TransportationSystem`.`Passenger` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `number_of_rides` INT NULL,
  `person_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Passenger_Person_idx` (`person_id` ASC)  ,
  CONSTRAINT `fk_Passenger_Person`
    FOREIGN KEY (`person_id`)
    REFERENCES `TransportationSystem`.`Person` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TransportationSystem`.`Vehicle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TransportationSystem`.`Vehicle` ;

CREATE TABLE IF NOT EXISTS `TransportationSystem`.`Vehicle` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `make` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `year` INT NULL,
  `capacity` INT NULL,
  `driver_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Vehicle_Driver1_idx` (`driver_id` ASC)  ,
  CONSTRAINT `fk_Vehicle_Driver1`
    FOREIGN KEY (`driver_id`)
    REFERENCES `TransportationSystem`.`Driver` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TransportationSystem`.`Route`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TransportationSystem`.`Route` ;

CREATE TABLE IF NOT EXISTS `TransportationSystem`.`Route` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `vehicle_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Route_Vehicle1_idx` (`vehicle_id` ASC)  ,
  CONSTRAINT `fk_Route_Vehicle1`
    FOREIGN KEY (`vehicle_id`)
    REFERENCES `TransportationSystem`.`Vehicle` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TransportationSystem`.`Station`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TransportationSystem`.`Station` ;

CREATE TABLE IF NOT EXISTS `TransportationSystem`.`Station` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `type` VARCHAR(45) NULL,
  `address` VARCHAR(100) NULL,
  `route_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Station_Route1_idx` (`route_id` ASC)  ,
  CONSTRAINT `fk_Station_Route1`
    FOREIGN KEY (`route_id`)
    REFERENCES `TransportationSystem`.`Route` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TransportationSystem`.`Bus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TransportationSystem`.`Bus` ;

CREATE TABLE IF NOT EXISTS `TransportationSystem`.`Bus` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `bus_number` INT NULL,
  `vehicle_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Bus_Vehicle1_idx` (`vehicle_id` ASC)  ,
  CONSTRAINT `fk_Bus_Vehicle1`
    FOREIGN KEY (`vehicle_id`)
    REFERENCES `TransportationSystem`.`Vehicle` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TransportationSystem`.`Train`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TransportationSystem`.`Train` ;

CREATE TABLE IF NOT EXISTS `TransportationSystem`.`Train` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `train_headcode` VARCHAR(45) NULL,
  `vehicle_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Train_Vehicle1_idx` (`vehicle_id` ASC)  ,
  CONSTRAINT `fk_Train_Vehicle1`
    FOREIGN KEY (`vehicle_id`)
    REFERENCES `TransportationSystem`.`Vehicle` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TransportationSystem`.`Taxi`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TransportationSystem`.`Taxi` ;

CREATE TABLE IF NOT EXISTS `TransportationSystem`.`Taxi` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `license_plate` VARCHAR(45) NULL,
  `vehicle_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Taxi_Vehicle1_idx` (`vehicle_id` ASC)  ,
  CONSTRAINT `fk_Taxi_Vehicle1`
    FOREIGN KEY (`vehicle_id`)
    REFERENCES `TransportationSystem`.`Vehicle` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TransportationSystem`.`Ticket`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TransportationSystem`.`Ticket` ;

CREATE TABLE IF NOT EXISTS `TransportationSystem`.`Ticket` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `payment_method` VARCHAR(45) NULL,
  `fare` FLOAT NULL,
  `passenger_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Ticket_Passenger1_idx` (`passenger_id` ASC)  ,
  CONSTRAINT `fk_Ticket_Passenger1`
    FOREIGN KEY (`passenger_id`)
    REFERENCES `TransportationSystem`.`Passenger` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TransportationSystem`.`VehicleMaintenance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TransportationSystem`.`VehicleMaintenance` ;

CREATE TABLE IF NOT EXISTS `TransportationSystem`.`VehicleMaintenance` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NULL,
  `type` VARCHAR(45) NULL,
  `description` VARCHAR(300) NULL,
  `vehicle_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_VehicleMaintenance_Vehicle1_idx` (`vehicle_id` ASC)  ,
  CONSTRAINT `fk_VehicleMaintenance_Vehicle1`
    FOREIGN KEY (`vehicle_id`)
    REFERENCES `TransportationSystem`.`Vehicle` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TransportationSystem`.`AccidentReport`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TransportationSystem`.`AccidentReport` ;

CREATE TABLE IF NOT EXISTS `TransportationSystem`.`AccidentReport` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NULL,
  `description` VARCHAR(300) NULL,
  `person_id` INT NOT NULL,
  `vehicle_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_AccidentReport_Person1_idx` (`person_id` ASC)  ,
  INDEX `fk_AccidentReport_Vehicle1_idx` (`vehicle_id` ASC)  ,
  CONSTRAINT `fk_AccidentReport_Person1`
    FOREIGN KEY (`person_id`)
    REFERENCES `TransportationSystem`.`Person` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AccidentReport_Vehicle1`
    FOREIGN KEY (`vehicle_id`)
    REFERENCES `TransportationSystem`.`Vehicle` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
