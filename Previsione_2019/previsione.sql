#1.  Заливаем в свою БД данные по продажам 

create database orders_all;

use orders_all;

drop table orders; 
CREATE TABLE orders  (
  id_order int,
  id_user int, 
  price bigint,
  o_date VARCHAR(255),
  UNIQUE unique_id_order(id_order),
  index (id_order)
 );

ALTER TABLE orders ADD created_at_dt DATETIME;
UPDATE orders
SET created_at_dt = STR_TO_DATE(o_date, '%d.%m.%Y');
    
ALTER TABLE orders 
    DROP o_date,
    RENAME COLUMN created_at_dt TO o_date;

#2.Обрабатываем данные
# Анализируем наличие пропусков в данных
SELECT count(id_order) FROM orders WHERE id_order IS null or id_order = 0; # нет пропусков
SELECT count(id_user) FROM orders WHERE id_user IS null; # не рассматриваем значение 0, т.к. у нас есть пользователь с id_user = 0
SELECT count(price) FROM orders WHERE price IS null or price = 0; # есть 55537
SELECT count(o_date) FROM orders WHERE o_date IS null or o_date = '0000-00-00 00:00:00.0'; # есть 55492
select count(*) from orders; # общее количество строк 4365731
# т.к. количество пропусков меньше 2%, то просто предлагаю удалить данные строки
DELETE FROM orders 
WHERE price IS null or price = 0 or o_date IS null or o_date = '0000-00-00 00:00:00.0'; #удалено 55537 строк

# рассмотрим адекватность данных по столбцу price
SELECT min(price), max(price) FROM orders; 
# видим значения -2086 и 7000000000000000 это говорит о не верности данных посчитаем количество таких строк
SELECT count(price) FROM orders where price <= 50 or price >= 200000; #7449 
#удалим их, т.к. занчение не существенно
DELETE FROM orders 
where price <= 50 or price >= 200000;



# Данные выгружены за период
select min(o_date), max(o_date) from orders; # c 26.042013 по 27.12.2018
# посчитаем количество уникальных пользователей, строк, заказов
select count(DISTINCT id_user) FROM orders; # 2145055
select count(*) from orders; # 4302745
select count(id_order) from orders; # 4302745

# 4. По годам считаем средний чек, среднее кол-во заказов на пользователя данные выгружаем в MS Excel.


select avg(price), year(o_date)
from orders
group by year(o_date);

select count(id_order)/count(DISTINCT id_user) as avg_od, year(o_date) 
from orders 
group by year(o_date);



