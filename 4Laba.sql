DECLARE @mytable TABLE (id INT, myname CHAR(20) DEFAULT 'Иванов Иван')
INSERT INTO @mytable(id) VALUES (1)
INSERT INTO @mytable(id, myname) VALUES (2,'Игорь Троцкий') 
SELECT * FROM @mytable

--
USE Supermarket
declare @a int
declare @b int
declare @c char(30)
set @a = (select COUNT(*) from Employees where gender = 'male')
set @b = (select COUNT(*) from Employees where gender = 'female')
if @a > @b begin 
set @c = 'Мужчин больше'
select @c
end
else begin
set @c = 'Женщин больше'
select @c
end
--

declare @m int
set @m = 10
while @m > 0
begin
print @m
set @m -= 1 
end


DECLARE @a INT 
SET @a = 1 WHILE @a <100
BEGIN
PRINT @a -- вывод на экран значения переменной I
IF (@a>40) AND (@a<50)
BREAK --выход и выполнение 1-й команды за циклом
ELSE
SET @a = @a+rand()*10 
CONTINUE
END
PRINT @a

GO
IF OBJECT_ID (N'dbo.ISOweek', N'FN') IS NOT NULL 
DROP FUNCTION dbo.ISOweek;

GO
CREATE FUNCTION dbo.ISOweek (@DATE date) RETURNS CHAR(15)
WITH EXECUTE AS CALLER AS
BEGIN
DECLARE @man int; 
DECLARE @ISOweek char(15); 
SET @man= MONTH(@DATE)

IF (@man=1) SET @ISOweek='Январь'; 
IF (@man=2) SET @ISOweek='Февраль';
IF (@man=3) SET @ISOweek='Март';
IF (@man=4) SET @ISOweek='Апрель'; 
IF (@man=5) SET @ISOweek='Май';
IF (@man=6) SET @ISOweek='Июнь'; 
IF (@man=7) SET @ISOweek='Июль';
IF (@man=8) SET @ISOweek='Август';
IF (@man=9) SET @ISOweek='Сентябрь'; 
IF (@man=10) SET @ISOweek='Октябрь'; 
IF (@man=11) SET @ISOweek='Ноябрь';
IF (@man=12) SET @ISOweek='Декабрь';

RETURN(@ISOweek); 
END;

go
select dbo.ISOweek(GETDATE())


go
create procedure Count_males
as
select COUNT(*) as 'Count'
from Employees
where gender = 'male'
go
exec Count_males


go
create procedure Count_males_param @var as char(30)
as
select COUNT(*) as 'Count'
from Employees
where gender = @var
go
exec Count_males_param 'male'



go
create procedure gender_param
@var char(30) = NULL
as
if @var is NULL
	begin
	print 'Enter your var'
	return 1
	end
	else begin
	select * from Employees
	where gender = @var
	return 2
	end;
	go


go
exec gender_param 'male'

go 
create procedure update_positions
as
update Positions 
set bet_amount = 666
where bet_amount = 2

go
exec update_positions