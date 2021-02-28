use unit_economy;


-- Триггер для заполнения total_sum в таблице customs_products.

DELIMITER //
create trigger auto_update_total_sum_on_insert BEFORE insert on customs_products
	for each row 
	begin
		set new.total_sum = new.value * new.purchase_price;
	end//
	
DELIMITER ;

DELIMITER //
create trigger auto_update_total_sum_on_update BEFORE update on customs_products
	for each row 
	begin
		set new.total_sum = new.value * new.purchase_price;
	end//
	
DELIMITER ;

 -- Триггер для изменения остатка товара на складе initial_balance в таблице products при покупки товаров.
DELIMITER //
create trigger update_initial_balance after insert on customs_products
	for each row 
	begin
		update products 
		set initial_balance = initial_balance + new.value
		where id = new.products_id;
	end//
	
DELIMITER ;

-- Триггер для изменения остатка товара на складе initial_balance в таблице products при продаже товаров.
DELIMITER //
create trigger update_initial_balance_orders after insert on orders_products
	for each row 
	begin
		update products 
		set initial_balance = initial_balance - new.value
		where id = new.products_id;
	end//
	
DELIMITER ;

-- Триггер для изменения цены закупки товара purchase_price в таблице products при покупки товаров.
DELIMITER //
create trigger update_purchase_price after insert on customs_products
	for each row 
	begin
		update products 
		set purchase_price = new.purchase_price
		where id = new.products_id;
	end//
	
DELIMITER ;

-- Триггер для изменения цены продажи товара sale_price в таблице products при покупки товаров.
DELIMITER //
create trigger update_sale_price after insert on customs_products
	for each row 
	begin
		update products 
		set sale_price = new.purchase_price * 1.25
		where id = new.products_id;
	end//
	
DELIMITER ;

-- Триггер для заполнения total_sum в таблице orders_products.

DELIMITER //
create trigger auto_update_total_sum_on_orders BEFORE insert on orders_products
	for each row 
	begin
		set new.total_sum = new.value * new.sale_price-new.value * new.sale_price * new.discount;
	end//
	
DELIMITER ;

-- Триггер для заполнения цены продажи sale_price в таблице orders_products.

DELIMITER //
create trigger auto_update_sales_price_on_orders BEFORE insert on orders_products
	for each row 
	begin
		DECLARE cat_sale_price DECIMAL (11,2);
        SELECT sale_price into cat_sale_price FROM products where id = new.products_id;
		set new.sale_price = cat_sale_price;
	end//
	
DELIMITER ;

-- Триггер для заполнения total_sum в таблице orders_products.

DELIMITER //
create trigger auto_update_total_sum_on_orders BEFORE insert on orders_products
	for each row 
	begin
		set new.total_sum = new.value * new.sale_price-new.value * new.sale_price * new.discount;
	end//
	
DELIMITER ;

drop trigger auto_update_total_sum_on_orders;