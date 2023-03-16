create table salary(
    id serial primary key,
    monthly_salary int not null
);

create table roles(
    id serial primary key,
    role_title varchar(50) unique not null
);

create table roles_salary (
    id serial primary key,
    id_role int not null,
    id_salary int not null,
    foreign key (id_role)
       references roles(id),
    foreign key (id_salary)
       references salary(id)
);

insert into roles_salary (id_role, id_salary)
values (1, 1),
       (2, 3),
       (3, 8),
       (4, 1),
       (5, 1),
       (6, 9),
       (7, 3),
       (8, 5),
       (9, 9);

insert into salary(monthly_salary)
values (500),
       (700),
       (900),
       (1000),
       (1200),
       (1400),
       (1500),
       (1700),
       (2000);
       
insert into roles(role_title)
values ('QA_manual_junior'),
       ('QA_manual_middle'),
       ('QA_manual_senior'),
       ('QA_automation_junior'),
       ('QA_automation_middle'),
       ('QA_automation_senior'),
       ('Java_developer_junior'),
       ('Java_developer_middle'),
       ('Java_developer_senior'),
       ('CEO'),
       ('CTO'),
       ('HR'),
       ('Manager'),
       ('Designer');   
 
select r.role_title, s.monthly_salary from roles r
join roles_salary rs on rs.id_role = r.id
join salary s on rs.id_salary = s.id; 

alter table roles 
add column parling int;

alter table roles
rename column parking to naxi;

alter table roles
drop colomn taxi;

update salary 
set monthly_salary=1600
where id = 7;







