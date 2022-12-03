DECLARE @mytable TABLE (id INT, myname CHAR(20) DEFAULT '������ ����')
INSERT INTO @mytable(id) VALUES (1)
INSERT INTO @mytable(id, myname) VALUES (2,'����� �������') 
SELECT * FROM @mytable

--
USE Supermarket
declare @a int
declare @b int
declare @c char(30)
set @a = (select COUNT(*) from Employees where gender = 'male')
set @b = (select COUNT(*) from Employees where gender = 'female')
if @a > @b begin 
set @c = '������ ������'
select @c
end
else begin
set @c = '������ ������'
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
PRINT @a -- ����� �� ����� �������� ���������� I
IF (@a>40) AND (@a<50)
BREAK --����� � ���������� 1-� ������� �� ������
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

IF (@man=1) SET @ISOweek='������'; 
IF (@man=2) SET @ISOweek='�������';
IF (@man=3) SET @ISOweek='����';
IF (@man=4) SET @ISOweek='������'; 
IF (@man=5) SET @ISOweek='���';
IF (@man=6) SET @ISOweek='����'; 
IF (@man=7) SET @ISOweek='����';
IF (@man=8) SET @ISOweek='������';
IF (@man=9) SET @ISOweek='��������'; 
IF (@man=10) SET @ISOweek='�������'; 
IF (@man=11) SET @ISOweek='������';
IF (@man=12) SET @ISOweek='�������';

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