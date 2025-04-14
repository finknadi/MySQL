-- 1. создать и активировать базу данных tasks.
create database tasks;
use tasks;

-- 2. создать таблицу store
create table store (
    id int auto_increment primary key,
    title varchar(128) not null,
    price int,
    quantity int
);

-- 3. добавить записи
insert into store (title, price, quantity) values
('skirt', 120, 10),
('shirt', 55, 4),
('jeanse', 135, 15);

-- 4. товары с ценой больше 100
select * from store where price > 100;

-- 5. товары, начинающиеся на 's'
select * from store where title like 's%';

-- 6. увеличить количество 'jeanse' на 5
update store set quantity = quantity + 5 where title = 'jeanse';

select id from store where title = 'jeanse';

update store set quantity = quantity + 5 where id = 3;

-- 7. добавить поле quality
alter table store add quality int;

set sql_safe_updates = 0;

-- 8. заполнить поле quality
update store set quality = 5 where price > 100;
update store set quality = 4 where price <= 100;

-- 9. удалить товары, где количество < 10
delete from store where quantity < 10;

-- 10. удалить таблицу store
drop table store;

-- 11. удалить базу данных tasks
drop database tasks;

-- 11. удалить базу данных tasks
drop database tasks;

-- 12. создать базу данных shop и использовать скрипт
create database shop;
use shop;

CREATE TABLE SELLERS(
       SELL_ID    INTEGER, 
       SNAME   VARCHAR(20), 
       CITY    VARCHAR(20), 
       COMM    NUMERIC(2, 2),
             BOSS_ID  INTEGER
);
                                            
CREATE TABLE CUSTOMERS(
       CUST_ID    INTEGER, 
       CNAME   VARCHAR(20), 
       CITY    VARCHAR(20), 
       RATING  INTEGER
);

CREATE TABLE ORDERS(
       ORDER_ID  INTEGER, 
       AMT     NUMERIC(7,2), 
       ODATE   DATE, 
       CUST_ID    INTEGER,
       SELL_ID    INTEGER 
);

INSERT INTO SELLERS VALUES(201,'Олег','Москва',0.12,202);
INSERT INTO SELLERS VALUES(202,'Лев','Сочи',0.13,204);
INSERT INTO SELLERS VALUES(203,'Арсений','Владимир',0.10,204);
INSERT INTO SELLERS VALUES(204,'Екатерина','Москва',0.11,205);
INSERT INTO SELLERS VALUES(205,'Леонид ','Казань',0.15,NULL);


INSERT INTO CUSTOMERS VALUES(301,'Андрей','Москва',100);
INSERT INTO CUSTOMERS VALUES(302,'Михаил','Тула',200);
INSERT INTO CUSTOMERS VALUES(303,'Иван','Сочи',200);
INSERT INTO CUSTOMERS VALUES(304,'Дмитрий','Ярославль',300);
INSERT INTO CUSTOMERS VALUES(305,'Руслан','Москва',100);
INSERT INTO CUSTOMERS VALUES(306,'Артём','Тула',100);
INSERT INTO CUSTOMERS VALUES(307,'Юлия','Сочи',300);


INSERT INTO ORDERS VALUES(101,18.69,'2022-03-10',308,207);
INSERT INTO ORDERS VALUES(102,5900.1,'2022-03-10',307,204);
INSERT INTO ORDERS VALUES(103,767.19,'2022-03-10',301,201);
INSERT INTO ORDERS VALUES(104,5160.45,'2022-03-10',303,202);
INSERT INTO ORDERS VALUES(105,1098.16,'2022-03-10',308,207);
INSERT INTO ORDERS VALUES(106,75.75,'2022-04-10',304,202); 
INSERT INTO ORDERS VALUES(107,4723,'2022-05-10',306,201);
INSERT INTO ORDERS VALUES(108,1713.23,'2022-04-10',302,203);
INSERT INTO ORDERS VALUES(109,1309.95,'2022-06-10',304,203);
INSERT INTO ORDERS VALUES(110,9891.88,'2022-06-10',306,201);

-- 13. Все продавцы, чьи имена начинаются на 'Л'
select * from sellers where sname like 'л%';

-- 14. клиенты из тулы с рейтингом > 100
select * from customers where city = 'тула' and rating > 100;

-- 15. Продавцы с комиссией от 0.10 до 0.15 (включительно)
select * from sellers where comm between 0.10 and 0.15;

-- 16. Пары покупатель-продавец из одного города
select c.cname as customer, s.sname as seller
from customers c
join sellers s on c.city = s.city;

-- 17. Имена продавцов, у которых нет заказов
select s.sname
from sellers s
left join orders o on s.sell_id = o.sell_id
where o.order_id is null;

-- 18. Имена всех продавцов, которые продают товары клиентам из Тулы
select distinct s.sname
from sellers s
join orders o on s.sell_id = o.sell_id
join customers c on o.cust_id = c.cust_id
where c.city = 'тула';

-- 19. Средняя сумма заказа для каждого клиента
select c.cname, avg(o.amt) as avg_order
from orders o
join customers c on o.cust_id = c.cust_id
group by c.cname;

-- 20. Общее количество клиентов в каждом городе
select city, count(*) as total_customers
from customers
group by city;

-- 21. Города, где средняя сумма заказа превышает 2000
select c.city
from orders o
join customers c on o.cust_id = c.cust_id
group by c.city
having avg(o.amt) > 2000;

-- 22. Продавцы, у которых количество заказов больше 2
select s.sname
from sellers s
join orders o on s.sell_id = o.sell_id
group by s.sname
having count(o.order_id) > 2;

-- 23. Количество заказов, сделанных клиентами из Тулы
select count(*) as orders_from_tula
from orders o
join customers c on o.cust_id = c.cust_id
where c.city = 'тула';