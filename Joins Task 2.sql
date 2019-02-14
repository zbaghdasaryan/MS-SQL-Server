CREATE DATABASE ShopDB 
GO
USE ShopDB
GO

CREATE TABLE JoinTest1
(id_jt1 int,
 name varchar(50));
GO

CREATE TABLE JoinTest2
(id_jt2 int,
 name varchar(50));
GO

INSERT JoinTest1
VALUES  (1,'one'),
		(2,'two'),
		(3,'three'),
		(4,'four'),
		(5,'five'),
		(9,'nine'),
		(10,'ten');

INSERT JoinTest2
VALUES  (1,'one'),
		(2,'two'),
		(3,'three'),
		(4,'four'),
		(5,'five'),
		(6,'six'),
		(7,'seven'),
		(8,'eight');
select * from JoinTest1;
select * from JoinTest2;



-------------------------------------------------------------------------
--                            INNER JOIN  
-------------------------------------------------------------------------

-- INNER JOIN (���������� �����������) - �����������, ��� ������� 
--   � ������� ��� ������ �� ������� �� ����� � ������ ������� �������� 
--   INNER JOIN ����������� � �������������� ����� �������, ��� ������������ 
--   ������� �������� � ��������� �����.

-- ���������� ������� ���� ������ �� ����������� ������ JoinTest1 � JoinTest2 
-- �� ��������� ����� id_jt1 � id_jt2.

SELECT * FROM 
			  JoinTest2	  -- ����� ������� (������� JoinTest2)
			  INNER JOIN  -- �������� �����������.
			  JoinTest1	  -- ������ �������(������� JoinTest1)
ON id_jt1 = id_jt2;		  -- ������� ����������� ��� ������� �������� � ������������ ������� ������ ���������. 
GO

-------------------------------------------------------------------------
--                LEFT OUTER JOIN, RIGHT OUTER JOIN  
-------------------------------------------------------------------------

-- LEFT OUTER JOIN (����� ������� �����������) - ������� �����������, ��� ������� 
--   � ������� ��� ������ �� ������� �� ����� ������� �������� LEFT JOIN � 
--   ���������� SQL ����������� � �������������� ����� �������, ���� ���� � 
--   ������� �� ������ ������� ����������� ����������� �������� � ��������� �����.

-- ���������� ������� ���� ������ �� ��������������� ������ ������  ������ �������� 
-- ����������� ������ JoinTest1 � JoinTest2 �� ��������� ����� id_jt1 � id_jt2.

SELECT * FROM JoinTest2	 -- ����� ������� JoinTest2
    LEFT OUTER JOIN JoinTest1	 -- LEFT JOIN
ON id_jt1=id_jt2;
GO


-- RIGHT OUTER JOIN (������ ������� �����������) - ������� �����������, ��� ������� 
--   � ������� ��� ������ �� ������� �� ������ ������� �������� RIGHT JOIN � 
--   ���������� SQL ����������� � �������������� ����� �������, ���� ���� � 
--   ������� �� ����� ������� ����������� ����������� �������� � ��������� �����.

-- ���������� ������� ���� ������ �� ��������������� ������ ������ ������� �������� 
-- ����������� ������ JoinTest1 � JoinTest2 �� ��������� ����� id_jt1 � id_jt2.

SELECT * FROM JoinTest2	
   RIGHT OUTER JOIN JoinTest1 -- ������ ������� JoinTest2
ON id_jt1 = id_jt2;
GO


-------------------------------------------------------------------------
--                       FULL OUTER JOIN 
-------------------------------------------------------------------------

-- FULL OUTER JOIN (������ ����������) ������� �����������, ��� ������� 
--   � ������� ��� ������ �� ������� �� ����� � ������ ������� �������� 
--   FULL JOIN ����������� � �������������� ����� �������, ��� ����������� 
--   ������� �������� � ��������� �����,� ��� ��:
--		- �������� �� ������� �������, �� ������� ������������ � ����� �������;
--		- �������� �� ����� �������, �� ������� ������������ � ������ �������. 

SELECT * 
FROM JoinTest2
FULL OUTER JOIN JoinTest1	 --FULL JOIN
ON id_jt1 = id_jt2;
GO


-------------------------------------------------------------------------
--                           CROSS JOIN 
-------------------------------------------------------------------------

-- CROSS JOIN (������������ ����������) - ��������� ��������� ������������ ������, 
-- ����������� � �����������. � CROSS JOIN �� ������������ ���������� ON.

-- ���������� ������� ���� ������ �� ��������������� ������ ������ ������������� 
-- ����������� ������ JoinTest1 � JoinTest2.

SELECT * FROM JoinTest1
   CROSS JOIN JoinTest2 -- CROSS JOIN
-- ON - �� ������������ 
GO

-------------------------------------------------------------------------
--                            UNION 
-------------------------------------------------------------------------

-- UNION ���������� ���������� ���� �������� SELECT � ������ �������������� �������.

-- ���� ���������� ����� �������� �������� ������ � ������������ ���������� �����,
-- ��, �������� UNION �������� � �������������� ������� ������ ���� ����� ������.

-- ���� � ���������� ������ �� �������� ������� ������ � ����������� ����������,
-- �� ������������ �� � ����� �� ����� ���������� ������� �������, �� ��� ������ 
-- ���-�� ���������� � �������������� �������.

-- �������� UNION ������� ������������� ����� ��������, ������ �� ������� ���������� 
-- ������� � ��������� �������������, ��� ����, ���� � ���������� �������� ������ ���������.

SELECT * FROM JoinTest1 
UNION 
SELECT * FROM JoinTest2 


-------------------------------------------------------------------------
--                            UNION ALL
-------------------------------------------------------------------------

-- UNION ALL ���������� ���������� ���� �������� SELECT � ������ �������������� �������.

-- ���� ���������� ����� �������� �������� ������ � ������������ ���������� �����,
-- ��, �������� UNION ALL �������� � �������������� ������� ��� ������������� ������.

-- ���� � ���������� ������ �� �������� ������� ������ � ����������� ����������,
-- �� ������������ �� � ����� �� ����� ���������� ������� �������, �� ��� ������ 
-- ���-�� ���������� � �������������� �������.

-- �������� UNION ALL ������� ������������� ����� ��������, ������ �� ������� ���������� 
-- ������� � ��������� �������������, ��� ����, ���� � ���������� �������� ������ ���������.

SELECT * FROM JoinTest1 
UNION ALL
SELECT * FROM JoinTest2 

-------------------------------------------------------------------------
--                            EXCEPT
-------------------------------------------------------------------------

-- �������� EXCEPT ��������� ���������� ������� �������. 

-- ���� ��������� ������ ������� �������� EXCEPT �������� ���������� ������, �� ����������� 
-- �� � ����� �� ����� ������� �������, ��, ������ ����� ������ ���������� � �������������� �������. 
-- ���������� ������ ������� ������� �������� EXCEPT, ������� �� ������ � �������������� �������.

-- ���� ���������� ����� �������� �������� ����������� ������, ��, �������� EXCEPT ���������� ��.

-- �������� EXCEPT ������� ������������� ����� ��������, ������ �� ������� ���������� 
-- ������� � ��������� �������������, ��� ����, ���� � ���������� �������� ������ ���������.

SELECT * FROM JoinTest1 
EXCEPT
SELECT * FROM JoinTest2 

SELECT * FROM JoinTest2 
EXCEPT 
SELECT * FROM JoinTest1 

-------------------------------------------------------------------------
--                             INTERSECT 
-------------------------------------------------------------------------

-- INTERSECT ���������� ���������� ���� �������� SELECT � ������ �������������� �������.

-- ���� ���������� ����� �������� �������� ������ � ������������ ���������� �����,
-- ��, �������� INTERSECT �������� � �������������� ������� ������ ���� ����� ������.

-- ���� � ���������� ������ �� �������� ������� ���������� ������, 
-- �� ����������� �� � ����� �� ����� ���������� ������� �������, 
-- �� ����� ������ ������������ ��������� INTERSECT.

-- �������� INTERSECT ������� ������������� ����� ��������, ������ �� ������� ���������� 
-- ������� � ��������� �������������, ��� ����, ���� � ���������� �������� ������ ���������.

SELECT * FROM JoinTest1 
INTERSECT
SELECT * FROM JoinTest2 


CREATE TABLE Employees
	(
		EmployeeID int NOT NULL,
		FName nvarchar(15) NOT NULL,
		LName nvarchar(15) NOT NULL,
		MName nvarchar(15) NOT NULL,
		Salary money NOT NULL,
		PriorSalary money NOT NULL,
		HireDate date NOT NULL,
		TerminationDate date NULL,
		ManagerEmpID int NULL
	)  
GO

ALTER TABLE Employees ADD 
	CONSTRAINT PK_Employees PRIMARY KEY(EmployeeID) 
GO

ALTER TABLE Employees ADD CONSTRAINT
	FK_Employees_Employees FOREIGN KEY(ManagerEmpID) 
	REFERENCES Employees(EmployeeID)  
GO

CREATE TABLE Customers
	(
	CustomerNo int NOT NULL IDENTITY,
	FName nvarchar(15) NOT NULL,
	LName nvarchar(15) NOT NULL,
	MName nvarchar(15) NULL,
	Address1 nvarchar(50) NOT NULL,
	Address2 nvarchar(50) NULL,
	City nchar(10) NOT NULL,
	Phone char(12) NOT NULL,
	DateInSystem date NULL
	)  
GO

ALTER TABLE Customers ADD 
	CONSTRAINT PK_Customers PRIMARY KEY(CustomerNo) 
GO


CREATE TABLE Orders
	(
	OrderID int NOT NULL IDENTITY,
	CustomerNo int NULL,
	OrderDate date NOT NULL,
	EmployeeID int NULL
	)  
GO

ALTER TABLE Orders ADD 
	CONSTRAINT PK_Orders PRIMARY KEY (OrderID) 

GO

ALTER TABLE Orders ADD CONSTRAINT
	FK_Orders_Customers FOREIGN KEY(CustomerNo) 
	REFERENCES Customers(CustomerNo) 
		ON UPDATE  CASCADE 
		ON DELETE  SET NULL 
	
GO

ALTER TABLE Orders ADD CONSTRAINT
	FK_Orders_Employees FOREIGN KEY(EmployeeID) 
	REFERENCES Employees(EmployeeID)
		ON UPDATE  CASCADE 
		ON DELETE  SET NULL 
GO

---
CREATE TABLE Products
	(
	ProdID int NOT NULL IDENTITY,
	Description nchar(50) NOT NULL,
	UnitPrice money NULL,
	Weight numeric(18, 0) NULL
	)
GO

ALTER TABLE Products ADD CONSTRAINT
	PK_Products PRIMARY KEY (ProdID)
GO

CREATE TABLE OrderDetails
	(
	OrderID int NOT NULL,
	LineItem int NOT NULL,
	ProdID int NULL,
	Qty int NOT NULL,
	UnitPrice money NOT NULL,
	TotalPrice as Qty*UnitPrice
	)  
GO

ALTER TABLE OrderDetails ADD CONSTRAINT
	PK_OrderDetails PRIMARY KEY
	(
	OrderID,
	LineItem
	) 
GO

ALTER TABLE OrderDetails ADD CONSTRAINT
	FK_OrderDetails_Products FOREIGN KEY(ProdID) 
		REFERENCES Products(ProdID) 
		ON UPDATE  NO ACTION 
		ON DELETE  SET NULL 	
GO

ALTER TABLE OrderDetails ADD CONSTRAINT
	FK_OrderDetails_Orders FOREIGN KEY(OrderID) 
	REFERENCES Orders(OrderID) 
	 ON UPDATE  CASCADE 
	 ON DELETE  CASCADE
GO
 
INSERT Employees
(EmployeeID, FName, MName, LName, Salary, PriorSalary, HireDate, TerminationDate, ManagerEmpID)
VALUES
(1,'�������', '��������', '�������', 5000, 800, '11/20/2009', NULL, NULL),
(2,'����', '��������', '��������', 2000, 0, '11/20/2009', NULL, 1),
(3,'����', '�����������', '�������', 1000, 0, '11/20/2009', NULL, 2),
(4,'��������', '��������', '���������', 800, 0, '11/20/2009', NULL, 2);
GO

INSERT Customers 
(LName, FName, MName, Address1, Address2, City, Phone,DateInSystem)
VALUES
('����������','��������','��������','������ 15',NULL,'�������','(092)3212211','11/20/2009'),
('������','������','����������','��������� 10',NULL,'����','(067)4242132','08/03/2010'),
('������','�������','���������','������������ 5',NULL,'����','(092)7612343','08/17/2010'),
('��������','�������','����������','�������� 5','�������� 12','����','(053)3456788','08/20/2010'),
('��������','����','�����������','�������� 3','�������� 8','��������','(044)2134212','09/18/2010');
GO

INSERT Products
( Description, UnitPrice, Weight )
VALUES
('LV231 ������',45,0.9),
('GC111 ��������',20,0.3),
('GC203 ������',48,0.7),
('DG30 ������',30,0.5),
('LV12 �����',26,1),
('GC11 �����',32,0.35)
GO

INSERT Orders
(CustomerNo, OrderDate, EmployeeID)
VALUES
(1,'12/28/2009',2),
(3,'09/01/2010',4),
(5,'09/18/2010',4)
GO

INSERT OrderDetails
(OrderID, LineItem, ProdID, Qty, UnitPrice)
VALUES
(1,1,1,5,45),
(1,2,4,5,29),
(1,3,5,5,25),
(2,1,6,10,32),
(2,2,2,15,20),
(3,1,5,20,26),
(3,2,6,18,32)
GO

SELECT * FROM Employees;
SELECT * FROM OrderDetails;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM Customers;


-- �������� ���������� �� ���������� �������� ������ ������.
SELECT Products.ProdID, [Description], SUM(Qty) AS Qty, SUM(TotalPrice) AS TotalSold -- ������ ���.
   	  FROM Products
INNER JOIN OrderDetails
      ON Products.ProdID = OrderDetails.ProdID
	  GROUP BY Products.ProdID, [Description]


-- ���� � ������������ ��������, ������� ������� � ����������� �������, 
-- �� ����� ���� ������� � ����� ������� ��������� ������ �������.
SELECT Products.ProdID, [Description], Qty, TotalPrice FROM Products  -- ������!
			   JOIN OrderDetails
			   ON Products.ProdID = OrderDetails.ProdID
	  
	  
-- ������� ����� ���� ������ �� ����������.
SELECT FName, LName, MName, SUM(TotalPrice) AS [Total Sold] FROM Employees -- ����� [Total Sold]
	     JOIN Orders
			ON Employees.EmployeeID	= Orders.EmployeeID
	     JOIN OrderDetails
			ON Orders.OrderID = OrderDetails.OrderID
GROUP BY  Employees.FName,
		  Employees.LName,  
		  Employees.MName

-- ������� ����� ���� ������ �� ������� �� ����������
		  
SELECT FName, LName, MName, SUM(TotalPrice) AS [Total Sold] FROM Employees -- ����� [Total Sold]
	     LEFT JOIN Orders
			ON Employees.EmployeeID	= Orders.EmployeeID
	     LEFT JOIN OrderDetails
			ON Orders.OrderID = OrderDetails.OrderID
GROUP BY  Employees.FName,
		  Employees.LName,  
		  Employees.MName
	   
-- ������� ���� ���������� ����������� (��� ���� �����������)
SELECT Emp1.FName, Emp1.MName, Emp1.LName, Emp2.FName, Emp2.MName, Emp2.LName  
       FROM Employees	Emp1 -- ����� Emp1
		 JOIN Employees	Emp2 -- ����� Emp2
		 ON Emp1.EmployeeID = Emp2.ManagerEmpID	  