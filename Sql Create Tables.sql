--Customers
CREATE TABLE `cecs323sec5s13`.`Customers` (
  `CustomersID` INT NOT NULL,
  `custName` VARCHAR(45) NOT NULL,
  `custEmail` VARCHAR(45) NOT NULL,
  `snailMail` VARCHAR(45) NOT NULL,
  `customerType` VARCHAR(45) NOT NULL,
  `MimingsMoney` INT ZEROFILL NOT NULL,
  PRIMARY KEY (`CustomersID`));

--Corporation
CREATE TABLE `cecs323sec5s13`.`Corporation` (
  `CustomerID` int(11) NOT NULL,
  `corpName` varchar(45) NOT NULL,
  `organizationName` varchar(45) NOT NULL,
  `officeAddress` varchar(45) NOT NULL,
  `contactInfo` varchar(45) NOT NULL,
  PRIMARY KEY (`CustomerID`,`corpName`));

--ShiftCrew
CREATE TABLE `cecs323sec5s13`.`ShiftCrew` (
  `ShiftID` INT NOT NULL,
  `shiftName` VARCHAR(45) NOT NULL,
  `shiftDate` DATE NOT NULL,
  `shiftTime` TIME NOT NULL,
  PRIMARY KEY (`ShiftID`));

--Employee
CREATE TABLE `cecs323sec5s13`.`Employee` (
  `EmployeeID` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `DOB` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `wage` INT ZEROFILL NOT NULL,
  `position` VARCHAR(45) NOT NULL,
  `shift` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`EmployeeID`));

--Chef
CREATE TABLE `cecs323sec5s13`.`Chef` (
  `EmployeeID` INT NOT NULL,
  `experience` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`EmployeeID`));

--HeadChef
CREATE TABLE `cecs323sec5s13`.`HeadChef` (
  `EmployeeID` INT NOT NULL,
  `ShiftID` INT NOT NULL,
  PRIMARY KEY (`EmployeeID`));

--SousChef
CREATE TABLE `cecs323sec5s13`.`SousChef` (
  `EmployeeID` INT NOT NULL,
  `ShiftID` INT NOT NULL,
  PRIMARY KEY (`EmployeeID`));

--LineCook
CREATE TABLE `cecs323sec5s13`.`LineCook` (
  `EmployeeID` int(11) NOT NULL,
  `ShiftID` int(11) NOT NULL,
  `department` varchar(45) NOT NULL,
  PRIMARY KEY (`EmployeeID`));

--Recipes
CREATE TABLE `cecs323sec5s13`.`Recipes` (
  `EmployeeID` INT NOT NULL,
  `recipe` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`EmployeeID`, `recipe`));

--MentorShip
CREATE TABLE `cecs323sec5s13`.`MentorShip` (
  `Employee1ID` INT NOT NULL,
  `Employee2ID` INT NOT NULL,
  `MenuItemID` INT NOT NULL,
  `startDate` DATE NOT NULL,
  `endDate` DATE NULL,
  PRIMARY KEY (`Employee1ID`, `Employee2ID`, `MenuItemID`, `startDate`));

--MenuItemSet
CREATE TABLE `cecs323sec5s13`.`MenuItemSet` (
  `EmployeeID` INT NOT NULL,
  `menuItemSet` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`EmployeeID`));

--Maitred
CREATE TABLE `cecs323sec5s13`.`Maitred` (
  `EmployeeID` INT NOT NULL,
  `ShiftID` INT NOT NULL,
  `tables` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`EmployeeID`));

--WaitStaff
CREATE TABLE `cecs323sec5s13`.`WaitStaff` (
  `EmployeeID` INT NOT NULL,
  `ShiftID` INT NOT NULL,
  `tips` INT ZEROFILL NOT NULL,
  PRIMARY KEY (`EmployeeID`));

--AssignedTables
CREATE TABLE `cecs323sec5s13`.`AssignedTables` (
  `EmployeeID` INT NOT NULL,
  `assignedTable` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`EmployeeID`, `assignedTable`));

--Manager
CREATE TABLE `cecs323sec5s13`.`Manager` (
  `EmployeeID` INT NOT NULL,
  `ShiftID` INT NOT NULL,
  `inChargeOf` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`EmployeeID`));

--Order
CREATE TABLE `cecs323sec5s13`.`Order` (
  `OrderID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `orderDate` DATE NOT NULL,
  `orderType` VARCHAR(45) NOT NULL,
  `ServerID` INT NOT NULL,
  PRIMARY KEY (`OrderID`));

--Menu
CREATE TABLE `cecs323sec5s13`.`Menu` (
  `MenuID` INT NOT NULL,
  `menuType` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MenuID`));

--OrderDetails
CREATE TABLE `cecs323sec5s13`.`OrderDetails` (
  `OrderID` int(11) NOT NULL,
  `MenuID` int(11) NOT NULL,
  `MenuItemID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`OrderID`,`MenuID`,`MenuItemID`));

--MenuMI
CREATE TABLE `cecs323sec5s13`.`MenuMI` (
  `MenuID` int(11) NOT NULL,
  `MenuItemID` int(11) NOT NULL,
  `size` varchar(45) NOT NULL,
  `price` decimal(4,0) NOT NULL,
  PRIMARY KEY (`MenuID`,`MenuItemID`));

--MenuItem
CREATE TABLE `cecs323sec5s13`.`MenuItem` (
  `MenuItemID` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `categoryAbbr` varchar(45) NOT NULL,
  `spiceAbbr` varchar(45) NOT NULL,
  PRIMARY KEY (`MenuItemID`));

--Spices
CREATE TABLE `cecs323sec5s13`.`Spices` (
  `spiceAbbr` varchar(10) NOT NULL,
  `spice` varchar(45) NOT NULL,
  PRIMARY KEY (`spiceAbbr`));

--Categories
CREATE TABLE `cecs323sec5s13`.`Categories` (
  `categoryAbbr` VARCHAR(10) NOT NULL,
  `category` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`categoryAbbr`));


-------------------------------------------------
--Corporation
ALTER TABLE `cecs323sec5s13`.`Corporation` 
ADD CONSTRAINT `customerID_FK` 
    FOREIGN KEY (`CustomerID`) 
    REFERENCES `Customers` (`CustomersID`) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION;

--Chef
ALTER TABLE `cecs323sec5s13`.`Chef` 
ADD CONSTRAINT `Chef_FK`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `Employee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--HeadChef
ALTER TABLE `cecs323sec5s13`.`HeadChef` 
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

--SousChef
ALTER TABLE `cecs323sec5s13`.`SousChef` 
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

--LineCook
ALTER TABLE `cecs323sec5s13`.`LineCook` 
ADD CONSTRAINT `LineID_FK` FOREIGN KEY (`EmployeeID`) 
    REFERENCES `Employee` (`EmployeeID`) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION,
ADD CONSTRAINT `LineShift_FK` FOREIGN KEY (`ShiftID`) 
    REFERENCES `ShiftCrew` (`ShiftID`) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION;

--Recipes
ALTER TABLE `cecs323sec5s13`.`Recipes` 
ADD CONSTRAINT `RecipeID_FK`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `HeadChef` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--MentorShip
ALTER TABLE `cecs323sec5s13`.`MentorShip` 
ADD CONSTRAINT `Employee1ID_FK`
    FOREIGN KEY (`Employee1ID`)
    REFERENCES `SousChef` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
ADD CONSTRAINT `Employee2ID_FK`
    FOREIGN KEY (`Employee2ID`)
    REFERENCES `SousChef` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
ADD CONSTRAINT `MenuItemMentor_FK`
    FOREIGN KEY (`MenuItemID`)
    REFERENCES `MenuItem` (`MenuItemID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--MenuItemSet
ALTER TABLE `cecs323sec5s13`.`MenuItemSet` 
ADD CONSTRAINT `MIEmployeeID_FK`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `SousChef` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--Maitred
ALTER TABLE `cecs323sec5s13`.`Maitred` 
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

--WaitStaff
ALTER TABLE `cecs323sec5s13`.`WaitStaff` 
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

--AssignedTables
ALTER TABLE `cecs323sec5s13`.`AssignedTables` 
ADD CONSTRAINT `AssignedID_FK`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `WaitStaff` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--Manager
ALTER TABLE `cecs323sec5s13`.`Manager` 
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

--Order
ALTER TABLE `cecs323sec5s13`.`Order` 
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

--OrderDetails
ALTER TABLE `cecs323sec5s13`.`OrderDetails` 
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

--MenuMI
ALTER TABLE `cecs323sec5s13`.`MenuMI` 
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

--MenuItem
ALTER TABLE `cecs323sec5s13`.`MenuItem` 
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