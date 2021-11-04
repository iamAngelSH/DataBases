DROP SCHEMA IF EXISTS `cuteCar_Dealership` ;
CREATE SCHEMA IF NOT EXISTS `cuteCar_Dealership` DEFAULT CHARACTER SET utf8mb4 ;


set global local_infile= 1; -- allows for connection to local files
SET GLOBAL FOREIGN_KEY_CHECKS=0;

-- USE DATABASE
use cuteCar_Dealership;

-- ------------------------------------------------
-- Create salespeople table
DROP TABLE IF EXISTS `salespeople` ;

CREATE TABLE IF NOT EXISTS `salespeople`(
    salesPersonId INT(10),
    firstName VARCHAR(45) NOT NULL,
    lastName VARCHAR(45) NOT NULL,
    birthdate DATE NOT NULL,

    PRIMARY KEY (salesPersonId)
);
DROP TABLE IF EXISTS `car` ;
CREATE TABLE IF NOT EXISTS `car` (
	vinNumber VARCHAR(17) NOT NULL,
    color VARCHAR(45) NOT NULL,
    buyDate DATE NOT NULL,
    sellDate DATE NOT NULL,
    sellPrice DECIMAL NOT NULL,
    salesPersonId INT NOT NULL,
    sellerID INT NOT NULL,
    buyerID INT NOT NULL,
    
    PRIMARY KEY (vinNumber)
);
DROP TABLE IF EXISTS `buyer` ;
CREATE TABLE IF NOT EXISTS `buyer` (
	buyerId INT NOT NULL,
    firstName VARCHAR(45) NOT NULL,
    lastName VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    paymentMethod VARCHAR(45) NOT NULL,
    
    PRIMARY KEY (buyerId)
);

-- Load data using this: put your path to the files
LOAD DATA Local INFILE "C:/Users/negis/Documents/DataBases/CarDealership/salespeople.csv"
INTO TABLE salespeople 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA Local INFILE "C:/Users/negis/Documents/DataBases/CarDealership/buyer.csv"
INTO TABLE buyer 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA Local INFILE "C:/Users/negis/Documents/DataBases/CarDealership/car.csv"
INTO TABLE car 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- CHECK IF DATA IS IN TABLE
select * from salespeople;
select * from buyer;
select * from car;
