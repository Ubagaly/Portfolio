use unit_economy;

set foreign_key_checks = 1;
	
INSERT INTO orders_products (order_id,buyers_id,products_id,value,discount,sales_channel_id) VALUES
	 (1,1,2,1,0.1,1),
	 (1,1,3,2,0.1,1),
	 (1,1,4,1,0.1,1),
	 (2,2,5,1,0,1),
	 (3,3,6,2,0,1),
	 (3,3,7,3,0,1),
	 (4,4,8,1,0,1),
	 (5,5,9,2,0.05,1),
	 (6,6,10,3,0.08,1),
	 (6,6,11,4,0.08,1);
	
INSERT INTO orders_products (order_id,buyers_id,products_id,value,discount,sales_channel_id) VALUES
	 (7,7,12,1,0.1,2),
	 (7,7,13,2,0.1,1),
	 (7,7,14,1,0.1,2),
	 (8,8,15,1,0,1),
	 (8,8,16,2,0,3),
	 (9,9,16,3,0,1),
	 (9,9,17,1,0,4),
	 (9,9,19,2,0.05,1),
	 (9,9,20,3,0.08,5),
	 (10,10,21,4,0.08,1);
	
INSERT INTO orders_products (order_id,buyers_id,products_id,value,discount,sales_channel_id) VALUES
	 (11,11,22,1,0.1,1),
	 (11,11,23,2,0.1,1),
	 (11,11,24,1,0.1,2),
	 (12,12,25,1,0,1),
	 (13,13,26,2,0,3),
	 (13,13,27,3,0,1),
	 (14,14,27,1,0,3),
	 (15,15,29,2,0.05,1),
	 (16,16,30,3,0.08,2),
	 (16,16,31,4,0.08,1);
	 
INSERT INTO orders_products (order_id,buyers_id,products_id,value,discount,sales_channel_id) VALUES
	 (17,17,32,1,0.1,1),
	 (17,17,33,2,0.1,1),
	 (18,1,34,1,0.1,2),
	 (18,1,35,1,0,2),
	 (19,1,36,2,0,3),
	 (20,18,37,3,0,1),
	 (21,19,37,1,0,3),
	 (22,20,39,2,0.05,4),
	 (23,21,30,3,0.08,4),
	 (23,22,31,4,0.08,4);
	 
INSERT INTO orders_products (order_id,buyers_id,products_id,value,discount,sales_channel_id) VALUES
	 (24,23,7,1,0.1,1),
	 (24,23,9,2,0.1,1),
	 (24,23,14,1,0.1,2),
	 (25,1,15,1,0,2),
	 (25,1,26,2,0,3),
	 (26,24,17,3,0,1),
	 (27,24,3,1,0,3),
	 (28,24,2,2,0.05,4),
	 (29,25,4,3,0.08,4),
	 (29,25,11,1,0.08,4);
	 
INSERT INTO orders_products (order_id,buyers_id,products_id,value,discount,sales_channel_id) VALUES
	 (30,26,37,1,0.1,1),
	 (30,26,9,2,0.1,1),
	 (31,27,24,1,0.1,2),
	 (32,28,25,1,0,2),
	 (32,29,6,2,0,2),
	 (32,30,27,3,0,2),
	 (32,31,13,1,0,2),
	 (32,32,12,2,0.05,2),
	 (33,33,14,3,0.08,4),
	 (33,34,1,1,0.08,4);
	 
INSERT INTO orders_products (order_id,buyers_id,products_id,value,discount,sales_channel_id) VALUES
	 (34,35,7,1,0.1,1),
	 (34,35,8,2,0.1,1),
	 (35,36,6,1,0.1,2),
	 (35,36,5,1,0,2),
	 (35,36,16,2,0,2),
	 (36,37,30,3,0,1),
	 (37,38,18,1,0,2),
	 (37,38,20,2,0.05,2),
	 (38,39,34,3,0.08,3),
	 (39,40,1,21,0.08,4);
	 
INSERT INTO orders_products (order_id,buyers_id,products_id,value,discount,sales_channel_id) VALUES
	 (40,41,17,1,0.1,1),
	 (41,42,28,2,0.1,2),
	 (41,42,36,1,0.1,2),
	 (41,42,2,1,0,2),
	 (42,43,26,2,0,3),
	 (42,43,10,3,0,3),
	 (42,43,8,1,0,3),
	 (42,43,27,2,0.05,3),
	 (43,44,35,3,0.08,4),
	 (43,44,1,1,0.08,4);
	 
INSERT INTO orders_products (order_id,buyers_id,products_id,value,discount,sales_channel_id) VALUES
	 (44,45,11,1,0.1,5),
	 (44,45,18,2,0.1,5),
	 (45,46,16,1,0.1,2),
	 (45,46,12,1,0,2),
	 (45,46,9,2,0,2),
	 (46,47,13,3,0,1),
	 (46,47,4,1,0,1),
	 (46,47,40,2,0.05,1),
	 (47,48,25,3,0.08,4),
	 (47,48,15,1,0.08,4);
	 
INSERT INTO orders_products (order_id,buyers_id,products_id,value,discount,sales_channel_id) VALUES
	 (48,49,11,1,0.1,7),
	 (48,49,18,2,0.1,7),
	 (48,49,16,1,0.1,7),
	 (49,1,12,1,0,6),
	 (49,1,9,2,0,6),
	 (49,1,13,3,0,6),
	 (49,1,4,1,0,6),
	 (50,37,40,2,0.05,1),
	 (50,37,25,3,0.08,1),
	 (51,48,15,1,0.08,4);
	 
	-- -- -- 
INSERT INTO orders_products (order_id,buyers_id,products_id,value,discount,sales_channel_id) VALUES
	 (52,1,2,1,0.1,1),
	 (52,1,3,2,0.1,1),
	 (52,1,4,1,0.1,1),
	 (53,2,5,1,0,1),
	 (53,3,6,2,0,1),
	 (53,3,7,3,0,1),
	 (54,4,8,1,0,1),
	 (55,5,9,2,0.05,1),
	 (56,6,10,3,0.08,1),
	 (56,6,11,4,0.08,1);
	
INSERT INTO orders_products (order_id,buyers_id,products_id,value,discount,sales_channel_id) VALUES
	 (57,7,12,1,0.1,2),
	 (57,7,13,2,0.1,1),
	 (57,7,14,1,0.1,2),
	 (58,8,15,1,0,1),
	 (58,8,16,2,0,3),
	 (59,1,16,3,0,1),
	 (59,1,17,1,0,4),
	 (59,1,19,2,0.05,1),
	 (59,1,20,3,0.08,5),
	 (60,10,21,4,0.08,1);
	
INSERT INTO orders_products (order_id,buyers_id,products_id,value,discount,sales_channel_id) VALUES
	 (61,11,22,1,0.1,1),
	 (61,11,23,2,0.1,1),
	 (61,11,24,1,0.1,2),
	 (62,10,25,1,0,1),
	 (63,13,26,2,0,3),
	 (63,13,27,3,0,1),
	 (64,14,27,1,0,3),
	 (65,15,29,2,0.05,1),
	 (66,1,30,3,0.08,2),
	 (66,1,31,4,0.08,1);
	 
INSERT INTO orders_products (order_id,buyers_id,products_id,value,discount,sales_channel_id) VALUES
	 (67,17,32,1,0.1,1),
	 (67,17,33,2,0.1,1),
	 (68,1,34,1,0.1,2),
	 (68,1,35,1,0,2),
	 (69,1,36,2,0,3),
	 (70,18,37,3,0,1),
	 (71,19,37,1,0,3),
	 (72,20,39,2,0.05,4),
	 (73,21,30,3,0.08,4),
	 (73,22,31,4,0.08,4);
	 
INSERT INTO orders_products (order_id,buyers_id,products_id,value,discount,sales_channel_id) VALUES
	 (74,23,7,1,0.1,1),
	 (74,23,9,2,0.1,1),
	 (74,23,14,1,0.1,2),
	 (75,1,15,1,0,2),
	 (75,1,26,2,0,3),
	 (76,24,17,3,0,1),
	 (77,24,3,1,0,3),
	 (78,24,2,2,0.05,4),
	 (79,5,4,3,0.08,4),
	 (79,5,11,1,0.08,4);
	 
INSERT INTO orders_products (order_id,buyers_id,products_id,value,discount,sales_channel_id) VALUES
	 (80,26,37,1,0.1,1),
	 (80,26,9,2,0.1,1),
	 (81,27,24,1,0.1,2),
	 (82,28,25,1,0,2),
	 (82,29,6,2,0,2),
	 (82,30,27,3,0,2),
	 (82,10,13,1,0,2),
	 (82,32,12,2,0.05,2),
	 (83,33,14,3,0.08,4),
	 (83,34,1,1,0.08,4);
	 
INSERT INTO orders_products (order_id,buyers_id,products_id,value,discount,sales_channel_id) VALUES
	 (84,35,7,1,0.1,1),
	 (84,35,8,2,0.1,1),
	 (85,1,6,1,0.1,2),
	 (85,1,5,1,0,2),
	 (85,1,16,2,0,2),
	 (86,37,30,3,0,1),
	 (87,38,18,1,0,2),
	 (87,38,20,2,0.05,2),
	 (88,39,34,3,0.08,3),
	 (89,40,1,21,0.08,4);
	 
INSERT INTO orders_products (order_id,buyers_id,products_id,value,discount,sales_channel_id) VALUES
	 (90,41,17,1,0.1,1),
	 (91,42,28,2,0.1,2),
	 (91,42,36,1,0.1,2),
	 (91,42,2,1,0,2),
	 (92,43,26,2,0,3),
	 (92,43,10,3,0,3),
	 (92,43,8,1,0,3),
	 (92,43,27,2,0.05,3),
	 (93,44,35,3,0.08,4),
	 (93,44,1,1,0.08,4);
	 
INSERT INTO orders_products (order_id,buyers_id,products_id,value,discount,sales_channel_id) VALUES
	 (94,5,11,1,0.1,3),
	 (94,5,18,2,0.1,3),
	 (95,46,16,1,0.1,2),
	 (95,46,12,1,0,2),
	 (95,46,9,2,0,2),
	 (96,47,13,3,0,1),
	 (96,47,4,1,0,1),
	 (96,47,40,2,0.05,1),
	 (97,1,25,3,0.08,4),
	 (97,1,15,1,0.08,4);
	 
INSERT INTO orders_products (order_id,buyers_id,products_id,value,discount,sales_channel_id) VALUES
	 (98,49,11,1,0.1,2),
	 (98,49,18,2,0.1,2),
	 (98,49,16,1,0.1,2),
	 (99,1,12,1,0,1),
	 (99,1,9,2,0,1),
	 (99,1,13,3,0,1),
	 (99,1,4,1,0,6),
	 (100,37,40,2,0.05,1),
	 (100,37,25,3,0.08,1),
	 (100,37,15,1,0.08,1);