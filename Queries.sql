-- 1
SELECT custName, custEmail AS ContactInfo, customerType FROM Customers;

-- 2
SELECT CustomersID, custName, o.OrderID, SUM(price*quantity) AS orderAmount FROM MenuMI mi
INNER JOIN OrderDetails od ON od.MenuItemID = mi.MenuItemID
INNER JOIN `Order` o ON o.OrderID = od.OrderID
INNER JOIN Customers c ON c.CustomersID = o.CustomerID
WHERE mi.MenuID = od.MenuID
GROUP BY o.OrderID;

-- 3
SELECT CustomersID, custName, SUM(price*quantity) AS totalSpent FROM MenuMI mi
INNER JOIN OrderDetails od ON od.MenuItemID = mi.MenuItemID
INNER JOIN `Order` o ON o.OrderID = od.OrderID
INNER JOIN Customers c ON c.CustomersID = o.CustomerID
WHERE mi.MenuID = od.MenuID AND o.orderDate BETWEEN '2017-05-01' AND '2019-05-01'
GROUP BY o.CustomerID
ORDER BY totalSpent DESC LIMIT 3;

-- 4
SELECT name, COUNT(menuItemSet) AS NumberOfMenuItems, GROUP_CONCAT(menuItemSet) AS menuItems FROM MenuItemSet
INNER JOIN Employee USING(EmployeeID) 
GROUP BY name
HAVING COUNT(menuItemSet) >= 3;

-- 5
SELECT emplo1.name AS SousChef1, emplo2.name AS SousChef2, COUNT(sousA.menuItemSet) AS NumberOfMenuItems FROM
(SELECT * FROM MenuItemSet WHERE EmployeeID IN
(SELECT EmployeeID FROM MenuItemSet GROUP BY EmployeeID HAVING COUNT(menuItemSet) >=3))
sousA INNER JOIN
(SELECT * FROM MenuItemSet WHERE EmployeeID IN
(SELECT EmployeeID FROM MenuItemSet GROUP BY EmployeeID HAVING COUNT(menuItemSet) >=3))
sousB ON sousA.EmployeeID != sousB.EmployeeID AND sousA.menuItemSet = sousB.menuItemSet
INNER JOIN Employee emplo1 ON emplo1.EmployeeID = sousA.EmployeeID
INNER JOIN Employee emplo2 ON emplo2.EmployeeID = sousB.EmployeeID
WHERE emplo1.name > emplo2.name
GROUP BY sousA.EmployeeID, sousB.EmployeeID
HAVING NumberOfMenuItems >=3

-- 6
SELECT (SELECT `name` FROM MenuItem WHERE MenuItem.MenuItemID = OrderDetails.MenuItemID) AS MenuItem, 
SUM(quantity) AS itemAmount FROM OrderDetails 
WHERE MenuID = 4
GROUP BY MenuItemID
ORDER BY itemAmount DESC LIMIT 3;

-- 7


-- 8
SELECT CustomersID, custName, MimingsMoney FROM Customers
ORDER BY MimingsMoney DESC;

-- 9
SELECT CustomersID, custName, SUM(price*quantity) AS totalSpent FROM MenuMI mi
INNER JOIN OrderDetails od ON od.MenuItemID = mi.MenuItemID
INNER JOIN `Order` o ON o.OrderID = od.OrderID
INNER JOIN Customers c ON c.CustomersID = o.CustomerID
WHERE mi.MenuID = od.MenuID
GROUP BY o.CustomerID
ORDER BY totalSpent DESC;

-- 10


-- 11
SELECT CustomersID, custName, SUM(price*quantity) AS orderAmount FROM MenuMI mi
INNER JOIN OrderDetails od ON od.MenuItemID = mi.MenuItemID
INNER JOIN `Order` o ON o.OrderID = od.OrderID
INNER JOIN Customers c ON c.CustomersID = o.CustomerID
WHERE mi.MenuID = od.MenuID AND o.orderDate BETWEEN '2018-05-01' AND '2019-05-01'
GROUP BY o.CustomerID
ORDER BY orderAmount DESC LIMIT 3;

-- 12
SELECT name AS miName, SUM(price*quantity) AS orderAmount FROM MenuItem mi
INNER JOIN MenuMI mmi ON mmi.MenuItemID = mi.MenuItemID
INNER JOIN OrderDetails od ON od.MenuItemID = mi.MenuItemID
INNER JOIN `Order` o ON o.OrderID = od.OrderID
WHERE mmi.MenuID = od.MenuID AND o.orderDate BETWEEN '2018-05-01' AND '2019-05-01'
GROUP by miName 
ORDER BY orderAmount DESC LIMIT 5;

-- 13
SELECT e1.EmployeeID, e1.name AS Mentor, e2.EmployeeID, e2.name AS Mentee, mi.name AS MenuItemName FROM MentorShip ment
INNER JOIN MenuItem mi ON ment.MenuItemID = mi.MenuItemID
INNER JOIN Employee e1 ON e1.EmployeeID = MentorID
INNER JOIN Employee e2 ON e2.EmployeeID = MenteeID
WHERE MentorID IN
(SELECT MentorID FROM MentorShip GROUP BY MentorID HAVING COUNT(MenuItemID) =
(SELECT MAX(NumberOfMenuItems) FROM
(SELECT MentorID, COUNT(MenuItemID) AS NumberOfMenuItems FROM MentorShip GROUP BY MentorID) e1));


-- 14
SELECT menuItemSet, COUNT(EmployeeID) AS SousChefCount FROM MenuItemSet
GROUP BY menuItemSet
ORDER BY SousChefCount ASC LIMIT 3;


-- 15
SELECT custName , corpName FROM Customers
INNER JOIN Corporation
WHERE Customers.CustomersID = Corporation.CustomerID;


-- 16
SELECT m.menuType, mi.name, size, price FROM MenuMI menMI
INNER JOIN MenuItem mi ON mi.MenuItemID = menMI.MenuItemID
INNER JOIN Menu m ON m.MenuID = menMI.MenuID;


-- 17 EC


-- 18a There can be no more than 3 "Oh My God" spicy level foods on one order.
SELECT od.OrderID AS OrderIDNum, SUM(od.quantity) AS Quantity, sp.spiceAbbr AS SpiceLevel FROM Spices sp
INNER JOIN MenuItem mi ON mi.spiceAbbr = sp.spiceAbbr
INNER JOIN MenuMI mmi ON mmi.MenuItemID = mi.MenuItemID
INNER JOIN OrderDetails od ON od.MenuItemID = mi.MenuItemID
INNER JOIN `Order` o ON o.OrderID = od.OrderID
WHERE sp.spiceAbbr = "OMG" AND mmi.MenuID = od.MenuID
GROUP BY OrderIDNum
ORDER BY Quantity DESC;

-- 18b When a corporation places an order, there will be a 10% fee added onto the grand total of the bill.
SELECT corpName, o.OrderID, SUM(ROUND(((quantity*price)+(quantity*price*0.10)),2)) AS TotalPlusCorpFee FROM Corporation corp 
INNER JOIN Customers c ON c.CustomersID = corp.CustomerID
INNER JOIN `Order` o ON o.CustomerID = c.CustomersID
INNER JOIN OrderDetails od ON od.OrderID = o.OrderID
INNER JOIN MenuMI mmi ON mmi.MenuItemID = od.MenuItemID
WHERE corp.CustomerID = c.CustomersID and quantity*price != 0 AND mmi.MenuID = od.MenuID
GROUP BY o.OrderID
ORDER BY corpName;

-- 18c



