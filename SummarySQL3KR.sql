-- 1. Создать базу данных company_db
-- 2. В базе данных company_db создать таблицу employees с полями:
-- 	id (INT, PRIMARY KEY, AUTO_INCREMENT)
-- 	name (VARCHAR(50), NOT NULL)
-- 	position (VARCHAR(50), NOT NULL)
-- 	salary (DECIMAL(10,2), CHECK(salary > 0))
-- 	hire_date (VARCHAR(10), NOT NULL)
-- 3. Добавить в таблицу employees поле email
-- 4. Удалить поле hire_date из таблицы employees
-- 5. Переименовать поле position в job_title
-- 6. Изменить тип данных поля salary на INTEGER
-- 7. Добавить новое поле department после job_title
-- 8. Заполнить таблицу employees следующими данными:
-- -- Сотрудник с именем "Анна", фамилией "Иванова", должностью "Менеджер", отделом "Отдел продаж", зарплатой 60000 и адресом электронной почты "anna.ivanova@example.ru".
-- -- Сотрудник с именем "Иван", фамилией "Смирнов", должностью "Разработчик", отделом "IT", зарплатой 75000 и адресом электронной почты "ivan.smirnov@example.com".
-- -- Сотрудник с именем "Мария", фамилией "Петрова", должностью "Бухгалтер", отделом "Финансы", зарплатой 50000 и адресом электронной почты "maria.petrova@example.com".
-- -- Сотрудник с именем "Петр", фамилией "Васильев", должностью "Разработчик", отделом "IT", зарплатой 80000 и адресом электронной почты "petr.vasiliev@example.ru".
-- -- Сотрудник с именем "Екатерина", фамилией "Соколова", должностью "HR-специалист", отделом "HR", зарплатой 55000 и адресом электронной почты "ekaterina.sokolova@example.com".
-- -- Сотрудник с именем "Алексей", фамилией "Кузнецов", должностью "Менеджер по продажам", отделом "Отдел продаж", зарплатой 65000 и адресом электронной почты "alexey.kuznetsov@example.ge".
-- -- Сотрудник с именем "Ольга", фамилией "Морозова", должностью "Аналитик", отделом "Финансы", зарплатой 70000 и адресом электронной почты "olga.morozova@example.com".
-- 9. Вывести всех сотрудников, работающих в отделе "IT" или "Финансы"
-- 10. Вывести всех сотрудников, у которых фамилия начинается с "С"
-- 11. Вывести всех сотрудников, у которых email оканчивается на "@example.com"
-- 12. Вывести всех сотрудников, у которых зарплата от 60000 до 75000
-- 13. Вывести всех сотрудников, у которых должность содержит слово "Менеджер"
-- 14. Вывести всех сотрудников, кроме тех, кто работает в отделе "HR"
-- 15. Вывести всех сотрудников, у которых зарплата больше 70000 или они работают в отделе "Финансы"
-- 16. Вывести всех сотрудников, у которых email содержит ".ru" или ".ge"
-- 17. Вывести всех сотрудников, у которых фамилия содержит "ов" или "ев"
-- 18. Вывести всех сотрудников, у которых зарплата меньше 55000 и они не работают в IT-отделе
-- 19. Вывести всех сотрудников в алфавитном порядке по имени
-- 20. Вывести всех сотрудников в порядке убывания зарплаты
-- 21. Вывести всех сотрудников, работающих в отделе "IT" или "Финансы", отсортировав их по зарплате (по убыванию)
-- 22. Вывести всех сотрудников, у которых зарплата выше 60000, отсортировав по фамилии в алфавитном порядке
-- 23. Вывести все уникальные отделы, в которых работают сотрудники
-- 24. Вывести все уникальные должности сотрудников
-- 25. Удалить таблицу employees

-- 1. создание базы данных company_db
create database company_db;

-- 2. создание таблицы employees
create table employees (
    id int auto_increment primary key,
    name varchar(50) not null,
    position varchar(50) not null,
    salary decimal(10, 2) check(salary > 0),
    hire_date varchar(10) not null
);

-- 3. добавление поля email в таблицу employees
 alter table employees add email varchar(100);

-- 4. удаление поля hire_date из таблицы employees
 alter table employees drop column hire_date;

-- 5. переименование поля position в job_title
 alter table employees rename column position to job_title;

-- 6. изменение типа данных поля salary на integer
 alter table employees modify salary int;

-- 7. добавление нового поля department после job_title
 alter table employees add column department varchar(50) after job_title;

-- 8. заполнение таблицы employees данными
 insert into employees (name, job_title, salary, email, department)
values 
    ('анна иванова', 'менеджер', 60000, 'anna.ivanova@example.ru', 'отдел продаж'),
     ('иван смирнов', 'разработчик', 75000, 'ivan.smirnov@example.com', 'it'),
     ('мария петрова', 'бухгалтер', 50000, 'maria.petrova@example.com', 'финансы'),
     ('петр васильев', 'разработчик', 80000, 'petr.vasiliev@example.ru', 'it'),
    ('екатерина соколова', 'hr-специалист', 55000, 'ekaterina.sokolova@example.com', 'hr'),
    ('алексей кузнецов', 'менеджер по продажам', 65000, 'alexey.kuznetsov@example.ge', 'отдел продаж'),
    ('ольга морозова', 'аналитик', 70000, 'olga.morozova@example.com', 'финансы');

-- 9. вывести всех сотрудников, работающих в отделе "it" или "финансы"
 select * from employees where department in ('it', 'финансы');

-- 10. вывести всех сотрудников, у которых фамилия начинается с "с"
 select * from employees where name like 'с%';

-- 11. вывести всех сотрудников, у которых email оканчивается на "@example.com"
 select * from employees where email like '%@example.com';

-- 12. вывести всех сотрудников, у которых зарплата от 60000 до 75000
 select * from employees where salary between 60000 and 75000;

-- 13. вывести всех сотрудников, у которых должность содержит слово "менеджер"
 select * from employees where job_title like '%менеджер%';

-- 14. вывести всех сотрудников, кроме тех, кто работает в отделе "hr"
 select * from employees where department != 'hr';

-- 15. вывести всех сотрудников, у которых зарплата больше 70000 или они работают в отделе "финансы"
 select * from employees where salary > 70000 or department = 'финансы';

-- 16. вывести всех сотрудников, у которых email содержит ".ru" или ".ge"
 select * from employees where email like '%.ru' or email like '%.ge';

-- 17. вывести всех сотрудников, у которых фамилия содержит "ов" или "ев"
 select * from employees where name like '%ов%' or name like '%ев%';

-- 18. вывести всех сотрудников, у которых зарплата меньше 55000 и они не работают в it-отделе
 select * from employees where salary < 55000 and department != 'it';

-- 19. вывести всех сотрудников в алфавитном порядке по имени
 select * from employees order by name;

-- 20. вывести всех сотрудников в порядке убывания зарплаты
 select * from employees order by salary desc;

-- 21. вывести всех сотрудников, работающих в отделе "it" или "финансы", отсортировав их по зарплате (по убыванию)
 select * from employees where department in ('it', 'финансы') order by salary desc;

-- 22. вывести всех сотрудников, у которых зарплата выше 60000, отсортировав по фамилии в алфавитном порядке
 select * from employees where salary > 60000 order by name;

-- 23. вывести все уникальные отделы, в которых работают сотрудники
 select distinct department from employees;

-- 24. вывести все уникальные должности сотрудников
 select distinct job_title from employees;

-- 25. удалить таблицу employees
 drop table employees;



