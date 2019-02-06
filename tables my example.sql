create database AnsharjGuyq
drop database AnsharjGuyq

use AnsharjGuyq


CREATE TABLE Tner
(
    id int NOT NULL identity,
    FName nvarchar(20) NULL,
	LName nvarchar(20) Null,
	Phone char(9),
	Email varchar(20),
);

Alter Table Tner
Alter column FName nvarchar(30) not null

Alter Table Tner
Alter column Phone char(9) not null

Alter Table Tner
Add MName nvarchar(20)

Alter Table Tner
drop column MName 

Alter Table Tner
drop column Email 

Alter Table Tner
Add qaxaq nvarchar(10)

Alter Table Tner
Add hamaynq nvarchar(15)

Alter table Tner
Add hark int

Alter Table Tner
Add senyak int

Alter Table Tner
Add makeres int

--DML

Insert into Tner
(FName, LName, Phone)
values
(N'Արամ', N'Արամյան', '091555555'),
(N'Հրանտ', N'Վարդանյան', '091777777')

Set Identity_Insert Tner On
Insert into Tner
(id, FName, LName, Phone)
Values 
(3, N'Հայկ', N'Հակոբյան', '091333333')
Set Identity_Insert Tner Off

Select *From Tner

Select Lname, Phone From Tner
where Id=3

CREATE TABLE SepakanatereriPhones
(
    Id int NOT NULL,
    FName varchar(20) NULL,
    phonenumbers char(9)
);

insert SepakanatereriPhones
select id, FName, Phone from Tner

update Tner
set LName=null
where id=2

update Tner
set LName=null
where id=3

delete Tner
where id=3

truncate table Tner
truncate table SepakanatereriPhones
select * from Tner

Insert into Tner (FName, LName, Phone)
output inserted.*
	values
		(N'Արամ', N'Արամյան', '091555555'),
		(N'Հրանտ', N'Վարդանյան', '091777777'),
		(N'Հայկ', N'Հակոբյան', '091333333')

Delete Tner
output deleted.id, deleted.FName
where id=2

update Tner
set Phone= '091445564' 
output inserted.id, inserted.FName, inserted.Phone as [new number], deleted.Phone "old number"
where id =2

delete Tner
output deleted.id, deleted.FName, deleted.Phone into SepakanatereriPhones