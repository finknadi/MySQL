CREATE DATABASE CompanyDB;
USE CompanyDB;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Salary DECIMAL(10, 2),
    DepartmentID INT,
    HireDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100),
    Budget DECIMAL(10, 2)
);

CREATE TABLE EmployeeProjects (
    EmployeeID INT,
    ProjectID INT,
    HoursWorked DECIMAL(5, 2),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
    PRIMARY KEY (EmployeeID, ProjectID)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Sales'),
(5, 'Marketing');

INSERT INTO Employees (EmployeeID, FirstName, LastName, Salary, DepartmentID, HireDate) VALUES
(1, 'John', 'Doe', 6000, 1, '2021-01-15'),
(2, 'Jane', 'Smith', 7500, 1, '2019-11-23'),
(3, 'Jim', 'Brown', 8000, 2, '2020-03-12'),
(4, 'Jake', 'Williams', 5500, 2, '2022-07-01'),
(5, 'Jess', 'Taylor', 7000, 3, '2018-05-08'),
(6, 'Jill', 'Adams', 6700, 3, '2021-06-22'),
(7, 'James', 'Davis', 9000, 4, '2020-09-30'),
(8, 'Jenny', 'Wilson', 6500, 4, '2019-04-18'),
(9, 'Jerry', 'Moore', 7200, 5, '2018-08-25');

INSERT INTO Projects (ProjectID, ProjectName, Budget) VALUES
(1, 'Website Redesign', 15000),
(2, 'New HR Software', 20000),
(3, 'Financial Audit', 10000),
(4, 'Sales Campaign', 25000),
(5, 'Market Research', 18000);

INSERT INTO EmployeeProjects (EmployeeID, ProjectID, HoursWorked) VALUES
(1, 1, 120),
(2, 1, 80),
(3, 2, 100),
(4, 2, 60),
(5, 3, 110),
(6, 3, 90),
(7, 4, 150),
(8, 4, 110),
(9, 5, 130);

-- 1. Найдите среднюю зарплату сотрудников в каждом департаменте. Выведите название департамента и среднюю зарплату
-- 2. Определите количество сотрудников в каждом департаменте. Выведите название департамента и количество сотрудников.
-- 3. Найдите минимальную и максимальную зарплаты в каждом департаменте. 
-- Выведите название департамента, минимальную и максимальную зарплату.
-- 4. Определите общую сумму зарплат в каждом департаменте. Выведите название департамента и общую сумму зарплат.
-- 5. Вывести ID департамента с самой высокой средней зарплатой сотрудников.
-- 6. Вывести имя департамента с самой высокой средней зарплатой сотрудников.
-- 7. Выведите имя, фамилию и зарплату сотрудников, чья зарплата выше средней по их департаменту.
-- 8. Найдите проект с наибольшим количеством сотрудников, проработавших на нем больше 100 часов. Вывести ProjectName.

-- 1. Средняя зарплата сотрудников в каждом департаменте
select d.departmentname, avg(e.salary) as avg_salary
from employees e
join departments d on e.departmentid = d.departmentid
group by d.departmentname;

-- 2. Количество сотрудников в каждом департаменте
select d.departmentname, count(e.employeeid) as employee_count
from employees e
join departments d on e.departmentid = d.departmentid
group by d.departmentname;

-- 3. Минимальная и максимальная зарплата в каждом департаменте
select d.departmentname, min(e.salary) as min_salary, max(e.salary) as max_salary
from employees e
join departments d on e.departmentid = d.departmentid
group by d.departmentname;

-- 4. Общая сумма зарплат в каждом департаменте
select d.departmentname, sum(e.salary) as total_salary
from employees e
join departments d on e.departmentid = d.departmentid
group by d.departmentname;

-- 5. ID департамента с самой высокой средней зарплатой
select departmentid
from employees
group by departmentid
order by avg(salary) desc
limit 1;

-- 6. Имя департамента с самой высокой средней зарплатой
select d.departmentname
from employees e
join departments d on e.departmentid = d.departmentid
group by d.departmentname
order by avg(e.salary) desc
limit 1;

-- 7. Сотрудники, чья зарплата выше средней по их департаменту
select e.firstname, e.lastname, e.salary
from employees e
join (
    select departmentid, avg(salary) as avg_salary
    from employees
    group by departmentid
) dep_avg on e.departmentid = dep_avg.departmentid
where e.salary > dep_avg.avg_salary;

-- 8. Проект с наибольшим количеством сотрудников, проработавших более 100 часов
select p.projectname
from employeeprojects ep
join projects p on ep.projectid = p.projectid
where ep.hoursworked > 100
group by p.projectid, p.projectname
order by count(ep.employeeid) desc
limit 1;