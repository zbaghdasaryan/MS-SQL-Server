/****************************************************************************
************************   T R A N S A C T - S Q L   ************************
*****************************************************************************
*****  Lesson III  *****            SELECT           ************************
****************************************************************************/

-- DISTINCT - ������� ���������� ����� (��� ����������)
SELECT DISTINCT Department FROM Employees

-- TOP - ������� ��������� ����� �����
SELECT TOP 10 * FROM Employees

SELECT TOP 25 PERCENT * FROM Employees

-- ORDER BY - ����������
SELECT * FROM Employees
ORDER BY LName

SELECT * FROM Employees
ORDER BY LName, FName

SELECT * FROM Employees
ORDER BY BirthDate

SELECT * FROM Employees
ORDER BY BirthDate DESC

SELECT * FROM Employees
ORDER BY 7, 3 -- �������� ������� �������� (� �� ��������)

-- WITH TIES - ��� ��������� �����, ��������������� ��������� � ��������� ������
SELECT TOP 30 WITH TIES FName, LName, Salary FROM Employees
ORDER BY Salary DESC

SELECT TOP 30 FName, LName, Salary FROM Employees
ORDER BY Salary DESC


-- SELECT ... INTO ... - ��������� ���������� ������� � ����� �������

SELECT EmployeesID, LName, Salary 
INTO EmpSalaries -- ��� #EmpSalaries (�� ��������� �������)
FROM Employees
