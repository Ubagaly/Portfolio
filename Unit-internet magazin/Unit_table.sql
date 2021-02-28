create database unit_economy;
use unit_economy;

DROP TABLE IF EXISTS sales_channel;
CREATE TABLE sales_channel  (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название канала',
  total INT COMMENT 'Количество потенциальных покупателей',
  value INT DEFAULT NULL COMMENT 'Количество покупателей, которые откликнулись на рекламу',
  applications INT DEFAULT NULL COMMENT 'Количество заявок',
  total_price DECIMAL (11,2) DEFAULT NULL COMMENT 'Цена привлечения одного потенциального покупателя ',
  UNIQUE unique_name(name(10)),
  index (total_price)
 )COMMENT = 'Каналы продаж';

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название раздела',
  UNIQUE unique_name(name(10))
) COMMENT = 'Разделы интернет-магазина';

DROP TABLE IF EXISTS type_products;
CREATE TABLE type_products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Наименование типа продукта',
  UNIQUE unique_name(name(10))
) COMMENT = 'Типы продукта';

DROP TABLE IF EXISTS field_activity;
CREATE TABLE field_activity (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Нзвание сферы деятельности',
  UNIQUE unique_name(name(10))
) COMMENT = 'Сфера деятельности';

DROP TABLE IF EXISTS pattern_ownership;
CREATE TABLE pattern_ownership (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Форма собственности',
  UNIQUE unique_name(name(10))
) COMMENT = 'Форма собственности';
 
DROP TABLE IF EXISTS expenses;
CREATE TABLE expenses (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Вид расхода',
  UNIQUE unique_name(name(10))
) COMMENT = 'Вид расхода';

DROP TABLE IF EXISTS buyers;
CREATE TABLE buyers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  pattern_ownership_id bigint UNSIGNED DEFAULT NULL COMMENT 'Форма собственности',
  email varchar(120) DEFAULT NULL,
  phone bigint DEFAULT NULL,
  address VARCHAR(500) DEFAULT NULL,
  ИНН bigint DEFAULT NULL,
  ОГРН bigint DEFAULT NULL,
  вank_details VARCHAR(500) DEFAULT NULL COMMENT 'Реквизиты банка',
  field_activity_id bigint UNSIGNED DEFAULT NULL COMMENT 'Сфера деятельности',
  director VARCHAR(255) DEFAULT NULL COMMENT 'Руководитель',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  index(phone),
  UNIQUE unique_name(name(10)),
  index (ИНН),
  index (ОГРН),
  foreign key (pattern_ownership_id) references pattern_ownership (id),
  foreign key (field_activity_id) references field_activity (id)
) COMMENT = 'Покупатели';

DROP TABLE IF EXISTS provider;
CREATE TABLE provider (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Наименование поставщика',
  pattern_ownership_id bigint UNSIGNED DEFAULT NULL COMMENT 'Форма собственности',
  email varchar(120) DEFAULT NULL,
  phone bigint DEFAULT NULL,
  address VARCHAR(500) DEFAULT NULL,
  ИНН bigint DEFAULT NULL,
  ОГРН bigint DEFAULT NULL,
  вank_details VARCHAR(500) DEFAULT NULL COMMENT 'Реквизиты банка',
  director VARCHAR(255) DEFAULT NULL COMMENT 'Руководитель',
  delivery_method INT default 0 COMMENT 'Способ доставки: есть доставка -1, самовывоз - 0',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE key unique_name(name(10)),
  index(phone),
  index (ИНН),
  foreign key (pattern_ownership_id) references pattern_ownership (id)
) COMMENT = 'Поставщики';

DROP TABLE IF EXISTS products;
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название',
  initial_balance bigint DEFAULT NULL COMMENT 'Начальный остаток',
  provider_id bigint UNSIGNED COMMENT 'Поставщик товара',
  sale_price DECIMAL (11,2) COMMENT 'Цена продажи',
  purchase_price DECIMAL (11,2) COMMENT 'Цена покупки',
  catalogs_id bigint UNSIGNED COMMENT 'Катеория товара',
  type_products_id bigint UNSIGNED COMMENT 'Вид товара',
  unit VARCHAR(10) COMMENT 'Единица измерения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE key unique_name(name(10)),
  index(provider_id),
  index(catalogs_id),
  index(type_products_id),
  foreign key (type_products_id) references type_products (id),
  foreign key (catalogs_id) references catalogs (id),
  foreign key (provider_id) references provider (id)
) COMMENT = 'Товарные позиции';

DROP TABLE IF EXISTS orders_products;
CREATE TABLE orders_products (
  id SERIAL PRIMARY KEY,
  order_id bigint UNSIGNED COMMENT 'Номер реализации',
  buyers_id bigint UNSIGNED COMMENT 'Наименование покупателя',
  products_id bigint UNSIGNED COMMENT 'Наименование товара',
  value bigint DEFAULT 1 COMMENT 'Количество заказанных товарных позиций',
  sale_price DECIMAL (11,2) COMMENT 'Цена товара',
  discount DECIMAL (11,2) COMMENT 'Скидка в процентах',
  total_sum DECIMAL (11,2) COMMENT 'Общая сумма по товару',
  sales_channel_id bigint UNSIGNED COMMENT 'Канал продаж',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  index(order_id),
  index (buyers_id),
  index(products_id),
  foreign key (products_id) references products (id),
  foreign key (buyers_id) references buyers (id),
  foreign key (sales_channel_id) references sales_channel (id)
) COMMENT = 'Состав реализации';

DROP TABLE IF EXISTS customs_products;
CREATE TABLE customs_products (
  id SERIAL PRIMARY KEY,
  numbers bigint COMMENT 'Номер поступления',
  provider_id bigint UNSIGNED COMMENT 'Наименование поставщика',
  products_id bigint UNSIGNED COMMENT 'Наименование товара',
  value bigint DEFAULT 1 COMMENT 'Количество заказанных товарных позиций',
  purchase_price DECIMAL (11,2) COMMENT 'Цена закупки',
  total_sum DECIMAL (11,2) COMMENT 'Общая сумма по товару',
  expenses_id bigint UNSIGNED COMMENT 'Вид расхода',
  create_data DATETIME COMMENT 'Входящая дата',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  index(numbers),
  index (provider_id),
  index(products_id),
  foreign key (expenses_id) references expenses (id),
  foreign key (products_id) references products (id),
  foreign key (provider_id) references provider (id)
) COMMENT = 'Состав закупки';


DROP TABLE IF EXISTS other_expenses;
CREATE TABLE other_expenses (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Наименование расхода',
  total_sum DECIMAL (11,2) COMMENT 'Сумма расхода',
  expenses_id bigint UNSIGNED COMMENT 'Вид расхода',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  foreign key (expenses_id) references expenses (id),
  UNIQUE key unique_name(name(10))
) COMMENT = 'Прочие расходы';

-- Сделаю как представление
-- DROP TABLE IF EXISTS order_ buyers;
-- CREATE TABLE order_ buyers  (
  -- id_order_id SERIAL PRIMARY KEY,
  -- buyers_id INT,
 -- total_sum DECIMAL (11,2) COMMENT 'Общая сумма продажи',
  -- sales_channel_id INT COMMENT 'Канал продаж',
  -- created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  -- index (sales_channel _id),
  -- index (buyers_id),
  -- foreign key (sales_channel_id) references sales_channel (id),
  -- foreign key (buyers_id) references buyers (id),
   -- foreign key (id_order_id) references orders_products (order_id) -- Пожалуйста проверьте верно ли!!!
 -- ) COMMENT = 'Заказы';


