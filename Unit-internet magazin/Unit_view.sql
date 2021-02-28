-- Представление группированное предстваление таблицы продажи
CREATE VIEW orders (order_id, buyers, total_sum, sales_channel_id, created_at) AS  
	select
  	order_id,
  	(select name from buyers where id = op.buyers_id) as name,
 	SUM(total_sum) as total_sum,
  	sales_channel_id,
  	created_at
  	from orders_products op group by order_id, order by order_id;
  
  -- Представление уникальных покупателей (для поиска уникальных клиентов по каждому каналу продаж, нужно для расчета APC)
  CREATE VIEW unic_buyers ( buyers, total_buyers, sales_channel_id) AS 
  	select buyers, count(buyers), sales_channel_id from orders group by sales_channel_id, buyers;
  

  -- Представление для количество проданных товаров
 CREATE VIEW order_products_value ( sales_channel_id, products_id, value) AS  
 	select sales_channel_id, products_id, sum(value) from orders_products group by sales_channel_id, products_id;


 -- Представление для расчета суммы затрат на приобретение этих товаров
 CREATE VIEW customs_products_total (sales_channel_id, products_id, name, value, purchase_price, total_sum) AS 
 select opv.sales_channel_id, opv.products_id, p.name, opv.value, p.purchase_price, opv.value * p.purchase_price as total_sum
 	from order_products_value opv
 	join products p
 	where opv.products_id = p.id;
 	

  -- Представление показатели для расчета unit-экономики
  CREATE VIEW init_economy (id, name, user_acquisition, AvPrice, COGS, APC, CR1, CR2, CR3, CPAcq) as
  	select
  	id,
  	name,
  	total,
  	(select AVG(total_sum) from orders where sales_channel_id = sc.id) as AvPrice,
  	(((select total_sum * 
  		(select SUM(total_sum) from orders where sales_channel_id = sc.id ) from other_expenses
  			where expenses_id = 2) + -- считаем процент от продаж оплаченных менеджерам
  		(select SUM(total_sum) from customs_products_total where sales_channel_id = sc.id)) / -- считаем затраты на приобретение товаров 
  		(select count(order_id) from orders where sales_channel_id = sc.id)) as COGS,
  	((select count(order_id) from orders where sales_channel_id = sc.id)/
  		(select count(buyers) from unic_buyers where sales_channel_id = sc.id)) as APC,
  	value/total AS CR1,
  	applications/value AS CR2,
  	((select count(order_id) from orders where sales_channel_id = sc.id)/applications) AS CR3,
  	total_price
  	from sales_channel sc group by id order by id;
  	
  -- Представление показатели для расчета unit-экономики
  CREATE VIEW init_economy_rezult (id, name, rezult) as
  	select 
  	id,
  	name,
  	(user_acquisition * (((AvPrice - COGS) * APC) * CR1 * CR2 * CR3 - CPAcq)) as rezult
  	from init_economy;
  	
  -- Селект для расчета общей прибыли или убытка по предприятию
  SELECT @A := SUM(rezult) from init_economy_rezult; -- общая сумма дохода по всем каналам продаж
  SELECT @B := SUM(total_sum) from other_expenses where expenses_id = 1; -- сумма постоянных расходов other_expenses
  SELECT @C := SUM(total_sum) from customs_products where expenses_id = 1; -- сумма постоянных расходов из таблицы customs_products
  SELECT @profit := @A - (@B + @C) as PROFIT; -- финансовый результат