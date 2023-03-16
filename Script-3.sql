-- 1.Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами. 
select employees.employee_name, salary.monthly_salary
from employee_salary 
	inner join salary on employee_salary.salary_id=salary.id
	inner join employees on employee_salary.employee_id=employees.id;

-- 2. Вывести всех работников у которых ЗП меньше 2000.
select employees.employee_name, salary.monthly_salary
from employee_salary 
	inner join salary on employee_salary.salary_id=salary.id
	inner join employees on employee_salary.employee_id=employees.id
where monthly_salary < 2000;

-- Для выполнения следующего кейса добавил позиции по з/п (сотрудника на з/п не назначал)
insert into salary (monthly_salary)
	values (800),
		   (900);

-- Удаляю ограничения со столбца employee_id таблицы employee_salary
ALTER TABLE employee_salary ALTER COLUMN employee_id DROP NOT NULL;

-- Добавляю id зарплатных позиций в таблицу employee_salary
insert into employee_salary (salary_id)		  
	values (17),
		   (18);

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select  salary.monthly_salary, employees.employee_name
	from employee_salary
	left join salary on employee_salary.salary_id = salary.id
	left join employees on employee_salary.employee_id = employees.id
	where employees.employee_name is null;
	

--4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select  salary.monthly_salary, employees.employee_name
	from employee_salary
	left join salary on employee_salary.salary_id = salary.id
	left join employees on employee_salary.employee_id = employees.id
	where salary.monthly_salary < 2000 and employees.employee_name is null;


-- Удаляю ограничения со столбца salary_id таблицы employee_salary
ALTER TABLE employee_salary ALTER COLUMN salary_id DROP NOT NULL;

-- Добавляю id зарплатных позиций в таблицу employee_salary
insert into employee_salary (employee_id)		  
	values (64),
		   (66);
		  
--5. Найти всех работников кому не начислена ЗП.
select salary.monthly_salary, employees.employee_name
	from employee_salary
	left join salary on employee_salary.salary_id = salary.id
	left join employees on employee_salary.employee_id = employees.id
	where monthly_salary is null;

-- 6. Вывести всех работников с названиями их должности
select employees.employee_name, roles.role_name
from roles_employee
	inner join employees on employee_id = employees.id
	inner join roles on role_id = roles.id;

-- 7. Вывести имена и должность только Java разработчиков.
select employees.employee_name, roles.role_name
from roles_employee
	inner join employees on employee_id = employees.id
	inner join roles on role_id = roles.id
where roles.role_name like '%Java %';

-- 8. Вывести имена и должность только Python разработчиков.
select employees.employee_name, roles.role_name
from roles_employee
	inner join employees on employee_id = employees.id
	inner join roles on role_id = roles.id
where roles.role_name like '%Python%';

-- 9. Вывести имена и должность всех QA инженеров. 
select employees.employee_name, roles.role_name
from roles_employee
	inner join employees on employee_id = employees.id
	inner join roles on role_id = roles.id
where roles.role_name like '%QA%';

--10. Вывести имена и должность ручных QA инженеров.
select employees.employee_name, roles.role_name
from roles_employee
	inner join employees on employee_id = employees.id
	inner join roles on role_id = roles.id
where roles.role_name like '%Manual QA%';

-- 11. Вывести имена и должность автоматизаторов QA
select employees.employee_name, roles.role_name
from roles_employee
	inner join employees on employee_id = employees.id
	inner join roles on role_id = roles.id
where roles.role_name like '%Automation QA%';

--12. Вывести имена и зарплаты Junior специалистов
select employees.employee_name, monthly_salary
from roles_employee
	inner join employees on employee_id = employees.id
	inner join roles on role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	inner join salary on employee_salary.salary_id = salary.id
where roles.role_name like '%Junior%';

--13. Вывести имена и зарплаты Middle специалистов
select employees.employee_name, monthly_salary 
from roles_employee
	inner join employees on employee_id = employees.id
	inner join roles on role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	inner join salary on employee_salary.salary_id = salary.id
where roles.role_name like '%Middle%';

--14. Вывести имена и зарплаты Senior специалистов
select employees.employee_name, monthly_salary 
from roles_employee
	inner join employees on employee_id = employees.id
	inner join roles on role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	inner join salary on employee_salary.salary_id = salary.id
where roles.role_name like '%Senior%';

--15. Вывести зарплаты Java разработчиков
select employees.employee_name, monthly_salary 
from roles_employee
	inner join employees on employee_id = employees.id
	inner join roles on role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	inner join salary on employee_salary.salary_id = salary.id
where roles.role_name like '%Java %';

--16. Вывести зарплаты Python разработчиков
select employees.employee_name, monthly_salary 
from roles_employee
	inner join employees on employee_id = employees.id
	inner join roles on role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	inner join salary on employee_salary.salary_id = salary.id
where roles.role_name like '%Python %';

--  17. Вывести имена и зарплаты Junior Python разработчиков
select employees.employee_name, salary.monthly_salary
from roles_employee 
	inner join employees on roles_employee.employee_id = employees.id
	inner join roles on roles_employee.role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	inner join salary on employee_salary.salary_id = salary.id
	where roles.role_name like '%Junior Python%'; 

--Добавил для прохождения следующего кейса
insert into employee_salary (employee_id, salary_id)
	values (37,5);


--18. Вывести имена и зарплаты Middle JS разработчиков
select employees.employee_name, salary.monthly_salary
from roles_employee 
	inner join employees on roles_employee.employee_id = employees.id
	inner join roles on roles_employee.role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	inner join salary on employee_salary.salary_id = salary.id
	where roles.role_name like '%Middle JavaScript%'; 

--Добавил для прохождения следующего кейса
insert into employee_salary (employee_id, salary_id)
	values (2,10);

--19. Вывести имена и зарплаты Senior Java разработчиков
select employees.employee_name, salary.monthly_salary
from roles_employee 
	inner join employees on roles_employee.employee_id = employees.id
	inner join roles on roles_employee.role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	inner join salary on employee_salary.salary_id = salary.id
	where roles.role_name like '%Senior Java %'; 

--Добавил для прохождения следующего кейса
insert into employee_salary (employee_id, salary_id)
	values (31,13);


--20. Вывести зарплаты Junior QA инженеров
select salary.monthly_salary
from roles_employee 
	inner join employees on roles_employee.employee_id = employees.id
	inner join roles on roles_employee.role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	inner join salary on employee_salary.salary_id = salary.id
	where roles.role_name like 'Junior%QA %';

--21. Вывести среднюю зарплату всех Junior специалистов
select avg(salary.monthly_salary) as avg_monthly_salary_junior
from roles_employee 
	inner join employees on roles_employee.employee_id = employees.id
	inner join roles on roles_employee.role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	inner join salary on employee_salary.salary_id = salary.id
	where roles.role_name like 'Junior%';

--22. Вывести сумму зарплат JS разработчиков
select sum(salary.monthly_salary) as sum_monthly_salary_js
from roles_employee 
	inner join employees on roles_employee.employee_id = employees.id
	inner join roles on roles_employee.role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	inner join salary on employee_salary.salary_id = salary.id
	where roles.role_name like '%JavaScript%';

--23. Вывести минимальную ЗП QA инженеров
select MIN(salary.monthly_salary) as min_monthly_salary_qa
from roles_employee 
	inner join employees on roles_employee.employee_id = employees.id
	inner join roles on roles_employee.role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	inner join salary on employee_salary.salary_id = salary.id
	where roles.role_name like '%QA%';

--24. Вывести максимальную ЗП QA инженеров
select max(salary.monthly_salary) as max_monthly_salary_qa
from roles_employee 
	inner join employees on roles_employee.employee_id = employees.id
	inner join roles on roles_employee.role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	inner join salary on employee_salary.salary_id = salary.id
	where roles.role_name like '%QA%';

--25. Вывести количество QA инженеров
select count(roles.role_name) as count_qa
from roles_employee 
	inner join employees on roles_employee.employee_id = employees.id
	inner join roles on roles_employee.role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	where roles.role_name like '%QA%';

--26. Вывести количество Middle специалистов
select count(roles.role_name) as count_middle
from roles_employee 
	inner join employees on roles_employee.employee_id = employees.id
	inner join roles on roles_employee.role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	where roles.role_name like 'Middle%';

--27. Вывести количество разработчиков
select count(roles.role_name) as count_developer
from roles_employee 
	inner join employees on roles_employee.employee_id = employees.id
	inner join roles on roles_employee.role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	where roles.role_name like '%developer';

--28. Вывести фонд (сумму) зарплаты разработчиков.
select sum(salary.monthly_salary) as sum_monthly_salary_dev
from roles_employee 
	inner join employees on roles_employee.employee_id = employees.id
	inner join roles on roles_employee.role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	inner join salary on employee_salary.salary_id = salary.id
	where roles.role_name like '%developer';

--29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employees.employee_name, roles.role_name, salary.monthly_salary
from roles_employee 
	inner join employees on roles_employee.employee_id = employees.id
	inner join roles on roles_employee.role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	inner join salary on employee_salary.salary_id = salary.id
	order by salary.monthly_salary asc; 

--30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employees.employee_name, roles.role_name, salary.monthly_salary
from roles_employee 
	inner join employees on roles_employee.employee_id = employees.id
	inner join roles on roles_employee.role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	inner join salary on employee_salary.salary_id = salary.id
	where salary.monthly_salary between 1700 and 2300
	order by salary.monthly_salary asc;

--31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employees.employee_name, roles.role_name, salary.monthly_salary
from roles_employee 
	inner join employees on roles_employee.employee_id = employees.id
	inner join roles on roles_employee.role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	inner join salary on employee_salary.salary_id = salary.id
	where salary.monthly_salary < 2300
	order by salary.monthly_salary asc;

--32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employees.employee_name, roles.role_name, salary.monthly_salary
from roles_employee 
	inner join employees on roles_employee.employee_id = employees.id
	inner join roles on roles_employee.role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	inner join salary on employee_salary.salary_id = salary.id
	where salary.monthly_salary in (1100, 1500, 2000)
	order by salary.monthly_salary asc;





-- Таблица employee_salary
select employees.employee_name, salary.monthly_salary, employee_salary.employee_id, employee_salary.salary_id, employees.id as id_from_employee, salary.id as id_from_salary
from employee_salary
	inner join employees on employee_salary.employee_id = employees.id
	inner join salary on employee_salary.salary_id = salary.id
	order by employee_id;

--Таблица roles_employee
select employees.employee_name, roles.role_name, roles_employee.employee_id, roles_employee.role_id, employees.id as id_from_employe, roles.id as id_from_role
from roles_employee
	inner join employees on roles_employee.employee_id = employees.id
	inner join roles on roles_employee.role_id = roles.id
	order by roles_employee.employee_id;

select * from salary;
select * from employees;
select * from roles;