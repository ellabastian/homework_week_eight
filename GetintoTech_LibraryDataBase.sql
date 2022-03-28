CREATE TABLE `Book`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `title` INT NOT NULL,
    `author` VARCHAR(255) NOT NULL,
    `catergory_id` INT NOT NULL,
    `publication_year` DATE NOT NULL,
    `copies_owned` INT NOT NULL
);
ALTER TABLE
    `Book` ADD PRIMARY KEY `book_id_primary`(`id`);
CREATE TABLE `Author`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Author` ADD PRIMARY KEY `author_id_primary`(`id`);
CREATE TABLE `bookAuthor`(
    `book_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `author_id` INT NOT NULL
);
CREATE TABLE `member`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `joined_date` TIMESTAMP NOT NULL,
    `active_status` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `member` ADD PRIMARY KEY `member_id_primary`(`id`);
CREATE TABLE `fine`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `member_id` INT NOT NULL,
    `loan_id` INT NOT NULL,
    `fine_date` DATE NOT NULL,
    `fine_amount` DOUBLE(8, 2) NOT NULL
);
ALTER TABLE
    `fine` ADD PRIMARY KEY `fine_id_primary`(`id`);
CREATE TABLE `reservation`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `book_id` INT NOT NULL,
    `member_id` INT NOT NULL,
    `reservation_date` DATE NOT NULL,
    `status` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `reservation` ADD PRIMARY KEY `reservation_id_primary`(`id`);
CREATE TABLE `reservation_satus`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `status_value` INT NOT NULL
);
ALTER TABLE
    `reservation_satus` ADD PRIMARY KEY `reservation_satus_id_primary`(`id`);
CREATE TABLE `category`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `category_name` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `category` ADD PRIMARY KEY `category_id_primary`(`id`);
CREATE TABLE `fine_payment`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `member_id` INT NOT NULL,
    `payment_date` DATE NOT NULL,
    `payment_amount` DOUBLE(8, 2) NOT NULL
);
ALTER TABLE
    `fine_payment` ADD PRIMARY KEY `fine_payment_id_primary`(`id`);
CREATE TABLE `member_satus`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `status_value` INT NOT NULL
);
ALTER TABLE
    `member_satus` ADD PRIMARY KEY `member_satus_id_primary`(`id`);
CREATE TABLE `loan`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `book_id` INT NOT NULL,
    `member_id` INT NOT NULL,
    `loan_date` DATETIME NOT NULL
);
ALTER TABLE
    `loan` ADD PRIMARY KEY `loan_id_primary`(`id`);
CREATE TABLE `person`(
    `PersonID` INT NOT NULL AUTO_INCREMENT,
    `FirstName` VARCHAR(255) NOT NULL,
    `LastName` VARCHAR(255) NOT NULL,
    `Email` VARCHAR(255) NULL,
    `HobbyID` INT NULL
);
ALTER TABLE
    `person` ADD PRIMARY KEY `person_personid_primary`(`PersonID`);
ALTER TABLE
    `bookAuthor` ADD CONSTRAINT `bookauthor_book_id_foreign` FOREIGN KEY(`book_id`) REFERENCES `Book`(`id`);
ALTER TABLE
    `reservation` ADD CONSTRAINT `reservation_book_id_foreign` FOREIGN KEY(`book_id`) REFERENCES `Book`(`id`);
ALTER TABLE
    `loan` ADD CONSTRAINT `loan_book_id_foreign` FOREIGN KEY(`book_id`) REFERENCES `Book`(`id`);
ALTER TABLE
    `bookAuthor` ADD CONSTRAINT `bookauthor_author_id_foreign` FOREIGN KEY(`author_id`) REFERENCES `Author`(`id`);
ALTER TABLE
    `fine` ADD CONSTRAINT `fine_loan_id_foreign` FOREIGN KEY(`loan_id`) REFERENCES `loan`(`id`);
ALTER TABLE
    `fine` ADD CONSTRAINT `fine_member_id_foreign` FOREIGN KEY(`member_id`) REFERENCES `member`(`id`);
ALTER TABLE
    `loan` ADD CONSTRAINT `loan_member_id_foreign` FOREIGN KEY(`member_id`) REFERENCES `member`(`id`);
ALTER TABLE
    `fine_payment` ADD CONSTRAINT `fine_payment_member_id_foreign` FOREIGN KEY(`member_id`) REFERENCES `member`(`id`);
ALTER TABLE
    `reservation` ADD CONSTRAINT `reservation_member_id_foreign` FOREIGN KEY(`member_id`) REFERENCES `member`(`id`);
ALTER TABLE
    `member` ADD CONSTRAINT `member_active_status_foreign` FOREIGN KEY(`active_status`) REFERENCES `member_satus`(`id`);
ALTER TABLE
    `Book` ADD CONSTRAINT `book_catergory_id_foreign` FOREIGN KEY(`catergory_id`) REFERENCES `category`(`id`);
ALTER TABLE
    `reservation` ADD CONSTRAINT `reservation_status_foreign` FOREIGN KEY(`status`) REFERENCES `reservation_satus`(`id`);