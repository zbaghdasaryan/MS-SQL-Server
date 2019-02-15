/****************************************************************************
************************   T R A N S A C T - S Q L   ************************
*****************************************************************************
*****  Lesson IV  ******      Scalar Functions       ************************
****************************************************************************/

--3. String Functions

----ASCII / UNICODE - ���������� ��� ASCII / UNICODE ������� ������� ���������� 
--  ����������� ���������.

SELECT ASCII('hello') [ASCII],
	   UNICODE(N'����') [UNICODE]

----CHAR / NCHAR - ����������� int ��� ASCII / UNICODE � ������.

SELECT CHAR(104) [CHAR],
	   NCHAR(1073) [NCHAR]


SELECT LEFT('abcdefg',2) [LEFT],
	   RIGHT('abcdefg',2) [RIGHT],
	   LOWER('ABCDEFG') [LOWER],
	   UPPER('abcdefg') [UPPER],
	   LEN('12345   ') [LEN],
	   REVERSE('12345') [REVERSE]

--STUFF, SUBSTRING
SELECT STUFF('abcdefg', 3, 2, '!!!') [STUFF],
	   SUBSTRING('abcdefg', 3, 2) [SUBSTRING]

PRINT LTRIM('    hello')
PRINT RTRIM('world    ')
PRINT 'Hello,' + SPACE(5) + 'world'
PRINT REPLICATE('&', 7)

SELECT CHARINDEX('Two', 'One Two Three Two Four'),
	   CHARINDEX('Two', 'One Two Three Two Four', 6),
	   PATINDEX('%Th_ee%', 'One Two Three Two Four')

SELECT REPLACE('One Two Three Two Four', 'Two', '2')

SELECT N'��������' + ' ' + N'������',
	   N'��������' + ' ' + NULL,
	   N'��������' + ' ' + ISNULL(NULL, ''),
	   CONCAT(N'��������', ' ', NULL)

--STRING_AGG, STRING_SPLIT - SQL Server 2016
SELECT value
FROM STRING_SPLIT('PRODUCTION & ENGINEERING|SUPPLY|LOGISTICS|
PLANNED-ECONOMIC|QUALITY ASSURANCE & CONTROL|ADMINISTRATION & SUPPORT|
MARKETING|HR MANAGEMENT|SALES|FINANCE & ACCOUNTING|LAW', '|')






