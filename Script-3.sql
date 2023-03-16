-- 1.������� ���� ���������� ��� �������� ���� � ����, ������ � ����������. 
select employees.employee_name, salary.monthly_salary
from employee_salary 
	inner join salary on employee_salary.salary_id=salary.id
	inner join employees on employee_salary.employee_id=employees.id;

-- 2. ������� ���� ���������� � ������� �� ������ 2000.
select employees.employee_name, salary.monthly_salary
from employee_salary 
	inner join salary on employee_salary.salary_id=salary.id
	inner join employees on employee_salary.employee_id=employees.id
where monthly_salary < 2000;

-- ��� ���������� ���������� ����� ������� ������� �� �/� (���������� �� �/� �� ��������)
insert into salary (monthly_salary)
	values (800),
		   (900);

-- ������ ����������� �� ������� employee_id ������� employee_salary
ALTER TABLE employee_salary ALTER COLUMN employee_id DROP NOT NULL;

-- �������� id ���������� ������� � ������� employee_salary
insert into employee_salary (salary_id)		  
	values (17),
		   (18);

-- 3. ������� ��� ���������� �������, �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)
select  salary.monthly_salary, employees.employee_name
	from employee_salary
	left join salary on employee_salary.salary_id = salary.id
	left join employees on employee_salary.employee_id = employees.id
	where employees.employee_name is null;
	

--4. ������� ��� ���������� �������  ������ 2000 �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)
select  salary.monthly_salary, employees.employee_name
	from employee_salary
	left join salary on employee_salary.salary_id = salary.id
	left join employees on employee_salary.employee_id = employees.id
	where salary.monthly_salary < 2000 and employees.employee_name is null;


-- ������ ����������� �� ������� salary_id ������� employee_salary
ALTER TABLE employee_salary ALTER COLUMN salary_id DROP NOT NULL;

-- �������� id ���������� ������� � ������� employee_salary
insert into employee_salary (employee_id)		  
	values (64),
		   (66);
		  
--5. ����� ���� ���������� ���� �� ��������� ��.
select salary.monthly_salary, employees.employee_name
	from employee_salary
	left join salary on employee_salary.salary_id = salary.id
	left join employees on employee_salary.employee_id = employees.id
	where monthly_salary is null;

-- 6. ������� ���� ���������� � ���������� �� ���������
select employees.employee_name, roles.role_name
from roles_employee
	inner join employees on employee_id = employees.id
	inner join roles on role_id = roles.id;

-- 7. ������� ����� � ��������� ������ Java �������������.
select employees.employee_name, roles.role_name
from roles_employee
	inner join employees on employee_id = employees.id
	inner join roles on role_id = roles.id
where roles.role_name like '%Java %';

-- 8. ������� ����� � ��������� ������ Python �������������.
select employees.employee_name, roles.role_name
from roles_employee
	inner join employees on employee_id = employees.id
	inner join roles on role_id = roles.id
where roles.role_name like '%Python%';

-- 9. ������� ����� � ��������� ���� QA ���������. 
select employees.employee_name, roles.role_name
from roles_employee
	inner join employees on employee_id = employees.id
	inner join roles on role_id = roles.id
where roles.role_name like '%QA%';

--10. ������� ����� � ��������� ������ QA ���������.
select employees.employee_name, roles.role_name
from roles_employee
	inner join employees on employee_id = employees.id
	inner join roles on role_id = roles.id
where roles.role_name like '%Manual QA%';

-- 11. ������� ����� � ��������� ��������������� QA
select employees.employee_name, roles.role_name
from roles_employee
	inner join employees on employee_id = employees.id
	inner join roles on role_id = roles.id
where roles.role_name like '%Automation QA%';

--12. ������� ����� � �������� Junior ������������
select employees.employee_name, monthly_salary
from roles_employee
	inner join employees on employee_id = employees.id
	inner join roles on role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	inner join salary on employee_salary.salary_id = salary.id
where roles.role_name like '%Junior%';

--13. ������� ����� � �������� Middle ������������
select employees.employee_name, monthly_salary 
from roles_employee
	inner join employees on employee_id = employees.id
	inner join roles on role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	inner join salary on employee_salary.salary_id = salary.id
where roles.role_name like '%Middle%';

--14. ������� ����� � �������� Senior ������������
select employees.employee_name, monthly_salary 
from roles_employee
	inner join employees on employee_id = employees.id
	inner join roles on role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	inner join salary on employee_salary.salary_id = salary.id
where roles.role_name like '%Senior%';

--15. ������� �������� Java �������������
select employees.employee_name, monthly_salary 
from roles_employee
	inner join employees on employee_id = employees.id
	inner join roles on role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	inner join salary on employee_salary.salary_id = salary.id
where roles.role_name like '%Java %';

--16. ������� �������� Python �������������
select employees.employee_name, monthly_salary 
from roles_employee
	inner join employees on employee_id = employees.id
	inner join roles on role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	inner join salary on employee_salary.salary_id = salary.id
where roles.role_name like '%Python %';

--  17. ������� ����� � �������� Junior Python �������������
select employees.employee_name, salary.monthly_salary
from roles_employee 
	inner join employees on roles_employee.employee_id = employees.id
	inner join roles on roles_employee.role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	inner join salary on employee_salary.salary_id = salary.id
	where roles.role_name like '%Junior Python%'; 

--������� ��� ����������� ���������� �����
insert into employee_salary (employee_id, salary_id)
	values (37,5);


--18. ������� ����� � �������� Middle JS �������������
select employees.employee_name, salary.monthly_salary
from roles_employee 
	inner join employees on roles_employee.employee_id = employees.id
	inner join roles on roles_employee.role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	inner join salary on employee_salary.salary_id = salary.id
	where roles.role_name like '%Middle JavaScript%'; 

--������� ��� ����������� ���������� �����
insert into employee_salary (employee_id, salary_id)
	values (2,10);

--19. ������� ����� � �������� Senior Java �������������
select employees.employee_name, salary.monthly_salary
from roles_employee 
	inner join employees on roles_employee.employee_id = employees.id
	inner join roles on roles_employee.role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	inner join salary on employee_salary.salary_id = salary.id
	where roles.role_name like '%Senior Java %'; 

--������� ��� ����������� ���������� �����
insert into employee_salary (employee_id, salary_id)
	values (31,13);


--20. ������� �������� Junior QA ���������
select salary.monthly_salary
from roles_employee 
	inner join employees on roles_employee.employee_id = employees.id
	inner join roles on roles_employee.role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	inner join salary on employee_salary.salary_id = salary.id
	where roles.role_name like 'Junior%QA %';

--21. ������� ������� �������� ���� Junior ������������
select avg(salary.monthly_salary) as avg_monthly_salary_junior
from roles_employee 
	inner join employees on roles_employee.employee_id = employees.id
	inner join roles on roles_employee.role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	inner join salary on employee_salary.salary_id = salary.id
	where roles.role_name like 'Junior%';

--22. ������� ����� ������� JS �������������
select sum(salary.monthly_salary) as sum_monthly_salary_js
from roles_employee 
	inner join employees on roles_employee.employee_id = employees.id
	inner join roles on roles_employee.role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	inner join salary on employee_salary.salary_id = salary.id
	where roles.role_name like '%JavaScript%';

--23. ������� ����������� �� QA ���������
select MIN(salary.monthly_salary) as min_monthly_salary_qa
from roles_employee 
	inner join employees on roles_employee.employee_id = employees.id
	inner join roles on roles_employee.role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	inner join salary on employee_salary.salary_id = salary.id
	where roles.role_name like '%QA%';

--24. ������� ������������ �� QA ���������
select max(salary.monthly_salary) as max_monthly_salary_qa
from roles_employee 
	inner join employees on roles_employee.employee_id = employees.id
	inner join roles on roles_employee.role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	inner join salary on employee_salary.salary_id = salary.id
	where roles.role_name like '%QA%';

--25. ������� ���������� QA ���������
select count(roles.role_name) as count_qa
from roles_employee 
	inner join employees on roles_employee.employee_id = employees.id
	inner join roles on roles_employee.role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	where roles.role_name like '%QA%';

--26. ������� ���������� Middle ������������
select count(roles.role_name) as count_middle
from roles_employee 
	inner join employees on roles_employee.employee_id = employees.id
	inner join roles on roles_employee.role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	where roles.role_name like 'Middle%';

--27. ������� ���������� �������������
select count(roles.role_name) as count_developer
from roles_employee 
	inner join employees on roles_employee.employee_id = employees.id
	inner join roles on roles_employee.role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	where roles.role_name like '%developer';

--28. ������� ���� (�����) �������� �������������.
select sum(salary.monthly_salary) as sum_monthly_salary_dev
from roles_employee 
	inner join employees on roles_employee.employee_id = employees.id
	inner join roles on roles_employee.role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	inner join salary on employee_salary.salary_id = salary.id
	where roles.role_name like '%developer';

--29. ������� �����, ��������� � �� ���� ������������ �� �����������
select employees.employee_name, roles.role_name, salary.monthly_salary
from roles_employee 
	inner join employees on roles_employee.employee_id = employees.id
	inner join roles on roles_employee.role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	inner join salary on employee_salary.salary_id = salary.id
	order by salary.monthly_salary asc; 

--30. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� �� 1700 �� 2300
select employees.employee_name, roles.role_name, salary.monthly_salary
from roles_employee 
	inner join employees on roles_employee.employee_id = employees.id
	inner join roles on roles_employee.role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	inner join salary on employee_salary.salary_id = salary.id
	where salary.monthly_salary between 1700 and 2300
	order by salary.monthly_salary asc;

--31. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ������ 2300
select employees.employee_name, roles.role_name, salary.monthly_salary
from roles_employee 
	inner join employees on roles_employee.employee_id = employees.id
	inner join roles on roles_employee.role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	inner join salary on employee_salary.salary_id = salary.id
	where salary.monthly_salary < 2300
	order by salary.monthly_salary asc;

--32. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ����� 1100, 1500, 2000
select employees.employee_name, roles.role_name, salary.monthly_salary
from roles_employee 
	inner join employees on roles_employee.employee_id = employees.id
	inner join roles on roles_employee.role_id = roles.id
	inner join employee_salary on employee_salary.employee_id = roles_employee.employee_id
	inner join salary on employee_salary.salary_id = salary.id
	where salary.monthly_salary in (1100, 1500, 2000)
	order by salary.monthly_salary asc;





-- ������� employee_salary
select employees.employee_name, salary.monthly_salary, employee_salary.employee_id, employee_salary.salary_id, employees.id as id_from_employee, salary.id as id_from_salary
from employee_salary
	inner join employees on employee_salary.employee_id = employees.id
	inner join salary on employee_salary.salary_id = salary.id
	order by employee_id;

--������� roles_employee
select employees.employee_name, roles.role_name, roles_employee.employee_id, roles_employee.role_id, employees.id as id_from_employe, roles.id as id_from_role
from roles_employee
	inner join employees on roles_employee.employee_id = employees.id
	inner join roles on roles_employee.role_id = roles.id
	order by roles_employee.employee_id;

select * from salary;
select * from employees;
select * from roles;