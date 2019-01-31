-- comments
--BIT
DECLARE  @someBit bit=0
PRINT @someBit
set @someBit=128 --bit or 0 or 1, its mean that if you use different by 0 number its will print 1
print @someBit

--INT
declare @someInt int =123
print @someInt

--DECIMAL
declare @someDec decimal =123.66 --can use dec
print @someInt

--DECIMAL
declare @someDec2 decimal(8,5) =123.66 --(8.5) mean amount of numbers 8, but max 3 before , (8-5=3) and 5 after , .Will print 123.66000
print @someDec2

--DECIMAL
declare @someDec3 decimal(8,5) =1234.66 --(8.5) will give Arithmetic overflow error converting numeric to data type numeric, because amount numbers before , >3.
print @someDec3

--DATA
declare @someData date= '01-17-2018'
print @someData


--DATETIME
declare @someDataTime DateTime= '01-17-2018 03:20:50'
print @someDataTime

--TIME
declare @someTime Time= '03:20:50:2'
print @someTime

--CHAR
/*
—трока фиксированной длины. ќт строки переменной длины данный тип отличаетс€ тем, что если длина строки меньше N символов, то она всегда дополн€етс€ справа до длины N пробелами и сохран€етс€ в Ѕƒ в таком виде, т.е. в базе данных она занимает ровно N символов. 
*/
declare @someNChar char(15)= 'привет'
print @someNChar

--CHAR
declare @someNChar2 char(15)= N'привет'
print @someNChar2

--VARCHAR
declare @someNVarChar2 char(15)= N'привет'
print @someNVarChar2

--SUM
declare @x int =5, @y int=15
select @x+@y

--DATETIME SUM
declare @date datetime= '2019-01-25 12:00:00'
select @date+1.25

--CHAR SUM
select 'hello, '+'word'


select 10/7 --=1
select 10./7 --=1.428571

select 7/5 --=1
select 7%5 --=2