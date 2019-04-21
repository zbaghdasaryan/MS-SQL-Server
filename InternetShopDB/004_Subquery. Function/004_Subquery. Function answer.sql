/****************************************************************************
************************   T R A N S A C T - S Q L   ************************
************************ P R A C T I C A L   W O R K ************************
*****************************************************************************
*****  Lesson IV  ******      SUBQUERY. FUNCTION     ************************
****************************************************************************/

USE InternetShopDB
GO
   
-- 1) ������� ����� �����������, � ������� ���� 4 � ����� ������� �� ��� ����� (��������� ���������).
SELECT e.FName +' '+ e.LName Employee, COUNT(o.ID) [Count]
FROM Employees e 
	JOIN Orders o
	ON e.ID = o.EmployeeID
GROUP BY e.FName, e.LName
HAVING 4 <= COUNT(o.ID)

SELECT e.FName +' '+ e.LName Employee, (SELECT COUNT(o.ID) FROM Orders o WHERE o.EmployeeID = e.ID) [Count]
FROM Employees e
WHERE  4 <= (SELECT COUNT(o.ID) FROM Orders o WHERE o.EmployeeID = e.ID)

--2) ������� ������ �����������, � ������� ������� ����� ������ ������ ��� ������� �������� �� ���� �������. 
--!!!!!!!!!!!!!!!!!!!!
SELECT * FROM 
	(SELECT c.ID, 
	c.FName +' '+ c.MName +' '+ c.LName AS Customers, 
	(SELECT AVG(Total) FROM (SELECT SUM(TotalPrice) Total FROM OrderDetails od 
							JOIN Orders o 
							ON od.OrderID = o.ID 
							AND o.CustomerID = c.ID 
							GROUP BY OrderID) inner_table) AS AVGTotalSales,
	(SELECT AVG(Total) FROM (SELECT SUM(TotalPrice) Total FROM OrderDetails 
							GROUP BY OrderID) inner_table) AS AVGTotal_Overall 
	FROM Customers c) cust_sales
WHERE AVGTotalSales > AVGTotal_Overall


--3) ����� ������� ����� ������� �� ��������� ���� �������.
SELECT 
(SELECT SUM(TotalPrice) FROM Orders 
					JOIN OrderDetails 
					ON ID = OrderID
					WHERE OrderDate >=  DATEADD(month, -1, GETDATE())) as [���������],
(SELECT SUM(TotalPrice) FROM Orders 
					JOIN OrderDetails 
					ON ID = OrderID
					WHERE OrderDate BETWEEN DATEADD(month, -2, GETDATE()) 
					AND DATEADD(month, -1, GETDATE())) as [�������������],
(SELECT SUM(TotalPrice) FROM Orders 
					JOIN OrderDetails 
					ON ID = OrderID
					WHERE OrderDate >=  DATEADD(month, -1, GETDATE())) -
(SELECT SUM(TotalPrice) FROM Orders 
					JOIN OrderDetails 
					ON ID = OrderID
					WHERE OrderDate BETWEEN DATEADD(month, -2, GETDATE()) 
					AND DATEADD(month, -1, GETDATE())) as [Dfr_SUMM];

--4) ������� ������� ���������� ����� ������� ��� ��������� �������.
CREATE FUNCTION fnSumTotalPrice(@DateFrom date, @DateTo date)
RETURNS money
AS
BEGIN
	RETURN
	(
		SELECT SUM(TotalPrice) FROM Orders 
						JOIN OrderDetails 
						ON ID = OrderID
						WHERE OrderDate BETWEEN @DateFrom AND @DateTo
	)
END
GO

-- ������
SELECT dbo.fnSumTotalPrice(DATEADD(m, -1, GETDATE()), GETDATE()) as [���������],
dbo.fnSumTotalPrice(DATEADD(m, -2, GETDATE()), DATEADD(m, -1, GETDATE())) as [�������������],
dbo.fnSumTotalPrice(DATEADD(m, -1, GETDATE()), GETDATE()) -
dbo.fnSumTotalPrice(DATEADD(m, -2, GETDATE()), DATEADD(m, -1, GETDATE())) as [Dfr_SUMM];
GO

--5) ����� ������� �� ����� ����� ���������, ������� ������� ����� �������������� � ���������, 
--   ������� ���������������� ������� ������������. 
SELECT
(SELECT SUM (TotalPrice) FROM OrderDetails 
						INNER JOIN Orders ON ID = OrderID
						WHERE EmployeeID IS NULL) as ��������������,
(SELECT SUM (TotalPrice) FROM OrderDetails 
						INNER JOIN Orders ON ID = OrderID
						WHERE EmployeeID IS NOT NULL) as �_�������, 
(SELECT SUM (TotalPrice) FROM OrderDetails 
						INNER JOIN Orders ON ID = OrderID
						WHERE EmployeeID IS NULL) -
(SELECT SUM (TotalPrice) FROM OrderDetails 
						INNER JOIN Orders ON ID = OrderID
						WHERE EmployeeID IS NOT NULL) as �������

/* �����, �����, ����� ����������� �������, ������� ����� ���������� �������� ������� � ��������� ���
   ��������� (@DateFrom, @DateTo). �����, �� ������ ���������� ������� � ������� � ������� ����������� ������.
   ���������� ������ ���������� ����. */

CREATE FUNCTION fnOrdersInfo(@DateFrom date, @DateTo date)
RETURNS table
AS
RETURN
(
	SELECT * FROM Orders 
				JOIN OrderDetails 
				ON ID = OrderID
				WHERE OrderDate BETWEEN @DateFrom AND @DateTo
)
GO

SELECT
(SELECT SUM (TotalPrice) FROM dbo.fnOrdersInfo(DATEADD(YEAR, -1, GETDATE()), GETDATE())
						WHERE EmployeeID IS NULL) as ��������������,
(SELECT SUM (TotalPrice) FROM dbo.fnOrdersInfo(DATEADD(YEAR, -1, GETDATE()), GETDATE())
						WHERE EmployeeID IS NOT NULL) as �_�������,
(SELECT SUM (TotalPrice) FROM dbo.fnOrdersInfo(DATEADD(YEAR, -1, GETDATE()), GETDATE())
						WHERE EmployeeID IS NULL) -
(SELECT SUM (TotalPrice) FROM dbo.fnOrdersInfo(DATEADD(YEAR, -1, GETDATE()), GETDATE())
						WHERE EmployeeID IS NOT NULL) as �������
GO

-- �������������� ������� - ������������� ������������� (��. ���� �5), ��������� �������, 
-- ����������� ���������� ��������� (msdn.microsoft.com/ru-ru/library/ms175972(v=sql.120).aspx).

-- �������������
CREATE VIEW OrdersInfo
AS
SELECT * FROM Orders 
			JOIN OrderDetails 
			ON ID = OrderID
GO

SELECT
(SELECT SUM (TotalPrice) FROM OrdersInfo
						WHERE EmployeeID IS NULL) as ��������������,
(SELECT SUM (TotalPrice) FROM OrdersInfo
						WHERE EmployeeID IS NOT NULL) as �_�������,
(SELECT SUM (TotalPrice) FROM OrdersInfo
						WHERE EmployeeID IS NULL) -
(SELECT SUM (TotalPrice) FROM OrdersInfo
						WHERE EmployeeID IS NOT NULL) as �������
GO

-- ���������� ��������� ���������
WITH OrdInfo
AS
(
SELECT * FROM Orders 
			JOIN OrderDetails 
			ON ID = OrderID
)
SELECT
(SELECT SUM (TotalPrice) FROM OrdInfo
						WHERE EmployeeID IS NULL) as ��������������,
(SELECT SUM (TotalPrice) FROM OrdInfo
						WHERE EmployeeID IS NOT NULL) as �_�������,
(SELECT SUM (TotalPrice) FROM OrdInfo
						WHERE EmployeeID IS NULL) -
(SELECT SUM (TotalPrice) FROM OrdInfo
						WHERE EmployeeID IS NOT NULL) as �������
GO

--6) �������� �������, ������� ����� ���������� ������� ���������� ID ��������, ����� ��������� ���������� ��������,
--   ����� ����� � ������� ����.

CREATE FUNCTION fnProductStatistics()
RETURNS table
AS
RETURN
(
	SELECT ProductID, SUM(Qty) TotalQty, SUM(TotalPrice) TotalPrice, 
	SUM(TotalPrice) / SUM(Qty) AVGPrice
	FROM OrderDetails od1
	GROUP BY ProductID			
)
GO

-- 7) ������� ������ �������� � �� ������� ����, ������� ��������� ������� ��������� ������� ��������� ��������.
--    ������ ���������� �������:
--    ��� ��� ���� �� ���� � ��� �� ������� ����������, ���������� ����� ������� �� ������� ��������, � ����� �� 
--    ���� ������� ��������� ������� �� ������ ������ ��������� (� ������ ������ ��� ������: �������� � �������).

SELECT p.Name, 
(SELECT ps.AVGPrice FROM fnProductStatistics() ps
	WHERE ps.ProductID = p.ID) AVG_������, 
(SELECT AVG(AVGPrice)  FROM dbo.fnProductStatistics() 
	WHERE ProductID IN (SELECT ID FROM  Products WHERE Name LIKE '�������%')) AVG_�������
FROM Products p
WHERE p.Name LIKE '������%' 
AND 
(SELECT ps.AVGPrice FROM fnProductStatistics() ps
		WHERE ps.ProductID = p.ID) > 
(SELECT AVG(AVGPrice) FROM dbo.fnProductStatistics() 
		WHERE ProductID IN (SELECT ID FROM  Products WHERE Name LIKE '�������%'))

--8) ����� ������� ������� ���� ��������� � ��������, �.e. �� ������� � ������� ������� ����� ������, ��� ������.
SELECT 
(SELECT AVG(AVGPrice) FROM dbo.fnProductStatistics() 
		WHERE ProductID IN 
		(SELECT ID FROM  Products WHERE Name LIKE '�������%')) as AVG_�������,
(SELECT AVG(AVGPrice) FROM dbo.fnProductStatistics() 
		WHERE ProductID IN 
		(SELECT ID FROM  Products WHERE Name LIKE '������%')) as AVG_������,
(SELECT AVG(AVGPrice) FROM dbo.fnProductStatistics() 
		WHERE ProductID IN 
		(SELECT ID FROM  Products WHERE Name LIKE '�������%')) -
(SELECT AVG(AVGPrice) FROM dbo.fnProductStatistics() 
		WHERE ProductID IN 
		(SELECT ID FROM  Products WHERE Name LIKE '������%')) as Dif_Price;

--9) ������� �����������, ������������, ������� ���� ������ �� ������� ������, ���������� �������� �� ������
--   � �������������� ������� (��������������, �������, �������������� ��������).

SELECT p.Name, 
(SELECT MIN(od.Price) FROM OrderDetails od WHERE od.ProductID = p.ID) as MINPrice, 
(SELECT MAX(od.Price) FROM OrderDetails od WHERE od.ProductID = p.ID) as MAXPrice, 
(SELECT ps.AVGPrice FROM fnProductStatistics() ps WHERE ps.ProductID = p.ID) as AVGPrice, 
s.Qty, 
(SELECT MIN(od.Price) FROM OrderDetails od WHERE od.ProductID = p.ID) * s.Qty as MIN_�������_�������,  
(SELECT MAX(od.Price) FROM OrderDetails od WHERE od.ProductID = p.ID) * s.Qty as MAX_�������_�������, 
(SELECT ps.AVGPrice FROM fnProductStatistics() ps WHERE ps.ProductID = p.ID) * s.Qty as AVG_�������_�������
FROM Products p
	JOIN Stocks s
	ON p.ID = s.ProductID


