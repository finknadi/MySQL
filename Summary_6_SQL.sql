use gt081024;

create table staff (
    id int auto_increment primary key,
    first_name varchar(50),
    last_name varchar(50),
    age int,
    has_child char(1),
    position varchar(100),
    username varchar(50)
);

-- 1. Создать новое поле experience_level и заполнить его значением:
	-- 	'Junior', если возраст меньше 25 лет.
	-- 	'Middle', если возраст от 25 до 35 лет.
	-- 	'Senior', если возраст больше 35 лет.
alter table staff add column experience_level varchar(10);
update staff set experience_level =
    case
        when age < 25 then 'Junior'
        when age between 25 and 35 then 'Middle'
        else 'Senior'
    end;
   
   -- 2. Создать новое поле family_status и заполнить его значением:
	-- 'Has children', если has_child равно 'Y'.
	-- 'No children', если has_child равно 'N'.
    alter table staff add column family_status varchar(15);
update staff set family_status = 
    case 
        when has_child = 'Y' then 'Has children'
        else 'No children'
    end;
    
    -- 3. Вывести фамилии всех сотрудников в верхнем регистре.
    select upper(last_name) from staff;
    
  -- 4. Вывести имена всех сотрудников в нижнем регистре.  
    select lower(first_name) from staff;
    
    -- 5. Создать новое поле fullname и заполнить его объединением имени и фамилии.
    alter table staff add column fullname varchar(101);
    update staff set fullname = concat(first_name, ' ', last_name);
    
    SET SQL_SAFE_UPDATES = 0; (Тут вспомнила, что нужно отключить безопасный режим обновлений)
    
    -- 6. Вычислить длину имени каждого сотрудника и вывести как новое поле firstname_length.
    select first_name, length(first_name) as firstname_length from staff;
    
    -- 7. Найти сотрудников, у которых длина фамилии больше 6 символов.
    select * from staff where length(last_name) > 6;
    
    -- 8. Создать новое поле child_bonus и заполнить его значением:
	-- 	500, если has_child равно 'Y'.
	-- 	0, если has_child равно 'N'.
    alter table staff add column child_bonus int;
    update staff set child_bonus = if(has_child = 'Y', 500, 0);
    
    -- 9. Вывести возраст всех сотрудников, увеличенный на 5 лет.
    select age + 5 as future_age from staff;
    
    -- 10.Создать новое поле salary_category и заполнить его значением:

	-- 	'High', если возраст больше 30 и has_child равно 'Y'.
	-- 	'Medium', если возраст больше 30 и has_child равно 'N'.
	-- 	'Low' для остальных.
    alter table staff add column salary_category varchar(10);
    update staff set salary_category =
    case
        when age > 30 and has_child = 'Y' then 'High'
        when age > 30 and has_child = 'N' then 'Medium'
        else 'Low'
    end;
    
    -- 11. Найти сотрудников, у которых в фамилии есть символ 's'.
    select * from staff where last_name like '%s%';
    
    -- 12. Создать новое поле position_rank и заполнить его значением:

	-- 	'Teacher', если должность содержит слово 'Teacher'.
	-- 	'Designer', если должность содержит слово 'Designer'.
	-- 	'Other' для остальных.
    alter table staff add column position_rank varchar(10);
    
    update staff set position_rank =
    case
        when position like '%Teacher%' then 'Teacher'
        when position like '%Designer%' then 'Designer'
        else 'Other'
    end;
    
    -- 13. Найти сотрудников, чьи имена заканчиваются на 'y'.
    select * from staff where first_name like '%y';
    
    -- 14. Найти сотрудников, у которых фамилии начинаются с 'A' или 'L'.
    select * from staff where last_name like 'A%' or last_name like 'L%';
    
    -- 15. Создать новое поле username_default и заполнить его значением:
	-- 	username, если имя пользователя указано.
	-- 	'unknown', если имя пользователя не указано.
    alter table staff add column username_default varchar(50);
    update staff set username_default = if(username is not null and username <> '', username, 'unknown');
    
    SET SQL_SAFE_UPDATES = 1;
