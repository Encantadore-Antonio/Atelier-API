-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'Products'
--
-- ---

DROP TABLE IF EXISTS `Products`;

CREATE TABLE `Products` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `campus` VARCHAR NULL DEFAULT NULL,
  `name` VARCHAR NULL DEFAULT NULL,
  `slogan` VARCHAR NULL DEFAULT NULL,
  `description` VARCHAR NULL DEFAULT NULL,
  `category` VARCHAR NULL DEFAULT NULL,
  `default_price` VARCHAR NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `features` VARCHAR NULL DEFAULT NULL,
  `styles` VARCHAR NULL DEFAULT NULL,
  `avgRating` INTEGER NULL DEFAULT NULL,
KEY (`id`)
);

-- ---
-- Table 'Features'
--
-- ---

DROP TABLE IF EXISTS `Features`;

CREATE TABLE `Features` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `value` CHAR NULL DEFAULT NULL,
  `feature` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Styles'
--
-- ---

DROP TABLE IF EXISTS `Styles`;

CREATE TABLE `Styles` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR NULL DEFAULT NULL,
  `style_id` INTEGER NULL DEFAULT NULL,
  `original_price` VARCHAR NULL DEFAULT NULL,
  `sale_price` VARCHAR NULL DEFAULT NULL,
  `default?` VARCHAR NULL DEFAULT NULL,
  `photos` VARCHAR NULL DEFAULT NULL,
  `skus` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Category'
--
-- ---

DROP TABLE IF EXISTS `Category`;

CREATE TABLE `Category` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `category` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Photos'
--
-- ---

DROP TABLE IF EXISTS `Photos`;

CREATE TABLE `Photos` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `thumbnail_url` VARCHAR NULL DEFAULT NULL,
  `url` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Skus'
--
-- ---

DROP TABLE IF EXISTS `Skus`;

CREATE TABLE `Skus` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `quantity` INTEGER NULL DEFAULT NULL,
  `size` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Campus'
--
-- ---

DROP TABLE IF EXISTS `Campus`;

CREATE TABLE `Campus` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `campus` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE `Products` ADD FOREIGN KEY (campus) REFERENCES `Campus` (`id`);
ALTER TABLE `Products` ADD FOREIGN KEY (category) REFERENCES `Category` (`id`);
ALTER TABLE `Products` ADD FOREIGN KEY (features) REFERENCES `Features` (`id`);
ALTER TABLE `Products` ADD FOREIGN KEY (styles) REFERENCES `Styles` (`id`);
ALTER TABLE `Products` ADD FOREIGN KEY (avgRating) REFERENCES `Reviews` (`id`);
ALTER TABLE `Styles` ADD FOREIGN KEY (photos) REFERENCES `Photos` (`id`);
ALTER TABLE `Styles` ADD FOREIGN KEY (skus) REFERENCES `Skus` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `Products` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Features` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Styles` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Category` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Photos` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Skus` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Campus` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Reviews` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `Products` (`id`,`campus`,`name`,`slogan`,`description`,`category`,`default_price`,`updated_at`,`created_at`,`features`,`styles`,`avgRating`) VALUES
-- ('','','','','','','','','','','','');
-- INSERT INTO `Features` (`id`,`value`,`feature`) VALUES
-- ('','','');
-- INSERT INTO `Styles` (`id`,`name`,`style_id`,`original_price`,`sale_price`,`default?`,`photos`,`skus`) VALUES
-- ('','','','','','','','');
-- INSERT INTO `Category` (`id`,`category`) VALUES
-- ('','');
-- INSERT INTO `Photos` (`id`,`thumbnail_url`,`url`) VALUES
-- ('','','');
-- INSERT INTO `Skus` (`id`,`quantity`,`size`) VALUES
-- ('','','');
-- INSERT INTO `Campus` (`id`,`campus`) VALUES
-- ('','');
-- INSERT INTO `Reviews` (`id`,`review_id`,`rating`,`summary`,`recommend`,`response`,`body`,`date`,`reviewer_name`,`helpfulness`,`photos`) VALUES
-- ('','','','','','','','','','','');