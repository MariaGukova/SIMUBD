---------------------------���������� ������������ ���� ������------------------------------------------
select Departments.department_name, Products.department 
from Departments,Products

----------------------------���������� ���� ������ �� ���������-----------------------------------------
select department,department_name 
from Employees,	Departments 
where Employees.department=Departments.department_name

select Positions.job_title,Employees.job_title 
from Positions,Employees 
where Positions.job_title=Employees.job_title

----------------------------���������� ���� ������ �� ��������� � �������� ������-----------------------------------------
 select Distinct employee_salesman,  surname
 from Sale_of_goods,Employees 
 where Sale_of_goods.employee_salesman=Employees.surname and Employees.surname='Gukova'

--------------------------���������� �� ���� ��������-----------------------

select   employee_salesman, Positions.job_title
from Sale_of_goods,Employees,Positions 
where  Sale_of_goods.employee_salesman=Employees.surname and Employees.surname='Eremenko' and Employees.job_title=Positions.job_title

------------------------------JOIN------------------------------------
use Supermarket
select product_name, department_name 
from Products left   join Departments 
on Products.department=Departments.department_name

select Employees.name , Departments.department_name  
from Employees right outer join Departments 
on Employees.department=Departments.department_name



