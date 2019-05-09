-- Customers
CREATE TABLE `Customers` (
  `CustomersID` INT NOT NULL,
  `custName` VARCHAR(45) NOT NULL,
  `custEmail` VARCHAR(45) NOT NULL,
  `snailMail` VARCHAR(45) NOT NULL,
  `customerType` VARCHAR(45) NOT NULL,
  `MimingsMoney` INT NOT NULL,
  PRIMARY KEY (`CustomersID`));

-- Corporation
CREATE TABLE `Corporation` (
  `CustomerID` int(11) NOT NULL,
  `corpName` varchar(45) NOT NULL,
  `organizationName` varchar(45) NOT NULL,
  `officeAddress` varchar(45) NOT NULL,
  `contactInfo` varchar(45) NOT NULL,
  PRIMARY KEY (`CustomerID`,`corpName`));

-- ShiftCrew
CREATE TABLE `ShiftCrew` (
  `ShiftID` INT NOT NULL,
  `shiftName` VARCHAR(45) NOT NULL,
  `shiftDays` VARCHAR(45) NOT NULL,
  `shiftTime` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`ShiftID`));

-- Employee
CREATE TABLE `Employee` (
  `EmployeeID` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `DOB` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `wage` INT NOT NULL,
  `position` VARCHAR(45) NOT NULL,
  `shift` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`EmployeeID`));

-- Chef
CREATE TABLE `Chef` (
  `EmployeeID` INT NOT NULL,
  `experience` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`EmployeeID`));

-- HeadChef
CREATE TABLE `HeadChef` (
  `EmployeeID` INT NOT NULL,
  `ShiftID` INT NOT NULL,
  PRIMARY KEY (`EmployeeID`));

-- SousChef
CREATE TABLE `SousChef` (
  `EmployeeID` INT NOT NULL,
  `ShiftID` INT NOT NULL,
  PRIMARY KEY (`EmployeeID`));

-- LineCook
CREATE TABLE `LineCook` (
  `EmployeeID` int(11) NOT NULL,
  `ShiftID` int(11) NOT NULL,
  `department` varchar(45) NOT NULL,
  PRIMARY KEY (`EmployeeID`));

-- Recipes
CREATE TABLE `Recipes` (
  `EmployeeID` INT NOT NULL,
  `recipe` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`EmployeeID`, `recipe`));

-- MentorShip
CREATE TABLE `MentorShip` (
  `MentorID` INT NOT NULL,
  `MenteeID` INT NOT NULL,
  `MenuItemID` INT NOT NULL,
  `startDate` DATE NOT NULL,
  `endDate` DATE NULL,
  PRIMARY KEY (`MentorID`, `MenteeID`, `MenuItemID`, `startDate`));

-- MenuItemSet
CREATE TABLE `MenuItemSet` (
  `EmployeeID` INT NOT NULL,
  `menuItemSet` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`EmployeeID`, `menuItemSet`));

-- Maitred
CREATE TABLE `Maitred` (
  `EmployeeID` INT NOT NULL,
  `ShiftID` INT NOT NULL,
  `tables` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`EmployeeID`));

-- WaitStaff
CREATE TABLE `WaitStaff` (
  `EmployeeID` INT NOT NULL,
  `ShiftID` INT NOT NULL,
  `tips` INT NOT NULL,
  PRIMARY KEY (`EmployeeID`));

-- AssignedTables
CREATE TABLE `AssignedTables` (
  `EmployeeID` INT NOT NULL,
  `assignedTable` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`EmployeeID`, `assignedTable`));

-- Manager
CREATE TABLE `Manager` (
  `EmployeeID` INT NOT NULL,
  `ShiftID` INT NOT NULL,
  `inChargeOf` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`EmployeeID`));

-- Order
CREATE TABLE `Order` (
  `OrderID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `orderDate` DATE NOT NULL,
  `orderType` VARCHAR(45) NOT NULL,
  `ServerID` INT NOT NULL,
  PRIMARY KEY (`OrderID`));

-- Menu
CREATE TABLE `Menu` (
  `MenuID` INT NOT NULL,
  `menuType` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MenuID`));

-- OrderDetails
CREATE TABLE `OrderDetails` (
  `OrderID` int(11) NOT NULL,
  `MenuID` int(11) NOT NULL,
  `MenuItemID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`OrderID`,`MenuID`,`MenuItemID`));

-- MenuMI
CREATE TABLE `MenuMI` (
  `MenuID` int(11) NOT NULL,
  `MenuItemID` int(11) NOT NULL,
  `size` varchar(45),
  `price` decimal(4,2) NOT NULL,
  PRIMARY KEY (`MenuID`,`MenuItemID`));

-- MenuItem
CREATE TABLE `MenuItem` (
  `MenuItemID` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `categoryAbbr` varchar(8) NOT NULL,
  `spiceAbbr` varchar(8) NOT NULL,
  PRIMARY KEY (`MenuItemID`));

-- Spices
CREATE TABLE `Spices` (
  `spiceAbbr` varchar(10) NOT NULL,
  `spice` varchar(45) NOT NULL,
  PRIMARY KEY (`spiceAbbr`));

-- Categories
CREATE TABLE `Categories` (
  `categoryAbbr` VARCHAR(10) NOT NULL,
  `category` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`categoryAbbr`));

CREATE TABLE `Dishwasher` (
  `EmployeeID` INT NOT NULL,
  `ShiftID` INT NOT NULL,
  PRIMARY KEY (`EmployeeID`));


-- -----------------------------------------------
-- Corporation
ALTER TABLE `Corporation` 
ADD CONSTRAINT `customerID_FK` 
    FOREIGN KEY (`CustomerID`) 
    REFERENCES `Customers` (`CustomersID`) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION;

-- Chef
ALTER TABLE `Chef` 
ADD CONSTRAINT `Chef_FK`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `Employee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

-- HeadChef
ALTER TABLE `HeadChef` 
ADD CONSTRAINT `HeadChefID_FK`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `Employee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
ADD CONSTRAINT `HeadChefShift_FK`
    FOREIGN KEY (`ShiftID`)
    REFERENCES `ShiftCrew` (`ShiftID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

-- SousChef
ALTER TABLE `SousChef` 
ADD CONSTRAINT `SousID_FK`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `Employee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
ADD CONSTRAINT `SousShift_FK`
    FOREIGN KEY (`ShiftID`)
    REFERENCES `ShiftCrew` (`ShiftID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

-- LineCook
ALTER TABLE `LineCook` 
ADD CONSTRAINT `LineID_FK` FOREIGN KEY (`EmployeeID`) 
    REFERENCES `Employee` (`EmployeeID`) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION,
ADD CONSTRAINT `LineShift_FK` FOREIGN KEY (`ShiftID`) 
    REFERENCES `ShiftCrew` (`ShiftID`) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION;

-- Recipes
ALTER TABLE `Recipes` 
ADD CONSTRAINT `RecipeID_FK`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `HeadChef` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

-- MentorShip
ALTER TABLE `MentorShip` 
ADD CONSTRAINT `MentorID_FK`
    FOREIGN KEY (`MentorID`)
    REFERENCES `SousChef` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
ADD CONSTRAINT `MenteeID_FK`
    FOREIGN KEY (`MenteeID`)
    REFERENCES `SousChef` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
ADD CONSTRAINT `MenuItemMentor_FK`
    FOREIGN KEY (`MenuItemID`)
    REFERENCES `MenuItem` (`MenuItemID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

-- MenuItemSet
ALTER TABLE `MenuItemSet` 
ADD CONSTRAINT `MIEmployeeID_FK`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `SousChef` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

-- Maitred
ALTER TABLE `Maitred` 
ADD CONSTRAINT `MaitreID_FK`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `Employee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
ADD CONSTRAINT `MaitreShift_FK`
    FOREIGN KEY (`ShiftID`)
    REFERENCES `ShiftCrew` (`ShiftID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

-- WaitStaff
ALTER TABLE `WaitStaff` 
ADD CONSTRAINT `WaitStaffID_FK`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `Employee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
ADD CONSTRAINT `WaitStaffShift_FK`
    FOREIGN KEY (`ShiftID`)
    REFERENCES `ShiftCrew` (`ShiftID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

-- AssignedTables
ALTER TABLE `AssignedTables` 
ADD CONSTRAINT `AssignedID_FK`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `WaitStaff` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

-- Manager
ALTER TABLE `Manager` 
ADD CONSTRAINT `ManagerID_FK`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `Employee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
ADD CONSTRAINT `ManagerShift_FK`
    FOREIGN KEY (`ShiftID`)
    REFERENCES `ShiftCrew` (`ShiftID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

-- Order
ALTER TABLE `Order` 
ADD CONSTRAINT `CustomerOrderID_FK`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `Customers` (`CustomersID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
ADD CONSTRAINT `ServerID_FK`
    FOREIGN KEY (`ServerID`)
    REFERENCES `WaitStaff` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

-- OrderDetails
ALTER TABLE `OrderDetails` 
ADD CONSTRAINT `MenuMI_FK` 
    FOREIGN KEY (`MenuID`, `MenuItemID`) 
    REFERENCES `MenuMI` (`MenuID`, `MenuItemID`) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION,
ADD CONSTRAINT `OrderID_FK` 
    FOREIGN KEY (`OrderID`) 
    REFERENCES `Order` (`OrderID`) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION;

-- MenuMI
ALTER TABLE `MenuMI` 
ADD CONSTRAINT `MenuID_FK` 
    FOREIGN KEY (`MenuID`) 
    REFERENCES `Menu` (`MenuID`) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION,
ADD CONSTRAINT `MenuItemID_FK` 
    FOREIGN KEY (`MenuItemID`) 
    REFERENCES `MenuItem` (`MenuItemID`) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION;

-- MenuItem
ALTER TABLE `MenuItem` 
ADD CONSTRAINT `Category_FK` 
    FOREIGN KEY (`categoryAbbr`) 
    REFERENCES `Categories` (`categoryAbbr`) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION,
ADD CONSTRAINT `Spices_FK` 
    FOREIGN KEY (`spiceAbbr`) 
    REFERENCES `Spices` (`spiceAbbr`) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION;

-- Dishwasher
ALTER TABLE `Dishwasher` 
ADD CONSTRAINT `DWID_FK`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `Employee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
ADD CONSTRAINT `DWShift_FK`
    FOREIGN KEY (`ShiftID`)
    REFERENCES `ShiftCrew` (`ShiftID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
ALTER TABLE Employee ADD UNIQUE KEY `Employee_CK` (`name`, `DOB`, `email`);
ALTER TABLE Spices ADD UNIQUE KEY `Spices_CK` (`spice`);
ALTER TABLE Categories ADD UNIQUE KEY `Categories_CK` (`category`);
