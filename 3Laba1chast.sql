use Supermarket
 ---------------------------Операторы сравнения---------------------------------------------
select * from Departments where number_of_sellers >3 ---- вывести где количество продавцов больше 3

select * from Employees where year_of_birth ='2002'


 -------------------------Логические операторы------------------------------------------------
select * from Departments where department_name ='Marketing' OR department_name= 'Management' 

select * from Employees where gender ='male' AND year_of_birth=2001


--------------------------------Комбинации Логических операторов--------------------------------------------------
select* from Products where department ='grocery' AND producing_country ='belarus' AND storage_periods>10

 ------------------------------------Выражения над столбцами------------------------------------------
 select * from Sale_of_goods where sum IN (9999,9876)
 
 ----------------------------Принадлежность диапазону значений--------------------------------------
 Select * from Sale_of_goods where price BETWEEN 300 AND 500
 
 select * from Sale_of_goods where price NOT BETWEEN 300 AND 500
 
  ------------------------------Соответствие шаблону------------------------------------
 select * from Departments where department_name Like '%Grocery%'
 
 select * from Positions where job_title Like 'M%' 

 ----------------------Неопределенное значение----------------------
 select * from Departments where room_number IS NULL 







