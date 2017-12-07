-- MySQL Script generated by MySQL Workbench
-- Tuesday 31 October 2017 09:31:55 AM IST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`categories` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`posts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`posts` (
  `id` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `contents` VARCHAR(45) NOT NULL,
  `users_id` INT NOT NULL,
  `categories_id` INT NOT NULL,
  PRIMARY KEY (`id`, `users_id`, `categories_id`),
  INDEX `fk_posts_users_idx` (`users_id` ASC),
  INDEX `fk_posts_categories1_idx` (`categories_id` ASC),
  CONSTRAINT `fk_posts_users`
    FOREIGN KEY (`users_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_posts_categories1`
    FOREIGN KEY (`categories_id`)
    REFERENCES `mydb`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user_follows`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user_follows` (
  `followee_id` INT NOT NULL,
  `follower_id` INT NOT NULL,
  PRIMARY KEY (`followee_id`, `follower_id`),
  INDEX `fk_user_follows_users2_idx` (`follower_id` ASC),
  CONSTRAINT `fk_user_follows_users1`
    FOREIGN KEY (`followee_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_follows_users2`
    FOREIGN KEY (`follower_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`comments` (
  `id` INT NOT NULL,
  `comments` VARCHAR(45) NOT NULL,
  `posts_id` INT NOT NULL,
  `posts_users_id` INT NOT NULL,
  `posts_categories_id` INT NOT NULL,
  PRIMARY KEY (`id`, `posts_id`, `posts_users_id`, `posts_categories_id`),
  INDEX `fk_comments_posts1_idx` (`posts_id` ASC, `posts_users_id` ASC, `posts_categories_id` ASC),
  CONSTRAINT `fk_comments_posts1`
    FOREIGN KEY (`posts_id` , `posts_users_id` , `posts_categories_id`)
    REFERENCES `mydb`.`posts` (`id` , `users_id` , `categories_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user_actions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user_actions` (
  `posts_id` INT NOT NULL,
  `posts_users_id` INT NOT NULL,
  `posts_categories_id` INT NOT NULL,
  `action` TINYINT(1) NOT NULL,
  INDEX `fk_user_actions_posts1_idx` (`posts_id` ASC, `posts_users_id` ASC, `posts_categories_id` ASC),
  PRIMARY KEY (`posts_categories_id`, `posts_users_id`, `posts_id`),
  CONSTRAINT `fk_user_actions_posts1`
    FOREIGN KEY (`posts_id` , `posts_users_id` , `posts_categories_id`)
    REFERENCES `mydb`.`posts` (`id` , `users_id` , `categories_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;