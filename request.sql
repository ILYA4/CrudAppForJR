CREATE TABLE `test`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `age` INT NOT NULL,
  `isAdmin` TINYINT(4) NOT NULL DEFAULT b'0',
  `createdDate` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC));
INSERT INTO `test`.`users` (`name`, `age`, `isAdmin`) VALUES ('Linda', '2', b'1');
INSERT INTO `test`.`users` (`name`, `age`, `isAdmin`) VALUES ('Oksana', '1', b'0');
INSERT INTO `test`.`users` (`name`, `age`, `isAdmin`) VALUES ('Kristina', '1', b'0');
INSERT INTO `test`.`users` (`name`, `age`, `isAdmin`) VALUES ('Michail', '1', b'0');
INSERT INTO `test`.`users` (`name`, `age`, `isAdmin`) VALUES ('Stalin', '1', b'0');
INSERT INTO `test`.`users` (`name`, `age`, `isAdmin`) VALUES ('Gitler', '1', b'0');
INSERT INTO `test`.`users` (`name`, `age`, `isAdmin`) VALUES ('noname', '1', b'0');
INSERT INTO `test`.`users` (`name`, `age`, `isAdmin`) VALUES ('zenit', '1', b'0');
INSERT INTO `test`.`users` (`name`, `age`, `isAdmin`) VALUES ('Alfa', '1', b'0');
INSERT INTO `test`.`users` (`name`, `age`, `isAdmin`) VALUES ('Beta', '1', b'0');
INSERT INTO `test`.`users` (`name`, `age`, `isAdmin`) VALUES ('Gamma', '1', b'0');
