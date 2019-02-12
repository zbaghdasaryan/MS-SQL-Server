﻿/****************************************************************************
************************   T R A N S A C T - S Q L   ************************
*****************************************************************************
*****  Lesson VIII  ****            Joins            ************************
*****************************************************************************
****************************************************************************/

USE master
GO

CREATE DATABASE JoinsDB
GO

USE JoinsDB
GO

CREATE TABLE dbo.Authors
(
    Id int NOT NULL IDENTITY,
    Name nvarchar(50) NULL
);

CREATE TABLE dbo.Books
(
    Id int NOT NULL IDENTITY,
    AuthorId int NULL,
	Title nvarchar(50) NULL
);

INSERT Authors VALUES
(N'Հովհաննես Թումանյան'),
(N'Ակսել Բակունց'),
(N'Եղիշե Չարենց'),
(N'Տռոելսեն')

INSERT Books VALUES
(1,N'Փարվան'),
(1,N'Մի կաթիլ մեղրը'),
(2,N'Մթնաձոր'),
(3,N'Դեպի ապագա') ,
(null, N'Աստվածաշունչ')
 

-- INNER JOIN
SELECT * FROM Authors
SELECT * FROM Books

SELECT * FROM Authors a
	JOIN Books b
	ON a.Id = b.AuthorId

SELECT * FROM Books b
	JOIN Authors a
	ON a.Id = b.AuthorId

-- LEFT OUTER JOIN
SELECT * FROM Authors a
	LEFT JOIN Books b
	ON a.Id = b.AuthorId

SELECT * FROM Books b
	LEFT JOIN Authors a
	ON a.Id = b.AuthorId

SELECT * FROM Authors a
	LEFT JOIN Books b
	ON a.Id = b.AuthorId
	WHERE b.AuthorId IS NULL

-- RIGHT OUTER JOIN
SELECT * FROM Authors a
	RIGHT JOIN Books b
	ON a.Id = b.AuthorId

SELECT * FROM Books b
	RIGHT JOIN Authors a
	ON a.Id = b.AuthorId

--FULL OUTER JOIN
SELECT * FROM Authors a
	FULL JOIN Books b
	ON a.Id = b.AuthorId

SELECT * FROM Authors a
	FULL JOIN Books b
	ON a.Id = b.AuthorId
	WHERE b.AuthorId IS NULL
		OR a.Id IS NULL
					
--CROSS JOIN
SELECT * FROM Authors a
	CROSS JOIN Books b
	--ON a.Id = b.AuthorId


--THETA JOIN
SELECT * FROM Authors a
	JOIN Books b
	ON a.Name > b.Title

--SELF JOIN
SELECT * FROM Authors a1
	JOIN Authors a2
	ON a1.Id = a2.Id

SELECT * FROM Authors a1
	JOIN Authors a2
	ON a1.Name > a2.Name