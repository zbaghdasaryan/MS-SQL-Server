/****************************************************************************
************************   T R A N S A C T - S Q L   ************************
*****************************************************************************
*****  Lesson IV  ******      Scalar Functions       ************************
****************************************************************************/

--GO - ����������� �� ��������� ������ ���������� Transact-SQL.
--GO - ��� �� ���������� Transact-SQL; ��� ������� ������������ ���������� SQL Server Management Studio.
--����� (batch) - ��� ������������������ ���������� Transact-SQL � ����������� ����������, 
--������� ������������ ������� ���� ������ ��� ����������� �� ����������. ������������ ������ 
--��� ������� ��������� ���������� ������� � ���, ��� ������������� ���������� ���� ���������� 
--��������� �������� ������������ ��������� ������������������. 

--1. System Functions
--@@ERROR
DECLARE @myint int;  
SET @myint = 'ABC';  
GO

SELECT @@ERROR; 
GO

BEGIN TRY
	DECLARE @myint int;  
	SET @myint = 1/0
END TRY
BEGIN CATCH
	SELECT  
    ERROR_NUMBER() AS ErrorNumber  
    ,ERROR_SEVERITY() AS ErrorSeverity  
    ,ERROR_STATE() AS ErrorState  
    ,ERROR_PROCEDURE() AS ErrorProcedure  
    ,ERROR_LINE() AS ErrorLine  
    ,ERROR_MESSAGE() AS ErrorMessage
END CATCH

--@@IDENTITY - ���������� �������� ���������� ������������ ��������������
--SCOPE_IDENTITY, IDENT_CURRENT - ������� �������

INSERT Students
VALUES 
('Alex', 'Li', NULL, NULL);  
GO  
SELECT @@IDENTITY;  
GO  

--@@ROWCOUNT - ���������� ����� �����, ���������� ��� ���������� ��������� ����������.
UPDATE Students
SET LName = 'Po'
WHERE Id = 6
GO 
SELECT @@ROWCOUNT;  
GO

DELETE Students
GO  
SELECT @@ROWCOUNT;  
GO

-- NEWID - c������ ���������� �������� ���� uniqueidentifier. 
DECLARE @myId uniqueidentifier  
SET @myId = NEWID()  
PRINT @myId

-- ISNUMERIC - ����������, ����� �� ���������� ��������� ���������� �������� ��� (int, decimal � ��.),
-- ���������� 1, ���� ��� ������ �������� ��������� ���������� ���������� �������� ��� ������, ����� - 0.
SELECT 
	ISNUMERIC('33')
	,ISNUMERIC(17)
	,ISNUMERIC('3abc')
	,ISNUMERIC(@myId)
	,ISNUMERIC('+')
	,ISNUMERIC('$')
	
-- ISNULL - �������� �������� NULL ��������� ���������� ���������.

SELECT Id, LName, ISNULL(Salary, 0.0) AS Salary
FROM Employees

DECLARE @myInt int;
SELECT 3 + @myInt, 3 + ISNULL(@myInt, 0)

-- COALESCE - ���������� ������ �� NULL �������� �� ������ ��������.
-- (�������������� ������������� �������� � ��������� case)