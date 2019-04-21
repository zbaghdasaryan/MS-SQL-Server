/****************************************************************************
************************   T R A N S A C T - S Q L   ************************
************************ P R A C T I C A L   W O R K ************************
*****************************************************************************
*****  Lesson II  ******           TRIGGER           ************************
****************************************************************************/

USE InternetShopDB
GO

--1. ��������
--1) �������� �������, ������� �������� ������� ������ �� ������ ��� ���������� ������ � �����. 
CREATE TRIGGER trMatchingStocksOnInsert
ON OrderDetails
FOR INSERT
AS
    -- ������� ����������� ��� ���������� �������� ������� ������ � �������, ��� ���� ���-��
	-- ����������� ����� ����� ��������� ������ ����. ��������:
	-- INSERT INTO OrderDetails 
	-- SELECT * FROM SomeEmptyTable;
	IF @@ROWCOUNT = 0
		RETURN
    
	-- ��������� ����� ��������� � ���-�� ������������ �������, ��� ������������ ������ �� ������������������
	SET NOCOUNT ON

	UPDATE Stocks 
    SET Qty = s.Qty - i.Qty
	FROM Stocks s JOIN 
		-- inserted i - ����� ������ �� �����.
		-- ���������� ����������� ���-�� �� ���������, ����� ��� ���������� ���������� ���������
		-- � ������ (�.�. ��� ������� ���������� ������� ������ � ���� �� �������� � �������
		-- inserted) ��������� ���������� ������ �� ������ ��������� ������.
		(SELECT ProductID, SUM(Qty) Qty FROM inserted GROUP BY ProductID) i -- ��� ���������
		ON s.ProductID = i.ProductID;
GO

--2) �������� �������, ������� �������� ������� ������ �� ������ ��� �������� ������ �� ������.
CREATE TRIGGER trMatchingStocksOnDelete
ON OrderDetails
FOR DELETE
AS
	IF @@ROWCOUNT = 0
		RETURN

	SET NOCOUNT ON

	UPDATE Stocks 
    SET Qty = s.Qty + d.Qty
	FROM Stocks s JOIN 
		(SELECT ProductID, SUM(Qty) Qty FROM deleted GROUP BY ProductID) d
		ON s.ProductID = d.ProductID;
GO
	
--3) �������� �������, ������� ������� ������� ������ �� ������ ��� ��������� ���������� ������ � ������.
CREATE TRIGGER trMatchingStocksOnUpdate
ON OrderDetails
FOR UPDATE
AS
	IF @@ROWCOUNT = 0
		RETURN

	IF NOT UPDATE(Qty)
		RETURN

	SET NOCOUNT ON

	UPDATE Stocks 
    SET Qty = s.Qty - (i.Qty - d.Qty)
	FROM Stocks s JOIN 
		(SELECT ProductID, SUM(Qty) Qty FROM deleted GROUP BY ProductID) d
		ON s.ProductID = d.ProductID
		JOIN 
		(SELECT ProductID, SUM(Qty) Qty FROM inserted GROUP BY ProductID) i
		ON s.ProductID = i.ProductID;
GO			

--4) ����������������� ������ ���������.
--   �������� ��� ������, ���������� �� ��� ������ �������� (��� �������� � ����� ������, ����� �� ��� - � ������).
--   �������� ���-�� ������ �� ��������� � ����� �������.
--   ������� ��������� ����� ��� ������.

-- ������� �� �������/���������/�������� (����� ������ �������� 8, 9, 10)
SELECT * FROM Stocks WHERE ProductID IN (8, 9, 10)

INSERT Orders
VALUES
(2, null, GETDATE()),
(3, null, GETDATE())
GO

INSERT OrderDetails
VALUES
(25, 1, 8, 4, 301),
(25, 2, 9, 1, 250),
(25, 3, 10, 1, 250),
(26, 1, 8, 10, 250),
(26, 2, 9, 2, 250),
(26, 3, 10, 1, 250)
GO
-- ������� ����� ���������� ��������� � �����
SELECT * FROM Stocks WHERE ProductID IN (8, 9, 10)

UPDATE OrderDetails
SET Qty = 5
WHERE OrderID IN (25, 26) AND ProductID = 8
GO
-- ������� ����� ��������� ���������� � �������
SELECT * FROM Stocks WHERE ProductID IN (8, 9, 10)

-- ������ �� �������� �� �������, �.�. ��������� �� �� ���� Qty
UPDATE OrderDetails
SET Price = 100
WHERE OrderID IN (25, 26) AND ProductID = 8
GO

DELETE Orders
WHERE ID IN (25, 26)
GO
-- ������� ����� �������� �������
SELECT * FROM Stocks WHERE ProductID IN (8, 9, 10)

-- �������� �������. 
-- ������� ��������� ����� �������� � �������� ���� ����� �������, ������������ ���������� ���������.
CREATE TRIGGER trMatchingStocks
ON OrderDetails
FOR INSERT, DELETE, UPDATE
AS
	IF @@ROWCOUNT = 0
		RETURN

	SET NOCOUNT ON
	-- ����������� SELECT 1 ������ SELECT * ��� ���������� ������������������, �.�. ������������ ������
	-- �� ������������; ����� ��� ���� �������� (true ��� false).
	IF EXISTS (SELECT 1 FROM inserted) AND EXISTS (SELECT 1 FROM deleted)
		BEGIN
			IF NOT UPDATE(Qty)
				RETURN

			UPDATE Stocks 
			SET Qty = s.Qty - (i.Qty - d.Qty)
			FROM Stocks s JOIN 
				(SELECT ProductID, SUM(Qty) Qty FROM deleted GROUP BY ProductID) d
				ON s.ProductID = d.ProductID
				JOIN 
				(SELECT ProductID, SUM(Qty) Qty FROM inserted GROUP BY ProductID) i
				ON s.ProductID = i.ProductID
		END
	ELSE IF EXISTS (SELECT 1 FROM inserted) AND NOT EXISTS (SELECT 1 FROM deleted)
		BEGIN
			UPDATE Stocks 
			SET Qty = s.Qty - i.Qty
			FROM Stocks s JOIN 
				(SELECT ProductID, SUM(Qty) Qty FROM inserted GROUP BY ProductID) i
				ON s.ProductID = i.ProductID
		END
	ELSE IF EXISTS (SELECT 1 FROM deleted) AND NOT EXISTS (SELECT 1 FROM inserted)
		BEGIN
			UPDATE Stocks 
			SET Qty = s.Qty + d.Qty
			FROM Stocks s JOIN 
				(SELECT ProductID, SUM(Qty) Qty FROM deleted GROUP BY ProductID) d
				ON s.ProductID = d.ProductID
		END
GO

-- 5) �������� �������, ������� �������� ������� ������� �� ������� ���������, ������ ��� �������, 
--    ��� ��� ��� � ������� � ������� �� ������ �������.
CREATE TRIGGER trAllowDeleteProduct
ON Products
INSTEAD OF DELETE
AS
	IF @@ROWCOUNT = 0
		RETURN

	SET NOCOUNT ON

	IF EXISTS (SELECT 1 FROM OrderDetails od
						JOIN deleted d 
						ON od.ProductID = d.ID)
		RAISERROR('����� �� ����� ���� ������ �.�. ����� � �������', 10, 1)

	ELSE IF EXISTS (SELECT 1 FROM Stocks s
						JOIN deleted d
						ON s.ProductID = d.ID
						WHERE s.Qty <> 0)
		RAISERROR('����� �� ����� ���� ������ �.�. ���� ������� �� ������', 10, 2)

	ELSE
		DELETE Products WHERE ID IN (SELECT ID FROM deleted)
GO

-- 6) 
INSERT Products
VALUES
('������� Apple iPad A1566'),
('������� Microsoft Surface RT')
GO

INSERT Stocks
VALUES
(11, 2),
(12, 0)
GO

DELETE FROM Products
WHERE ID = 1

DELETE FROM Products
WHERE ID = 11

DELETE FROM Products
WHERE ID = 12

SELECT * FROM Products

--1. ������� �������.
--1) ������� ��� ������, ������� ���� ������� �� ��������� ��� ������.
-- ������� 1
SELECT * FROM Orders
WHERE  OrderDate >= DATEADD(MONTH, -2, GETDATE()) 
-- ������� 2
SELECT * FROM Orders 
WHERE  OrderDate BETWEEN DATEADD(MONTH, -2, GETDATE()) AND GETDATE()
-- ������� 3
SELECT * FROM Orders
WHERE  DATEDIFF(DAY, OrderDate, GETDATE()) <= 60

--2) ������� ��� ������, ������� ���� � InternetShopDB ��� ������ "Dell".
SELECT * FROM Products
WHERE Name LIKE '%Dell%'

--3) ������� ������ ���� ��������� � ��������.
SELECT * FROM Products 
WHERE Name LIKE '�������%' OR Name LIKE '������%'

--4) ������� ���� �����������, � ������� ������ ������ ��� 10% �� �/�.
SELECT * FROM Employees
WHERE Salary/10 < PriorSalary

--5) ������� ������ �������� ������� ��������� � ������ ����� ��� ������.
SELECT FName +' '+ MName +' '+ LName  AS Customer, City FROM Customers
WHERE City IN ('����','�����')

--6) ������� �������� ��������� � �������� ����������.
SELECT DISTINCT Post FROM Employees