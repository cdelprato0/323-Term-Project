--
INSERT INTO ShiftCrew(ShiftID, shiftName, shiftDate, shiftTime) VALUES 
(10, "Sunday Morning", "Sunday", "8:00am" ),
(15, "Sunday Night", "Sunday", "4:00pm" ),
(20, "Monday Morning", "Monday", "8:00am" ),
(25, "Monday Night", "Monday", "4:00pm" ),
(30, "Tuesday Morning", "Tuesday", "8:00am" ),
(35, "Tuesday Night", "Tuesday", "4:00pm" ),
(40, "Wednesday Morning", "Wednesday", "8:00am" ),
(45, "Wednesday Night", "Wednesday", "4:00pm" ),
(50, "Thursday Morning", "Thursday", "8:00am" ),
(55, "Thursday Night", "Thursday", "4:00pm" ),
(60, "Friday Morning", "Friday", "8:00am" ),
(65, "Friday Night", "Friday", "4:00pm" ),
(70, "Saturday Morning", "Saturday", "8:00am" ),
(75, "Saturday Night", "Saturday", "4:00pm" );

--
INSERT INTO Employee(EmployeeID, `name`, DOB, email, wage, `position`, shift) VALUES
(0001, "Mimi Op", "05/08/1980", "mimi@mimings.com", 20000, "Manager", "Friday Nights"),
(0002, "Chaz Del Prato", "04/24/1995", "Chaz@mimings.com", 15000, "Head Chef", "Friday Nights"),
(0003, "Anthony Pham", "01/01/2000", "AnthonyP@mimings.com", 25, "Maitred", "Friday Nights"),
(0004, "Jalon Flores", "06/18/1996", "Jalon@mimings.com", 27, "Maitred", "Sunday Nights"),
(0005, "Collin Doss", "10/10/1996", "Collin@mimings.com", 5000, "Sous Chef", "Friday Nights"),
(0006, "Bob Builder", "02/22/1922", "Bob@mimings.com", 5050, "Sous Chef", "Friday Nights"),
(0007, "Shaun Haber", "03/06/1999", "Shaun@mimings.com", 600, "Line Cook", "Friday Nights"),
(0008, "Anthony Jose", "04/28/1980", "AnthonyJ@mimings.com", 500, "Line Cook", "Friday Nights"),
(0009, "Fred Drick", "06/16/1966", "Fred@mimings.com", 618, "Line Cook", "Friday Nights"),
(0010, "John Johnson", "10/06/1966", "John@mimings.com", 1000, "Line Cook", "Friday Nights"),
(0011, "Jason Byrne", "11/24/2002", "Jason@mimings.com", 5500, "Sous Chef", "Friday Nights"),
(0012, "Blake Rod", "12/25/1988", "Blake@mimings.com", 1300, "Line Cook", "Friday Nights"),
(0013, "Jimmy John", "12/30/1977", "Jimmy@mimings.com", 31, "Wait Staff", "Friday Nights"),
(0014, "Jim Feed", "12/31/1999", "Jim@mimings.com", 32, "Wait Staff", "Friday Nights"),
(0015, "Arnald Foot", "09/22/1922", "Arnald@mimings.com", 33, "Wait Staff", "Friday Nights"),
(0016, "Rick Snow", "08/05/1998", "Rick@mimings.com", 34, "Wait Staff", "Friday Nights"),
(0017, "Lisa Bisa", "07/21/1987", "Lisa@mimings.com", 35, "Wait Staff", "Friday Nights"),
(0018, "Asap Rocky", "01/11/1995", "Asap@mimings.com", 20, "Maitred", "Friday Nights"),
(0019, "Post Mo", "06/18/1996", "Post@mimings.com", 21, "Maitred", "Sunday Nights"),
(0020, "Papa Op", "06/08/1980", "Papa@mimings.com", 19000, "Manager", "Friday Nights"),
(0021, "Amanda Op", "01/03/1990", "Amanda@mimings.com", 18000, "Manager", "Friday Nights"),
(0022, "Jesus Chris", "04/30/1985", "Jesus@mimings.com", 13750, "Head Chef", "Friday Nights"),
(0023, "God Himself", "01/01/0001", "God@mimings.com", 12000, "Head Chef", "Friday Nights"),
(0024, "Biden Joe", "05/24/1750", "Biden@mimings.com", 4500, "Sous Chef", "Friday Nights"),
(0025, "Shawn Dawn", "09/02/1996", "Shawn@mimings.com", 666, "Line Cook", "Friday Nights"),
(0026, "Dawn Jose", "07/28/1980", "Dawn@mimings.com", 555, "Line Cook", "Friday Nights"),
(0027, "Falon Coee", "10/15/1988", "Falon@mimings.com", 450, "Line Cook", "Friday Nights"),
(0028, "Tom Segura", "05/24/1950", "Tom@mimings.com", 4999, "Sous Chef", "Friday Nights");

--
INSERT INTO Chef(EmployeeID, experience) VALUES 
(0002, "25 Years"),
(0005, "10 Years"),
(0006, "12 Years"),
(0007, "8 Years"),
(0008, "6 Years"),
(0009, "2 Years"),
(0010, "1 Year"),
(0011, "11 Years"),
(0012, "2 Years"),
(0022, "20 Years"),
(0023, "22 Years"),
(0024, "15 Years"),
(0025, "5 Years"),
(0026, "4 Years"),
(0027, "9 Years");

--
INSERT INTO HeadChef(EmployeeID, ShiftID) VALUES 
(0002, 15),
(0022, 10),
(0023, 20);

--
INSERT INTO SousChef(EmployeeID, ShiftID) VALUES
(0005, 15),
(0006, 10),
(0011, 20),
(0024, 25),
(0028, 30);

--
INSERT INTO LineCook(EmployeeID, ShiftID, department) VALUES
(0007, 15, "Butcher"),
(0008, 10, "Fry Cook"),
(0009, 20, "Grill Chef"),
(0010, 25, "Pantry Chef"),
(0012, 30, "Pastry Chef"),
(0025, 35, "Roast Chef"),
(0026, 40, "Saute Chef"),
(0027, 45, "Vegetable Chef");

--
INSERT INTO Maitred(EmployeeID, ShiftID, tables) VALUES
(0003, 15, "Tables"),
(0004, 25, "Tables"),
(0018, 35, "Tables"),
(0019, 45, "Tables");

--
INSERT INTO WaitStaff(EmployeeID, ShiftID, tips) VALUES
(0013, 10, 89),
(0014, 20, 99),
(0015, 30, 77),
(0016, 40, 20),
(0017, 50, 36);

--
INSERT INTO Manager(EmployeeID, ShiftID, inChargeOf) VALUES
(0001, 10, "Everyone on shift"),
(0020, 50, "Everyone on shift"),
(0021, 70, "Everyone on shift");

--
INSERT INTO Recipes(EmployeeID, recipe) VALUES
(0002, "Spring Rolls"),
(0022, "Ginger Salmon"),
(0023, "Chinese Omelette");

--
INSERT INTO MentorShip(Employee1ID, Employee2ID, MenuItemID, startDate, endDate) VALUES
(0005, 0006, 001, "2015-12-21", "2016-01-03"),
(0006, 0005, 002, "2017-11-02", "2017-11-22"),
(0006, 0024, 003, "2018-03-10", "2018-04-01"),
(0028, 0011, 006, "2018-07-30", "2018-08-03"),
(0011, 0005, 006, "2019-12-21", "NULL");

--
INSERT INTO MenuItemSet(EmployeeID, menuItemSet) VALUES
(0005, "Appetizers"),
(0006, "Soup"),
(0011, "Chow Mein"),
(0024, "Chef Special"),
(0028, "Pork");

--
INSERT INTO AssignedTables(EmployeeID, assignedTable) VALUES
(0013, "Table 22"),
(0014, "Table 12"),
(0015, "Table 8"),
(0016, "Table 1"),
(0017, "Table 17");

--
INSERT INTO Categories(categoryAbbr, category) VALUES
("App", "Appetizer"),
("Chef", "Chef Special"),
("P", "Pork"),
("C", "Chicken"),
("B","Beef"),
("S", "Seafood"),
("V", "Vegetables"),
("CM", "Chow Mein"),
("EFY", "Egg Foo Young"),
("CS", "Chop Suey");

--
INSERT INTO Spices(spiceAbbr, spice) VALUES
("M", "Mild"),
("T", "Tangy"),
("P", "Piquant"),
("H", "Hot"),
("OMG", "Oh My God");