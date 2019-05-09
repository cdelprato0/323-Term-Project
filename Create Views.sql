-- 1
CREATE VIEW MenuItem_v AS
SELECT m.menuType, mi.name, price, (SELECT spice FROM Spices WHERE mi.spiceAbbr = Spices.spiceAbbr) AS SpiceLevel FROM MenuMI menMI
INNER JOIN MenuItem mi ON mi.MenuItemID = menMI.MenuItemID
INNER JOIN Menu m ON m.MenuID = menMI.MenuID;

-- 2
CREATE VIEW Customer_addresses_v AS
SELECT * FROM Customers c LEFT JOIN Corporation cc ON c.CustomersID = cc.CustomerID
ORDER BY customerType;

-- 3
CREATE VIEW Sous_mentor_v AS
SELECT (SELECT `name` FROM Employee WHERE MentorShip.MentorID = Employee.EmployeeID) AS Mentor, 
(SELECT `name` FROM Employee WHERE MentorShip.MenteeID = Employee.EmployeeID) AS Mentee, 
(SELECT `name` FROM MenuItem WHERE MentorShip.MenuItemID = MenuItem.MenuItemID) AS Skill, 
startDate FROM MentorShip 
ORDER BY Mentor, Mentee;

-- 4
CREATE VIEW Customer_Sales_v AS
SELECT CustomersID, custName, SUM(price*quantity) AS totalSpent, orderDate AS YearByYear FROM MenuMI mi
INNER JOIN OrderDetails od ON od.MenuItemID = mi.MenuItemID
INNER JOIN `Order` o ON o.OrderID = od.OrderID
INNER JOIN Customers c ON c.CustomersID = o.CustomerID
WHERE mi.MenuID = od.MenuID
GROUP BY o.CustomerID
ORDER BY YearByYear DESC;

-- 5
CREATE VIEW Customer_Value_v AS
SELECT CustomersID, custName, SUM(price*quantity) AS total$Amount FROM MenuMI mi
INNER JOIN OrderDetails od ON od.MenuItemID = mi.MenuItemID
INNER JOIN `Order` o ON o.OrderID = od.OrderID
INNER JOIN Customers c ON c.CustomersID = o.CustomerID
WHERE mi.MenuID = od.MenuID AND o.orderDate BETWEEN '2018-05-01' AND '2019-05-01'
GROUP BY o.CustomerID
ORDER BY total$Amount DESC;