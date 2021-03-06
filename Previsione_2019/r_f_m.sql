use orders_all;

CREATE VIEW user_RFM_2013 ( id_user, sum_price, R, F, M) AS
 SELECT id_user, sum(price),
    CASE 
  WHEN TIMESTAMPDIFF(DAY,MAX(o_date),date('2014-01-01')) > 60 THEN '1'
  WHEN TIMESTAMPDIFF(DAY,MAX(o_date),date('2014-01-01')) > 30 
  AND TIMESTAMPDIFF(DAY,MAX(o_date),date('2014-01-01')) <= 60  THEN '2'
  ELSE '3' END AS R,

  CASE 
  WHEN COUNT(id_order) = 1 THEN '1'
  WHEN COUNT(id_order) > 1 AND COUNT(id_order) < 5 THEN '2'
  ELSE '3' END AS F,
  
  CASE 
  WHEN sum(price) < 10000 THEN '1'
  WHEN sum(price) < 20000 AND sum(price) >= 10000 THEN '2' 
  ELSE '3' END AS M
  FROM orders 
   where year(o_date) = '2013'
  GROUP BY id_user;
 
CREATE VIEW user_RFM_2014 ( id_user, sum_price, R, F, M) AS
 SELECT id_user, sum(price),
    CASE 
  WHEN TIMESTAMPDIFF(DAY,MAX(o_date),date('2015-01-01')) > 60 THEN '1'
  WHEN TIMESTAMPDIFF(DAY,MAX(o_date),date('2015-01-01')) > 30 
  AND TIMESTAMPDIFF(DAY,MAX(o_date),date('2015-01-01')) <= 60  THEN '2'
  ELSE '3' END AS R,

  CASE 
  WHEN COUNT(id_order) = 1 THEN '1'
  WHEN COUNT(id_order) > 1 AND COUNT(id_order) < 5 THEN '2'
  ELSE '3' END AS F,
  
  CASE 
  WHEN sum(price) < 10000 THEN '1'
  WHEN sum(price) < 20000 AND sum(price) >= 10000 THEN '2' 
  ELSE '3' END AS M
  FROM orders 
   where year(o_date) = '2014'
  GROUP BY id_user;
 
CREATE VIEW user_RFM_2015 ( id_user, sum_price, R, F, M) AS
 SELECT id_user, sum(price),
    CASE 
  WHEN TIMESTAMPDIFF(DAY,MAX(o_date),date('2016-01-01')) > 60 THEN '1'
  WHEN TIMESTAMPDIFF(DAY,MAX(o_date),date('2016-01-01')) > 30 
  AND TIMESTAMPDIFF(DAY,MAX(o_date),date('2016-01-01')) <= 60  THEN '2'
  ELSE '3' END AS R,

  CASE 
  WHEN COUNT(id_order) = 1 THEN '1'
  WHEN COUNT(id_order) > 1 AND COUNT(id_order) < 5 THEN '2'
  ELSE '3' END AS F,
  
  CASE 
  WHEN sum(price) < 10000 THEN '1'
  WHEN sum(price) < 20000 AND sum(price) >= 10000 THEN '2' 
  ELSE '3' END AS M
  FROM orders 
   where year(o_date) = '2015'
  GROUP BY id_user;
 
CREATE VIEW user_RFM_2016 ( id_user, sum_price, R, F, M) AS
 SELECT id_user, sum(price),
    CASE 
  WHEN TIMESTAMPDIFF(DAY,MAX(o_date),date('2017-01-01')) > 60 THEN '1'
  WHEN TIMESTAMPDIFF(DAY,MAX(o_date),date('2017-01-01')) > 30 
  AND TIMESTAMPDIFF(DAY,MAX(o_date),date('2017-01-01')) <= 60  THEN '2'
  ELSE '3' END AS R,

  CASE 
  WHEN COUNT(id_order) = 1 THEN '1'
  WHEN COUNT(id_order) > 1 AND COUNT(id_order) < 5 THEN '2'
  ELSE '3' END AS F,
  
  CASE 
  WHEN sum(price) < 10000 THEN '1'
  WHEN sum(price) < 20000 AND sum(price) >= 10000 THEN '2' 
  ELSE '3' END AS M
  FROM orders 
   where year(o_date) = '2016'
  GROUP BY id_user;
 
CREATE VIEW user_RFM_2017 ( id_user, sum_price, R, F, M) AS
 SELECT id_user, sum(price),
    CASE 
  WHEN TIMESTAMPDIFF(DAY,MAX(o_date),date('2018-01-01')) > 60 THEN '1'
  WHEN TIMESTAMPDIFF(DAY,MAX(o_date),date('2018-01-01')) > 30 
  AND TIMESTAMPDIFF(DAY,MAX(o_date),date('2018-01-01')) <= 60  THEN '2'
  ELSE '3' END AS R,

  CASE 
  WHEN COUNT(id_order) = 1 THEN '1'
  WHEN COUNT(id_order) > 1 AND COUNT(id_order) < 5 THEN '2'
  ELSE '3' END AS F,
  
  CASE 
  WHEN sum(price) < 10000 THEN '1'
  WHEN sum(price) < 20000 AND sum(price) >= 10000 THEN '2' 
  ELSE '3' END AS M
  FROM orders 
   where year(o_date) = '2017'
  GROUP BY id_user;
 
CREATE VIEW user_RFM_2018 ( id_user, sum_price, R, F, M) AS
 SELECT id_user, sum(price),
    CASE 
  WHEN TIMESTAMPDIFF(DAY,MAX(o_date),date('2019-01-01')) > 60 THEN '1'
  WHEN TIMESTAMPDIFF(DAY,MAX(o_date),date('2019-01-01')) > 30 
  AND TIMESTAMPDIFF(DAY,MAX(o_date),date('2019-01-01')) <= 60  THEN '2'
  ELSE '3' END AS R,

  CASE 
  WHEN COUNT(id_order) = 1 THEN '1'
  WHEN COUNT(id_order) > 1 AND COUNT(id_order) < 5 THEN '2'
  ELSE '3' END AS F,
  
  CASE 
  WHEN sum(price) < 10000 THEN '1'
  WHEN sum(price) < 20000 AND sum(price) >= 10000 THEN '2' 
  ELSE '3' END AS M
  FROM orders 
   where year(o_date) = '2018'
  GROUP BY id_user;
 
 # 2013
CREATE VIEW user_status_2013 (user_id, sum_price, status) AS
 SELECT id_user, sum_price,
  CASE 
  WHEN (R = 3 and F = 3 and M = 3) 
  or (R = 3 and F = 2 and M = 3) 
  or (R = 3 and F = 3 and M = 2) then 'VIP'
  WHEN (R = 1 and F = 1 and M = 1) 
  or (R = 1 and F = 1 and M = 2)
  or (R = 1 and F = 1 and M = 3)
  or (R = 1 and F = 2 and M = 1)
  or (R = 1 and F = 3 and M = 1)
  or (R = 1 and F = 2 and M = 2)
  or (R = 1 and F = 2 and M = 3)
  or (R = 1 and F = 3 and M = 2)
  or (R = 2 and F = 1 and M = 1)
  or (R = 1 and F = 3 and M = 3) then 'LOST'
  ELSE 'Regular' END AS status
   FROM user_RFM_2013;
  
select count(user_id), sum(sum_price)
 	from user_status_2013
 	where status = 'LOST';
select count(user_id), sum(sum_price)
 	from user_status_2013
 	where status = 'VIP';
select count(user_id), sum(sum_price)
 	from user_status_2013
 	where status = 'Regular';
 
# 2014
CREATE VIEW user_status_2014 (user_id, sum_price, status) AS
 SELECT id_user, sum_price,
  CASE 
  WHEN (R = 3 and F = 3 and M = 3) 
  or (R = 3 and F = 2 and M = 3) 
  or (R = 3 and F = 3 and M = 2) then 'VIP'
  WHEN (R = 1 and F = 1 and M = 1) 
  or (R = 1 and F = 1 and M = 2)
  or (R = 1 and F = 1 and M = 3)
  or (R = 1 and F = 2 and M = 1)
  or (R = 1 and F = 3 and M = 1)
  or (R = 1 and F = 2 and M = 2)
  or (R = 1 and F = 2 and M = 3)
  or (R = 1 and F = 3 and M = 2)
  or (R = 2 and F = 1 and M = 1)
  or (R = 1 and F = 3 and M = 3) then 'LOST'
  ELSE 'Regular' END AS status
   FROM user_RFM_2014;
  
select count(user_id), sum(sum_price)
 	from user_status_2014
 	where status = 'LOST';
select count(user_id), sum(sum_price)
 	from user_status_2014
 	where status = 'VIP';
select count(user_id), sum(sum_price)
 	from user_status_2014
 	where status = 'Regular';
 
 # 2015
CREATE VIEW user_status_2015 (user_id, sum_price, status) AS
 SELECT id_user, sum_price,
  CASE 
  WHEN (R = 3 and F = 3 and M = 3) 
  or (R = 3 and F = 2 and M = 3) 
  or (R = 3 and F = 3 and M = 2) then 'VIP'
  WHEN (R = 1 and F = 1 and M = 1) 
  or (R = 1 and F = 1 and M = 2)
  or (R = 1 and F = 1 and M = 3)
  or (R = 1 and F = 2 and M = 1)
  or (R = 1 and F = 3 and M = 1)
  or (R = 1 and F = 2 and M = 2)
  or (R = 1 and F = 2 and M = 3)
  or (R = 1 and F = 3 and M = 2)
  or (R = 2 and F = 1 and M = 1)
  or (R = 1 and F = 3 and M = 3) then 'LOST'
  ELSE 'Regular' END AS status
   FROM user_RFM_2015;
  
select count(user_id), sum(sum_price)
 	from user_status_2015
 	where status = 'LOST';
select count(user_id), sum(sum_price)
 	from user_status_2015
 	where status = 'VIP';
select count(user_id), sum(sum_price)
 	from user_status_2015
 	where status = 'Regular';
 
 # 2016
CREATE VIEW user_status_2016 (user_id, sum_price, status) AS
 SELECT id_user, sum_price,
  CASE 
  WHEN (R = 3 and F = 3 and M = 3) 
  or (R = 3 and F = 2 and M = 3) 
  or (R = 3 and F = 3 and M = 2) then 'VIP'
  WHEN (R = 1 and F = 1 and M = 1) 
  or (R = 1 and F = 1 and M = 2)
  or (R = 1 and F = 1 and M = 3)
  or (R = 1 and F = 2 and M = 1)
  or (R = 1 and F = 3 and M = 1)
  or (R = 1 and F = 2 and M = 2)
  or (R = 1 and F = 2 and M = 3)
  or (R = 1 and F = 3 and M = 2)
  or (R = 2 and F = 1 and M = 1)
  or (R = 1 and F = 3 and M = 3) then 'LOST'
  ELSE 'Regular' END AS status
   FROM user_RFM_2016;
  
select count(user_id), sum(sum_price)
 	from user_status_2016
 	where status = 'LOST';
select count(user_id), sum(sum_price)
 	from user_status_2016
 	where status = 'VIP';
select count(user_id), sum(sum_price)
 	from user_status_2016
 	where status = 'Regular';
 
 # 2017
CREATE VIEW user_status_2017 (user_id, sum_price, status) AS
 SELECT id_user, sum_price,
  CASE 
  WHEN (R = 3 and F = 3 and M = 3) 
  or (R = 3 and F = 2 and M = 3) 
  or (R = 3 and F = 3 and M = 2) then 'VIP'
  WHEN (R = 1 and F = 1 and M = 1) 
  or (R = 1 and F = 1 and M = 2)
  or (R = 1 and F = 1 and M = 3)
  or (R = 1 and F = 2 and M = 1)
  or (R = 1 and F = 3 and M = 1)
  or (R = 1 and F = 2 and M = 2)
  or (R = 1 and F = 2 and M = 3)
  or (R = 1 and F = 3 and M = 2)
  or (R = 2 and F = 1 and M = 1)
  or (R = 1 and F = 3 and M = 3) then 'LOST'
  ELSE 'Regular' END AS status
   FROM user_RFM_2017;
  
select count(user_id), sum(sum_price)
 	from user_status_2017
 	where status = 'LOST';
select count(user_id), sum(sum_price)
 	from user_status_2017
 	where status = 'VIP';
select count(user_id), sum(sum_price)
 	from user_status_2017
 	where status = 'Regular';
 
 # 2018
CREATE VIEW user_status_2018 (user_id, sum_price, status) AS
 SELECT id_user, sum_price,
  CASE 
  WHEN (R = 3 and F = 3 and M = 3) 
  or (R = 3 and F = 2 and M = 3) 
  or (R = 3 and F = 3 and M = 2) then 'VIP'
  WHEN (R = 1 and F = 1 and M = 1) 
  or (R = 1 and F = 1 and M = 2)
  or (R = 1 and F = 1 and M = 3)
  or (R = 1 and F = 2 and M = 1)
  or (R = 1 and F = 3 and M = 1)
  or (R = 1 and F = 2 and M = 2)
  or (R = 1 and F = 2 and M = 3)
  or (R = 1 and F = 3 and M = 2)
  or (R = 2 and F = 1 and M = 1)
  or (R = 1 and F = 3 and M = 3) then 'LOST'
  ELSE 'Regular' END AS status
   FROM user_RFM_2018;
  
select count(user_id), sum(sum_price)
 	from user_status_2018
 	where status = 'LOST';
select count(user_id), sum(sum_price)
 	from user_status_2018
 	where status = 'VIP';
select count(user_id), sum(sum_price)
 	from user_status_2018
 	where status = 'Regular';
 
 # Новые пользователи по месяцам:
select t.cog, count(t.id_user)
	from (
	select id_user, date_format(min(o_date), "%y%m") as cog
	from orders 
	group by id_user 
	) t
	group by t.cog;

#Для расчёта средней выручки с одного клиента разделим всю выручку на количество клиентов

select 
((select sum(price) from orders)/
(select count(DISTINCT id_user) FROM orders)) as summa # 4511,82
from orders;

create view arpu (id_user, sum_price) as
select id_user, sum(price)
from orders
group by id_user
having count(id_order) > 1;

select avg(sum_price) from arpu; #12342,1362

# Рассчитаем Lifetime
select avg(t.Lifetime)
from
(select id_user, TIMESTAMPDIFF(day, min(o_date), max(o_date)) as Lifetime from orders group by id_user) t; #74,844

select avg(t.Lifetime)
from
(select id_user, TIMESTAMPDIFF(day, min(o_date), max(o_date)) as Lifetime 
from orders 
group by id_user
having count(id_order) > 1) t; #334,95

# количество пользователей с одной покупкой
select count(t.id_user)
from
(select id_user
	from orders
	group by id_user 
	having count(id_order) = 1) t;




