--------------------------------COUNT-----------------------------------------
use Supermarket

select count ( job_title) 
from Positions
where bet_amount=2222

----------------------------------SUM---------------------------------------------
select sum (price) 
from Sale_of_goods 
where amount=333

---------------------------------UPPER, LOWER-----------------------------------------
select upper (surname) from Employees

select lower (expirience) from Employees

---------------------------------��������� ������� ------------------------------------
select employee_salesman, item_date from Sale_of_goods where DATENAME (year,item_date)=2002

---------------------------------����������� �� ������ �������--------------------------
select department_name, count (*)  as "����������"
from Departments 
group by department_name
 
--------------------------�� ���������� ��������� �����������
select surname,gender , count (*)  as "����������"
from Employees 
group by surname,gender

----------------------------Having------------------------------
select department_name ,count (*) as "����������", avg (room_number)  as "�������"
from Departments group by department_name having avg(room_number) >3

----------���--------
select AVG (bet_amount) 
from Positions  
having avg(bet_amount)>400

-------------------���������� �� ������� ---------------------------------------
select job_title 
from Positions 
where job_title='Manager'  OR job_title ='Fruit' OR job_title ='Marketolog' order by bet_amount

--------------------���������� ������-------------------------------------------
insert into Positions(ID,job_title,bet_amount) Values (6,'secretary','567')

--------------------
update Positions set bet_amount=1+bet_amount

-------------------
update Positions set bet_amount=2*bet_amount where bet_amount<500

---------------------
delete from Sale_of_goods where amount<224

