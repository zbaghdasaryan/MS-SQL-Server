/****************************************************************************
************************   T R A N S A C T - S Q L   ************************
************************ P R A C T I C A L   W O R K ************************
*****************************************************************************
*****  Lesson III  *****            QUERY            ************************
****************************************************************************/

USE InternetShopDB
GO

--1. ������� � JOIN.
--1) ������� ���� �����������, � ������� ���� �������� � �������.
SELECT e.FName +' '+ e.MName +' '+ e.LName AS Employee, 
DATENAME(m, BirthDate) AS [Month]
FROM Employees e 
INNER JOIN EmployeesInfo ei
ON e.ID = ei.ID -- AND MONTH(BirthDate) = 8 -- correct
WHERE MONTH(BirthDate) = 8                  -- correct too
--WHERE DATEPART(m, ei.BirthDate) = 8       -- correct too

--2) ������� ���������� � ������� (������, ���� ������, �����, ��������, ����)
--   ��� ��������, ������� ������� ����� ��� ������ ������������.
SELECT c.FName +' '+ c.MName +' '+c.LName  AS Customer, 
o.EmployeeID Employee, OrderDate, p.Name, pd.[Description], od.Price
FROM Customers c INNER JOIN Orders o
ON c.ID = o.CustomerID -- AND o.EmployeeID is NULL -- correct
INNER JOIN OrderDetails od
ON o.ID = od.OrderID
INNER JOIN Products p
ON od.ProductID = p.ID
INNER JOIN ProductDetails pd
ON p.ID = pd.ID
WHERE o.EmployeeID is NULL;                        -- correct too

--3) ������� � ��������������� ������� ����������, ��� �� �����������, ����� �������� 
--   ���������� � ���� ������.
SELECT e.FName +' '+ e.MName +' '+ e.LName AS Employees, OrderDate, 
c.FName+' '+c.MName+' '+c.LName AS Customers
FROM Employees e
INNER JOIN Orders o
ON e.ID = o.EmployeeID
INNER JOIN Customers c
ON o.CustomerID = c.ID
ORDER BY OrderDate

--4) ������� ������� �� ��������� ��� ������ (���� ������, ������, �����, ��������, 
--   ����������, �����) � ��������������� �������.
SELECT OrderDate, c.FName +' '+ c.MName +' '+  c.LName AS Customers, 
p.Name, pd.[Description], od.Qty, od.TotalPrice
FROM Customers c 
INNER JOIN Orders o
ON c.ID = o.CustomerID -- AND OrderDate BETWEEN  DATEADD(month, -2, GETDATE()) AND GETDATE() -- correct
INNER JOIN OrderDetails od
ON o.ID = od.OrderID
INNER JOIN Products p
ON od.ProductID = p.ID
INNER JOIN ProductDetails pd
ON p.ID = pd.ID 
WHERE OrderDate BETWEEN  DATEADD(month, -2, GETDATE()) AND GETDATE()                         -- correct too
ORDER BY OrderDate;

--5) ������� ��������, ������� �������� �������� ��� ������� �� ��������� �����, ���� ������� ���� ������ 400$. 
SELECT c.FName +' '+ c.MName +' '+ c.LName AS Customers, OrderDate, Name, Price
FROM Customers c
INNER JOIN Orders o                                                    
ON c.ID = o.CustomerID --AND o.OrderDate >=  DATEADD(m, -1, GETDATE()) -- correct too
INNER JOIN OrderDetails od 
ON o.ID = od.OrderID --AND Price > 400                                 -- correct to�
INNER JOIN Products p
ON od.ProductID = p.ID
WHERE (Name LIKE '�������%' OR Name LIKE '������%')                      
AND o.OrderDate >=  DATEADD(m, -1, GETDATE()) AND Price > 400          -- correct

--6) ������� ���������� � �������� ���������� (���� ������, �������, ��������, ����), 
--   � ������ �� �������� iPhone 6.
SELECT OrderDate, Name, [Description], Price, Qty
FROM Orders o
INNER JOIN OrderDetails od
ON o.ID = od.OrderID
INNER JOIN Products p
ON p.ID = od.ProductID
INNER JOIN ProductDetails pd
ON p.ID = pd.ID
WHERE Name LIKE '��������%' AND NOT Name LIKE '%iPhone 6%'

--2. ������� � JOIN � ����������� ���������.
--1) ������� ���������� ������ (����� �����) �� ������� �� ����������� �� ���� ������
SELECT e.FName+' '+e.MName+' '+ e.LName AS Employees, Post, SUM(TotalPrice) as Total
FROM Employees e
LEFT JOIN Orders o
ON e.ID = o.EmployeeID
LEFT JOIN OrderDetails od 
ON o.ID = od.OrderID
GROUP BY e.FName, e.MName, e.LName, Post

--2) ������� ���������� ������ (����� �����) �� ������� �� ����������� �� ��������� �����.
SELECT e.FName+' '+e.MName+' '+ e.LName AS Employees, Post, SUM(TotalPrice) as Total
FROM Employees e
LEFT JOIN Orders o                                                      
ON e.ID = o.EmployeeID AND DATEDIFF(d, OrderDate, GETDATE()) <= 30     -- correct
LEFT JOIN OrderDetails od 
ON o.ID = od.OrderID
--WHERE DATEDIFF(d, OrderDate, GETDATE()) <= 30                        -- wrong
--WHERE OrderDate IS NULL OR DATEDIFF(d, OrderDate, GETDATE()) <= 30   -- wrong too
GROUP BY e.FName, e.MName, e.LName, Post

--3) ������� ���������� ������ �� ������� (����� ���������� � ����� ������, ���, ���� � ������� ����) � ������� �������� �� �����.
                                                                                 
SELECT Name, SUM(Qty) as Qty, 
SUM(TotalPrice) as Total, 
MIN(od.Price) MIN_Price, 
MAX(od.Price) MAX_Price, 
AVG(od.Price) FalseAVG_Price,          -- �� ���������� �������         
SUM(TotalPrice)/SUM(Qty) TrueAVG_Price -- ���������� �������
FROM Products p 
LEFT JOIN OrderDetails od
ON od.ProductID = p.ID
GROUP BY Name
ORDER BY Total DESC

--4) ������� ���������� ������ �� ������� (����� �����, ������� ����� � ���������� �������).
SELECT stable.City, SUM(stable.TotalSold) TotalSold, AVG(stable.TotalSold) AVG_TotalSold, COUNT(stable.ID) [Count] FROM
(SELECT o.ID, c.City, SUM(od.TotalPrice) TotalSold
FROM Customers c
LEFT JOIN Orders o
ON c.ID = o.CustomerID
LEFT JOIN OrderDetails od
ON o.ID = od.OrderID
GROUP BY o.ID, c.City) stable
GROUP BY stable.City
