IF EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('Employees'))
BEGIN;
    DROP TABLE [Employees];
END;
GO

CREATE TABLE [Employees] (
    [ID] INTEGER NOT NULL IDENTITY(1, 1),
    [FirstName] VARCHAR(25) NULL,
    [LastName] VARCHAR(25) NULL,
    [Email] VARCHAR(150) NULL,
    [BirthDate] DATE NOT NULL,
    [Cars] VARCHAR(20) NULL,
    [Company] VARCHAR(20) NULL,
    [Salary] INT,
    PRIMARY KEY ([ID])
);
GO

INSERT INTO Employees([FirstName],[LastName],[Email],[BirthDate],[Cars],[Company],[Salary]) VALUES('Vivian','David','est@tempusloremfringilla.net','09.10.80','Porsche','Lycos','5000'),('Aubrey','Anderson','libero.Integer.in@CurabiturdictumPhasellus.com','03.26.86','Lincoln','Chami','6000'),('Zorayr','Baghdasaryan','zorayr.baghdasaryan@mail.com','05.19.84','Porsche','Microsoft','8000'),('Cheyenne','Hughes','penatibus@Donecnibhenim.co.uk','03.03.78','Lexus','Microsoft','2000'),('Leila','Ortega','imperdiet.dictum@nisisem.net','10.21.89','Peugeot','Cakewalk','7000'),('Jonah','Meyer','vel.convallis.in@purusinmolestie.edu','02.26.85','Infinity','Microsoft','6000'),('Ignatius','Hodge','sapien.Cras@rhoncus.com','09.07.71','Daimler','Apple Systems','8000'),('Wylie','Nichols','Phasellus.ornare@dolorvitae.ca','02.25.80','Audi','Yahoo','8000'),('Ina','Cruz','Cras.eget.nisi@mi.ca','01.01.78','Renault','Lavasoft','6000'),('Deirdre','Weber','lobortis@massaSuspendisse.net','03.24.78','Mercedes-Benz','Google','7000'),('Howard','Anderson','Fusce.feugiat.Lorem@iaculisquispede.co.uk','05.02.72','Audi','Microsoft','4000'),('Felix','Lynch','non.dapibus@Nuncsedorci.org','10.01.75','Nissan','Borland','5000'),('Bell','Mendoza','sociis.natoque.penatibus@necorciDonec.ca','03.18.75','Lincoln','Finale','2000'),('Hilary','Talley','diam.Duis@nislsem.net','12.18.74','Opel','Chami','4000'),('David','Parker','eget@sitamet.edu','06.06.73','Lexus','Apple Systems','5000'),('Hu','Vang','et@IncondimentumDonec.com','09.30.85','Volvo','Cakewalk','3000'),('Rachel','Holden','dolor.elit.pellentesque@Duisvolutpatnunc.com','02.16.71','Smart','Apple Systems','7000'),('Leah','Franklin','amet.consectetuer.adipiscing@enimconsequat.edu','11.03.89','Mercedes-Benz','Borland','7000'),('Leah','Chandler','a.nunc.In@posuere.co.uk','02.12.77','Subaru','Google','2000'),('Kylie','Rocha','nisl.arcu@ligula.net','04.11.72','Peugeot','Finale','2000'),('Natalie','Meyer','lorem@Donec.ca','05.21.76','Fiat','Chami','7000'),('Vivien','Lynn','enim.Curabitur.massa@Mauris.ca','03.02.83','Suzuki','Borland','3000'),('Xandra','Campbell','Fusce@convallis.com','10.25.78','Acura','Borland','5000'),('Rhona','Morrow','libero@molestiedapibusligula.co.uk','09.27.86','Dodge','Chami','6000'),('Samson','Gamble','feugiat.non@estvitae.edu','12.28.86','Peugeot','Apple Systems','7000'),('Roanna','Hartman','tempor.arcu@lorem.net','05.16.72','Lexus','Microsoft','8000'),('Caleb','Cochran','libero@litoratorquentper.co.uk','04.13.87','Lincoln','Cakewalk','6000'),('Lee','Mack','quam.elementum.at@vulputatemaurissagittis.ca','03.11.83','Opel','Adobe','9000'),('Geoffrey','Henry','eu.ligula@duiaugue.com','03.12.83','General Motors','Chami','3000'),('Quemby','Banks','ultrices@et.ca','07.18.79','BMW','Adobe','8000'),('Jin','Mueller','Aliquam@telluseuaugue.co.uk','09.06.74','MINI','Sibelius','5000'),('Jocelyn','Evans','imperdiet.non@leoinlobortis.edu','07.03.89','Honda','Borland','8000'),('Xaviera','Sparks','taciti@eratvel.com','10.12.88','Opel','Finale','9000'),('Holly','Thomas','aliquet.vel@temporest.org','12.14.81','Cadillac','Adobe','5000'),('Stephen','Rhodes','Duis.volutpat.nunc@turpisvitae.co.uk','01.07.87','Chevrolet','Borland','8000'),('Odessa','Brown','odio.Etiam@lectusrutrumurna.org','08.03.74','Chevrolet','Sibelius','4000'),('Bethany','Mercer','luctus.sit.amet@auctorquis.ca','12.14.86','Dodge','Adobe','6000'),('Stuart','Olson','tortor.Nunc.commodo@dapibusrutrum.com','03.03.72','Volvo','Lycos','7000'),('Xandra','David','Cras.interdum@neccursus.edu','04.24.72','Porsche','Microsoft','9000'),('Dorian','Marshall','non.sollicitudin@ac.edu','06.22.82','Kia Motors','Macromedia','3000'),('Hu','Valentine','urna.Nunc.quis@cursus.ca','07.28.73','Lexus','Apple Systems','8000'),('Lara','Kirkland','dictum@porttitortellus.org','12.15.77','Opel','Yahoo','7000'),('Lesley','Morris','Nunc.ac@nonhendreritid.ca','02.01.84','Peugeot','Altavista','8000'),('Hall','Mendoza','Nunc.pulvinar.arcu@Proin.com','08.09.76','Smart','Lavasoft','9000'),('Leah','Conway','sem.elit@Loremipsumdolor.com','11.04.71','Peugeot','Chami','9000'),('Nyssa','Beach','vitae.sodales@euligula.org','12.25.70','Citroën','Chami','9000'),('Blair','Dickerson','facilisis.magna.tellus@nuncac.edu','09.12.73','Porsche','Cakewalk','6000'),('Shelley','Bates','in.sodales.elit@velit.edu','11.15.74','Kia Motors','Microsoft','6000'),('Nola','Burns','arcu@anteiaculisnec.co.uk','04.21.79','Citroën','Finale','8000'),('Sopoline','Fitzpatrick','dolor.egestas@erat.net','01.30.88','Dodge','Macromedia','8000'),('Urielle','Edwards','ullamcorper.eu@lacusvestibulumlorem.net','05.31.82','MINI','Lycos','3000'),('Hasad','Odom','pulvinar@magnaDuis.com','02.08.78','Ford','Lycos','4000'),('Evelyn','Mcconnell','id@tincidunt.net','06.01.83','Mitsubishi','Altavista','9000'),('Grady','Powers','Duis.mi.enim@Craslorem.co.uk','02.21.70','Mazda','Lavasoft','2000'),('Tamara','Mccall','nulla.Donec.non@sitametdapibus.co.uk','03.22.76','Mitsubishi','Lycos','6000'),('Violet','Oneill','tempor.est@natoquepenatibuset.org','06.09.85','Nissan','Sibelius','5000'),('Josephine','Humphrey','elit.pharetra@Sedeu.com','11.30.74','Suzuki','Finale','2000'),('Eric','Avery','eget.ipsum@Integeraliquam.org','10.08.85','BMW','Borland','9000'),('Winifred','Dixon','enim.gravida@Phasellusvitaemauris.com','01.20.73','Jeep','Lavasoft','7000'),('Brian','Macias','euismod@necenimNunc.com','09.22.78','Kia Motors','Lavasoft','4000'),('Upton','Barton','dolor@purus.ca','07.09.71','Nissan','Altavista','2000'),('Ariel','Roy','Vestibulum@mauriselit.net','06.19.89','Citroën','Adobe','9000'),('Willow','Todd','ultrices.posuere@nectempusscelerisque.com','10.22.81','Subaru','Cakewalk','5000'),('Hakeem','Valentine','erat.eget.tincidunt@Nullafacilisi.org','11.05.88','Suzuki','Finale','3000'),('Alexis','Curry','risus.In.mi@duiSuspendisse.com','06.14.83','Lincoln','Cakewalk','8000'),('Dylan','Cline','porttitor@porttitorscelerisqueneque.ca','02.21.72','MINI','Google','6000'),('James','Hodge','eleifend.nunc.risus@Inlorem.edu','08.17.81','Infinity','Apple Systems','9000'),('Zelenia','Kinney','blandit.mattis.Cras@montesnascetur.ca','06.29.78','Chevrolet','Microsoft','2000'),('Brenden','Guerra','nascetur@egestasSedpharetra.net','11.08.70','Volkswagen','Yahoo','8000'),('Amir','Norman','posuere.cubilia.Curae@NullainterdumCurabitur.co.uk','11.09.71','Suzuki','Yahoo','3000'),('Dane','Herring','lobortis.mauris.Suspendisse@inmagnaPhasellus.com','02.01.80','Acura','Borland','7000'),('Lionel','Mcconnell','tristique@Nuncac.com','07.02.87','Citroën','Sibelius','2000'),('Karly','Castillo','magna@ac.ca','08.03.77','Kia Motors','Yahoo','8000'),('Thomas','Kemp','nec.tellus.Nunc@Suspendisse.co.uk','04.10.82','Mazda','Macromedia','7000'),('Sloane','Stone','posuere@magnis.org','05.10.74','Chevrolet','Apple Systems','2000'),('Joshua','Sargent','est.Mauris@nonummyac.org','01.14.86','Infinity','Macromedia','4000'),('Malik','Burks','metus.Aenean@scelerisqueneque.ca','07.27.78','BMW','Microsoft','3000'),('Lynn','Acevedo','amet.risus.Donec@libero.com','04.01.80','Ford','Finale','9000'),('Noelani','Frederick','hendrerit.id@dolorNullasemper.ca','06.28.74','Audi','Adobe','4000'),('Mollie','Woodard','nec@mauris.net','12.22.74','MINI','Finale','5000'),('Adara','Boyd','vulputate.eu@dictum.org','05.29.74','General Motors','Chami','5000'),('Chantale','Fitzpatrick','libero@variusorci.net','03.02.81','Acura','Adobe','4000'),('Basil','Ortega','Donec.fringilla.Donec@Mauris.org','02.17.71','Audi','Google','5000'),('Katell','Glenn','Maecenas.malesuada.fringilla@ametluctusvulputate.net','07.29.89','Kia Motors','Microsoft','8000'),('Abel','Jacobs','purus@non.co.uk','12.19.70','Kia Motors','Yahoo','2000'),('Hedley','Rosales','dis.parturient.montes@massaQuisque.com','07.06.79','Kia Motors','Google','5000'),('Shana','Mcdonald','rutrum.lorem@Phasellus.net','12.23.73','Subaru','Adobe','7000'),('Rose','Bond','fringilla.ornare@tempor.co.uk','11.16.76','Honda','Chami','7000'),('Christopher','Elliott','dictum.eu@nibh.com','07.29.84','Ferrari','Borland','2000'),('Simon','Dale','quis.urna@Donecnonjusto.org','01.23.86','Subaru','Chami','7000'),('Denton','Merritt','vehicula.aliquet@Aliquamadipiscing.net','06.07.81','Cadillac','Finale','7000'),('Ivy','Leonard','libero.est@id.net','11.01.73','Acura','Sibelius','3000'),('Emerson','Jordan','condimentum.eget@vitaeeratVivamus.co.uk','01.26.77','Subaru','Microsoft','4000'),('Nash','Bradshaw','consectetuer.cursus.et@vulputateullamcorper.ca','02.09.85','Mercedes-Benz','Google','5000'),('Ferris','Parks','Pellentesque@acturpisegestas.edu','09.20.86','Nissan','Sibelius','3000'),('Giacomo','Clayton','magna@Crasegetnisi.co.uk','10.31.74','Daimler','Lycos','6000'),('Meredith','Carney','Nunc.lectus.pede@porta.net','03.24.71','Ford','Apple Systems','8000'),('Troy','West','egestas@Suspendisse.edu','01.11.81','Mazda','Altavista','3000'),('Peter','Campbell','Aliquam@purus.org','12.21.86','Mazda','Sibelius','9000'),('Chiquita','Ware','ornare.In.faucibus@tempusmauris.ca','07.09.82','Renault','Macromedia','9000');

Create Database EmployeesDB

use EmployeesDB

-- DISTINCT - выборка уникальных строк (без дубликатов)
Select Distinct Cars from Employees 

-- TOP - выборка заданного числа строк
Select Top 10 * from Employees
Select Top 25 Percent *from Employees

-- ORDER BY - сортировка
Select * From Employees
Order by LastName

Select * From Employees
Order by LastName, FirstName

Select * From Employees
Order by BirthDate

Select * From Employees
Order by BirthDate Desc

-- WITH TIES - для включения строк, соответствующих значениям в последней строке

Select Top 30 FirstName, LastName, Salary from Employees
ORDER BY Salary DESC

Select Top 30 With Ties FirstName, LastName, Salary from Employees
ORDER BY Salary DESC


-- SELECT ... INTO ... - сохранить результаты выборки в новой таблице

Select Id, FirstName, Salary
Into EmpTemp -- или #EmpTemp (во временную таблицу)
From Employees

-- WHERE - условие выборки строк

--1. Нахождение строки с помощью простого равенства
Select * from Employees
where Salary=4000

Select * from Employees
where Company='Microsoft'

-- Операторы сравнения (=, <> или !=, >, <, >=, <=, !<, !>)
--2. Нахождение строк с использованием оператора сравнениЯ
Select * from Employees
where BirthDate>'19800501'

-- Логические операторы (ALL, AND, ANY, BETWEEN, EXISTS, IN, LIKE, NOT, OR, SOME)
--3. Нахождение строк, которые должны удовлетворять нескольким условиям

Select *From Employees
Where Company ='microsoft' and Salary >=8000 

--4. Нахождение строк, удовлетворяющих любому из нескольких условий
Select *From Employees
Where Company ='microsoft' or Company ='Apple Systems' 

Select *From Employees
Where Salary >6000 and (Company ='microsoft' or Company ='Apple Systems') 

--5. IN - нахождение строк, находЯщихсЯ в списке значений
Select *From Employees
Where Cars in ('bmw', 'Toyota', 'LinColn') 

--6. BETWEEN - нахождение строк, содержащих значение, расположенное между двумЯ значениЯми
Select *From Employees
Where BirthDate>'1988.05.19' and BirthDate<'1990' 

Select *From Employees
Where BirthDate between '1970' and '1990'

--7. -- LIKE - нахождение строк, содержащих значение как часть строки
SELECT * FROM Employees
WHERE Company LIKE 'Microsoft'

-- Wildcard Characters - подстановочные символы (%, _, [], [^])
SELECT * FROM Employees
WHERE Company LIKE 'App%'

SELECT * FROM Employees
WHERE Id LIKE '_2'

SELECT * FROM Employees
WHERE Id LIKE '[2,4]2'

SELECT * FROM Employees
WHERE Id LIKE '[2-7]2'

SELECT * FROM Employees
WHERE Id LIKE '[^2-7]2'

--ESCAPE

SELECT * FROM Employees
WHERE Email  Like '[ESCAPE%]'

--8. Сравнение с NULL
SELECT * FROM Employees
WHERE FirstName is Null 

SELECT * FROM Employees
WHERE FirstName is NOT Null

SELECT * FROM Employees
WHERE Salary in (4000, 7000)
or Salary is null


-- Выражение CASE 
-- 1) простое выражение CASE

Select Id, FirstName, LastName, 

Case 

When Salary>=8000 Then 'Chife'
When Salary>=5000 Then 'Manager'
When Salary is null then 'Not working'
Else 'Engineer'

End As Position,

Case 
When Salary>=8000 Then 'Chife'
When Salary>=5000 Then 'Manager'
When Salary is null then 'Not working'
--without else will show NULL
End As Position1

From Employees

Select Id, FirstName, Lastname, Company,

Case Company					--Case
 When 'Microsoft' Then '100%'		--Company='Microsoft' Then '3x'	
 When 'Apple Systems' Then '75%'	--Company='Apple Systems' Then '2x'
 When 'Adobe' Then '50%'
 When 'Macromedia' Then '25%'	
 Else '10%'
 End As [Bonus%],

 Salary/100*
 Case Company					
 When 'Microsoft' Then 100		
 When 'Apple Systems' Then 75	
 When 'Adobe' Then 50
 When 'Macromedia' Then 25	
 Else 10
 End As [Bonus],

 (Salary/100*
 Case Company					
 When 'Microsoft' Then 100		
 When 'Apple Systems' Then 75	
 When 'Adobe' Then 50
 When 'Macromedia' Then 25	
 Else 10
 End)+Salary As [Salary+Bonus]
  
From Employees

-- IIF (начиная с SQL Server 2012)

Select Id, FirstName, LastName, Salary,

IIF(Salary>=8000, 'Chife', 'Engineer') As Position
-- CASE WHEN Salary >= 8000 THEN 'manager' ELSE 'woker' END As Position
From Employees

Alter Table Employees
Add Gender bit

Update Employees
Set Gender= IIF(Id>50, 0,1)

Select Id, FirstName, Lastname,
IIf(Gender=0, 'female','male') As Gender

From Employees

-- GROUP BY
Select Company, Gender From Employees

Group By Company, Gender
--Select Distinct Company, Gender From Employees

-- HAVING
Select Company From Employees
Group By Company, Gender
Having Company like 'L%'

