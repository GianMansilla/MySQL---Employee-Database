CREATE DATABASE Sales;
USE Sales;
CREATE TABLE sales
(
	purchase_number INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    date_of_purchase DATE NOT NULL,
    customer_id INT,
    item_code VARCHAR(10) NOT NULL
    );

CREATE TABLE customers
(
	customer_id INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT
    );
    
DROP TABLE sales;

DROP TABLE customers;

CREATE TABLE customers
(
	customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
    PRIMARY KEY (customer_id)
    );
    
ALTER TABLE customers
ADD COLUMN gender ENUM('M','F') AFTER last_name;

INSERT INTO customers(first_name, last_name, gender, email_address, number_of_complaints)
VALUES ('John','Mackinley','M','john.mckinley@365careers.com', 0)
;    

ALTER TABLE customers
CHANGE COLUMN number_of_complaints number_of_complaints INT DEFAULT 0;

INSERT INTO customers (first_name, last_name, gender)
VALUES ('Peter', 'Figaro', 'M')
;

SELECT *
FROM customers
;

ALTER TABLE customers
ALTER COLUMN number_of_complaints DROP DEFAULT
;
    
CREATE TABLE items
(
	item_code VARCHAR(255),
    item VARCHAR(255),
    unit_price NUMERIC(10,2),
    company_id VARCHAR (255),
    PRIMARY KEY (item_code)
    );
    
CREATE TABLE companies
(
	company_id VARCHAR(255),
    company_name VARCHAR(255),
    headquarters_phone_number INT(12),
    PRIMARY KEY (company_id)
    );
    
DROP TABLE companies
;

CREATE TABLE companies
(
	company_id VARCHAR(255),
    company_name VARCHAR(255) DEFAULT "X",
    headquarters_phone_number VARCHAR(255),
    PRIMARY KEY (company_id),
    UNIQUE KEY (headquarters_phone_number)
    );
    
DROP TABLE companies
;

CREATE TABLE companies
(
	company_id INT AUTO_INCREMENT,
    company_name VARCHAR(255) NOT NULL,
    headquarters_phone_number VARCHAR(255),
    PRIMARY KEY (company_id)
    );
    
ALTER TABLE companies
MODIFY company_name VARCHAR(255) NULL
;

ALTER TABLE companies
CHANGE COLUMN company_name company_name VARCHAR(255) NOT NULL
;

INSERT INTO companies (company_name, headquarters_phone_number)
VALUES ('COmpany A', '+1 (202) 555-0196')
;

SELECT *
FROM companies
;

