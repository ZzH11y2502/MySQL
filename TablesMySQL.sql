# Bài tập SQL 

CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `foods` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(200) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `foods_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like_res` (
  `like_res_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `date_like` datetime DEFAULT NULL,
  PRIMARY KEY (`like_res_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurants` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `code` varchar(200) DEFAULT NULL,
  `arr_sub_id` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `foods` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rate_res` (
  `rate_res_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` datetime DEFAULT NULL,
  PRIMARY KEY (`rate_res_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurants` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `restaurants` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(200) DEFAULT NULL,
  `Image` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(200) DEFAULT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `foods` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Italian');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(2, 'Japanese');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(3, 'Mexican');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(4, 'Chinese'),
(5, 'Indian'),
(6, 'French'),
(7, 'Thai'),
(8, 'Mediterranean'),
(9, 'American'),
(10, 'Vietnamese'),
(11, 'Korean'),
(12, 'Brazilian'),
(13, 'Greek'),
(14, 'Spanish'),
(15, 'Turkish'),
(16, 'Lebanese'),
(17, 'German'),
(18, 'Swedish'),
(19, 'African'),
(20, 'Russian'),
(21, 'Irish'),
(22, 'Portuguese'),
(23, 'Cuban'),
(24, 'Peruvian'),
(25, 'Argentinian'),
(26, 'Moroccan'),
(27, 'Filipino'),
(28, 'Indonesian'),
(29, 'Malaysian');

INSERT INTO `foods` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(1, 'Pasta Carbonara', 'pasta_carbonara.jpg', 13.99, 'Italian pasta with eggs, cheese, bacon, and black pepper.', 1);
INSERT INTO `foods` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(2, 'Tempura Udon', 'tempura_udon.jpg', 18.99, 'Japanese udon noodle soup with tempura shrimp and vegetables.', 2);
INSERT INTO `foods` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(3, 'Enchiladas', 'enchiladas.jpg', 14.99, 'Mexican dish with rolled tortillas filled with meat and topped with sauce.', 3);
INSERT INTO `foods` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(4, 'Kung Pao Chicken', 'kung_pao_chicken.jpg', 16.99, 'Chinese stir-fried chicken with peanuts, vegetables, and chili peppers.', 4),
(5, 'Paneer Tikka', 'paneer_tikka.jpg', 12.99, 'Indian dish with marinated and grilled paneer cheese.', 5),
(6, 'Ratatouille', 'ratatouille.jpg', 15.99, 'French Provençal stewed vegetable dish with herbs and olive oil.', 6),
(7, 'Green Curry', 'green_curry.jpg', 17.99, 'Thai curry with green chili, coconut milk, meat, and vegetables.', 7),
(8, 'Caprese Salad', 'caprese_salad.jpg', 10.99, 'Italian salad with tomatoes, fresh mozzarella, basil, and balsamic glaze.', 8),
(9, 'BBQ Bacon Burger', 'bbq_bacon_burger.jpg', 13.99, 'American burger with bacon, barbecue sauce, and cheddar cheese.', 9),
(10, 'Bun Cha', 'bun_cha.jpg', 11.99, 'Vietnamese dish with grilled pork, noodles, and dipping sauce.', 10),
(11, 'Kimchi Fried Rice', 'kimchi_fried_rice.jpg', 12.99, 'Korean fried rice with kimchi, vegetables, and often meat.', 11),
(12, 'Feijoada', 'feijoada.jpg', 18.99, 'Brazilian black bean stew with pork and sausages.', 12),
(13, 'Greek Moussaka', 'greek_moussaka.jpg', 20.99, 'Greek baked casserole with eggplant, minced meat, and béchamel sauce.', 13),
(14, 'Paella', 'paella.jpg', 22.99, 'Spanish saffron-infused rice dish with seafood, chicken, and rabbit.', 14),
(15, 'Doner Kebab', 'doner_kebab.jpg', 10.99, 'Turkish street food with seasoned meat, salad, and yogurt sauce.', 15),
(16, 'Falafel Wrap', 'falafel_wrap.jpg', 8.99, 'Lebanese wrap with falafel, veggies, and tahini sauce.', 16),
(17, 'Bratwurst with Sauerkraut', 'bratwurst_with_sauerkraut.jpg', 14.99, 'German sausage with fermented cabbage and mustard.', 17),
(18, 'Swedish Meatballs', 'swedish_meatballs.jpg', 12.99, 'Swedish-style meatballs with lingonberry sauce and potatoes.', 18),
(19, 'Jollof Rice', 'jollof_rice.jpg', 15.99, 'African one-pot rice dish with tomatoes, peppers, and spices.', 19),
(20, 'Beef Stroganoff', 'beef_stroganoff.jpg', 17.99, 'Russian dish with sautéed beef in a creamy mushroom sauce.', 20),
(21, 'Irish Stew', 'irish_stew.jpg', 16.99, 'Traditional Irish lamb stew with potatoes and vegetables.', 21),
(22, 'Bacalhau à Brás', 'bacalhau_a_bras.jpg', 19.99, 'Portuguese salted cod dish with eggs, onions, and potatoes.', 22),
(23, 'Ropa Vieja', 'ropa_vieja.jpg', 14.99, 'Cuban shredded beef stew with tomatoes, peppers, and onions.', 23),
(24, 'Ceviche', 'ceviche.jpg', 13.99, 'Peruvian dish of marinated raw fish or seafood with lime and chili.', 24),
(25, 'Empanadas', 'empanadas.jpg', 10.99, 'Argentinian pastries filled with meat, cheese, or vegetables.', 25),
(26, 'Tagine', 'tagine.jpg', 18.99, 'Moroccan slow-cooked stew with meat, dried fruits, and spices.', 26),
(27, 'Adobo', 'adobo.jpg', 15.99, 'Filipino dish of marinated and braised meat, often pork or chicken.', 27),
(28, 'Nasi Goreng', 'nasi_goreng.jpg', 11.99, 'Indonesian fried rice with prawns, chicken, and a sweet soy sauce.', 28),
(29, 'Nasi Lemak', 'nasi_lemak.jpg', 12.99, 'Malaysian fragrant rice dish with anchovies, peanuts, and boiled eggs.', 29);

INSERT INTO `like_res` (`like_res_id`, `user_id`, `res_id`, `date_like`) VALUES
(1, 1, 1, '2023-04-01 12:00:00');
INSERT INTO `like_res` (`like_res_id`, `user_id`, `res_id`, `date_like`) VALUES
(2, 2, 2, '2023-04-02 14:30:00');
INSERT INTO `like_res` (`like_res_id`, `user_id`, `res_id`, `date_like`) VALUES
(3, 2, 3, '2023-04-03 16:45:00');
INSERT INTO `like_res` (`like_res_id`, `user_id`, `res_id`, `date_like`) VALUES
(4, 48, 4, '2023-04-04 18:20:00'),
(5, 31, 5, '2023-04-05 20:10:00'),
(6, 10, 6, '2023-04-06 22:05:00'),
(7, 42, 7, '2023-04-07 10:30:00'),
(8, 8, 8, '2023-04-08 12:15:00'),
(9, 10, 9, '2023-04-09 14:40:00'),
(10, 10, 10, '2023-04-10 16:55:00'),
(11, 18, 11, '2023-04-11 18:30:00'),
(12, 12, 12, '2023-04-12 20:45:00'),
(13, 13, 13, '2023-04-13 22:20:00'),
(14, 14, 14, '2023-04-14 11:10:00'),
(15, 49, 15, '2023-04-15 13:25:00'),
(16, 16, 16, '2023-04-16 15:15:00'),
(17, 17, 17, '2023-04-17 17:30:00'),
(18, 22, 18, '2023-04-18 19:45:00'),
(19, 19, 19, '2023-04-19 21:20:00'),
(20, 20, 10, '2023-04-20 10:05:00'),
(21, 21, 21, '2023-05-01 12:00:00'),
(22, 22, 22, '2023-05-02 14:30:00'),
(23, 50, 7, '2023-05-03 16:45:00'),
(24, 24, 42, '2023-05-04 18:20:00'),
(25, 25, 43, '2023-05-05 20:10:00'),
(26, 26, 7, '2023-05-06 22:05:00'),
(27, 27, 27, '2023-05-07 10:30:00'),
(28, 28, 28, '2023-05-08 12:15:00'),
(29, 29, 29, '2023-05-09 14:40:00'),
(30, 30, 9, '2023-05-10 16:55:00'),
(31, 31, 15, '2023-05-11 18:30:00'),
(32, 32, 48, '2023-05-12 20:45:00'),
(33, 33, 33, '2023-05-13 22:20:00'),
(34, 34, 6, '2023-05-14 11:10:00'),
(35, 35, 35, '2023-05-15 13:25:00'),
(36, 36, 50, '2023-05-16 15:15:00'),
(37, 33, 37, '2023-05-17 17:30:00'),
(38, 38, 44, '2023-05-18 19:45:00'),
(39, 5, 39, '2023-05-19 21:20:00'),
(40, 40, 40, '2023-05-20 10:05:00');

INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 1, 1, 2, 'ORD123', 'SUB123');
INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(2, 2, 2, 1, 'ORD124', 'SUB124');
INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(3, 3, 3, 3, 'ORD125', 'SUB125');
INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(4, 4, 4, 2, 'ORD126', 'SUB126'),
(5, 8, 5, 1, 'ORD127', 'SUB127'),
(6, 10, 6, 4, 'ORD128', 'SUB128'),
(7, 40, 7, 2, 'ORD129', 'SUB129'),
(8, 50, 8, 3, 'ORD130', 'SUB130'),
(9, 9, 9, 1, 'ORD131', 'SUB131'),
(10, 9, 10, 2, 'ORD132', 'SUB132'),
(11, 10, 11, 1, 'ORD133', 'SUB133'),
(12, 12, 12, 3, 'ORD134', 'SUB134'),
(13, 13, 13, 2, 'ORD135', 'SUB135'),
(14, 14, 14, 4, 'ORD136', 'SUB136'),
(15, 15, 15, 1, 'ORD137', 'SUB137'),
(16, 16, 16, 3, 'ORD138', 'SUB138'),
(17, 17, 17, 2, 'ORD139', 'SUB139'),
(18, 18, 18, 1, 'ORD140', 'SUB140'),
(19, 19, 19, 4, 'ORD141', 'SUB141'),
(20, 20, 20, 2, 'ORD142', 'SUB142'),
(21, 9, 21, 3, 'ORD143', 'SUB143'),
(22, 22, 22, 1, 'ORD144', 'SUB144'),
(23, 23, 23, 2, 'ORD145', 'SUB145'),
(24, 8, 24, 4, 'ORD146', 'SUB146'),
(25, 25, 25, 1, 'ORD147', 'SUB147'),
(26, 26, 26, 3, 'ORD148', 'SUB148'),
(27, 10, 27, 2, 'ORD149', 'SUB149'),
(28, 28, 28, 1, 'ORD150', 'SUB150'),
(29, 29, 29, 4, 'ORD151', 'SUB151'),
(30, 30, 1, 2, 'ORD152', 'SUB152'),
(31, 31, 2, 3, 'ORD153', 'SUB153'),
(32, 9, 3, 1, 'ORD154', 'SUB154'),
(33, 33, 4, 2, 'ORD155', 'SUB155'),
(34, 34, 5, 1, 'ORD156', 'SUB156'),
(35, 35, 6, 4, 'ORD157', 'SUB157'),
(36, 36, 7, 2, 'ORD158', 'SUB158'),
(37, 37, 8, 3, 'ORD159', 'SUB159'),
(38, 38, 9, 1, 'ORD160', 'SUB160'),
(39, 39, 10, 2, 'ORD161', 'SUB161'),
(40, 40, 11, 4, 'ORD162', 'SUB162'),
(41, 41, 12, 2, 'ORD163', 'SUB163'),
(42, 42, 13, 1, 'ORD164', 'SUB164'),
(43, 43, 14, 3, 'ORD165', 'SUB165'),
(44, 44, 15, 2, 'ORD166', 'SUB166'),
(45, 45, 16, 1, 'ORD167', 'SUB167'),
(46, 46, 17, 4, 'ORD168', 'SUB168'),
(47, 47, 18, 2, 'ORD169', 'SUB169'),
(48, 48, 19, 3, 'ORD170', 'SUB170'),
(49, 49, 20, 1, 'ORD171', 'SUB171'),
(50, 50, 21, 2, 'ORD172', 'SUB172'),
(51, NULL, NULL, NULL, NULL, NULL),
(52, 10, 1, 2, 'ORD15', 'SUB152');

INSERT INTO `rate_res` (`rate_res_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 1, 9, 5, '2023-03-01 12:00:00');
INSERT INTO `rate_res` (`rate_res_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(2, 38, 2, 4, '2023-03-02 14:30:00');
INSERT INTO `rate_res` (`rate_res_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(3, 49, 10, 3, '2023-03-03 16:45:00');
INSERT INTO `rate_res` (`rate_res_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(4, 4, 4, 5, '2023-03-04 18:20:00'),
(5, 5, 5, 4, '2023-03-05 20:10:00'),
(6, 6, 9, 3, '2023-03-06 22:05:00'),
(7, 7, 7, 5, '2023-03-07 10:30:00'),
(8, 8, 8, 4, '2023-03-08 12:15:00'),
(9, 9, 9, 3, '2023-03-09 14:40:00'),
(10, 33, 10, 5, '2023-03-10 16:55:00'),
(11, 33, 5, 4, '2023-03-11 18:30:00'),
(12, 12, 12, 3, '2023-03-12 20:45:00'),
(13, 13, 13, 5, '2023-03-13 22:20:00'),
(14, 14, 14, 4, '2023-03-14 11:10:00'),
(15, 15, 15, 3, '2023-03-15 13:25:00'),
(16, 16, 16, 1, '2023-03-16 15:15:00'),
(17, 17, 47, 2, '2023-03-17 17:30:00'),
(18, 18, 18, 3, '2023-03-18 19:45:00'),
(19, 31, 19, 4, '2023-03-19 21:20:00'),
(20, 20, 36, 5, '2023-03-20 10:05:00'),
(21, 21, 21, 1, '2023-03-21 12:30:00'),
(22, 22, 22, 2, '2023-03-22 14:45:00'),
(23, 23, 1, 3, '2023-03-23 16:20:00'),
(24, 24, 24, 4, '2023-03-24 18:30:00'),
(25, 25, 25, 5, '2023-03-25 20:45:00'),
(26, 26, 1, 1, '2023-03-26 12:00:00'),
(27, 27, 2, 2, '2023-03-27 14:30:00'),
(28, 28, 9, 3, '2023-03-28 16:45:00'),
(29, 2, 4, 4, '2023-03-29 18:20:00'),
(30, 25, 5, 5, '2023-03-30 20:10:00'),
(31, 10, 1, 2, '2024-03-05 13:10:00');

INSERT INTO `restaurants` (`res_id`, `res_name`, `Image`, `description`) VALUES
(1, 'Restaurant 1', 'image1.jpg', 'Description 1');
INSERT INTO `restaurants` (`res_id`, `res_name`, `Image`, `description`) VALUES
(2, 'Restaurant 2', 'image2.jpg', 'Description 2');
INSERT INTO `restaurants` (`res_id`, `res_name`, `Image`, `description`) VALUES
(3, 'Restaurant 3', 'image3.jpg', 'Description 3');
INSERT INTO `restaurants` (`res_id`, `res_name`, `Image`, `description`) VALUES
(4, 'Restaurant 4', 'image4.jpg', 'Description 4'),
(5, 'Restaurant 5', 'image5.jpg', 'Description 5'),
(6, 'Restaurant 6', 'image6.jpg', 'Description 6'),
(7, 'Restaurant 7', 'image7.jpg', 'Description 7'),
(8, 'Restaurant 8', 'image8.jpg', 'Description 8'),
(9, 'Restaurant 9', 'image9.jpg', 'Description 9'),
(10, 'Restaurant 10', 'image10.jpg', 'Description 10'),
(11, 'Restaurant 11', 'image11.jpg', 'Description 11'),
(12, 'Restaurant 12', 'image12.jpg', 'Description 12'),
(13, 'Restaurant 13', 'image13.jpg', 'Description 13'),
(14, 'Restaurant 14', 'image14.jpg', 'Description 14'),
(15, 'Restaurant 15', 'image15.jpg', 'Description 15'),
(16, 'Restaurant 16', 'image16.jpg', 'Description 16'),
(17, 'Restaurant 17', 'image17.jpg', 'Description 17'),
(18, 'Restaurant 18', 'image18.jpg', 'Description 18'),
(19, 'Restaurant 19', 'image19.jpg', 'Description 19'),
(20, 'Restaurant 20', 'image20.jpg', 'Description 20'),
(21, 'Restaurant 21', 'image21.jpg', 'Description 21'),
(22, 'Restaurant 22', 'image22.jpg', 'Description 22'),
(23, 'Restaurant 23', 'image23.jpg', 'Description 23'),
(24, 'Restaurant 24', 'image24.jpg', 'Description 24'),
(25, 'Restaurant 25', 'image25.jpg', 'Description 25'),
(26, 'Restaurant 26', 'image26.jpg', 'Description 26'),
(27, 'Restaurant 27', 'image27.jpg', 'Description 27'),
(28, 'Restaurant 28', 'image28.jpg', 'Description 28'),
(29, 'Restaurant 29', 'image29.jpg', 'Description 29'),
(30, 'Restaurant 30', 'image30.jpg', 'Description 30'),
(31, 'Restaurant 31', 'image31.jpg', 'Description 31'),
(32, 'Restaurant 32', 'image32.jpg', 'Description 32'),
(33, 'Restaurant 33', 'image33.jpg', 'Description 33'),
(34, 'Restaurant 34', 'image34.jpg', 'Description 34'),
(35, 'Restaurant 35', 'image35.jpg', 'Description 35'),
(36, 'Restaurant 36', 'image36.jpg', 'Description 36'),
(37, 'Restaurant 37', 'image37.jpg', 'Description 37'),
(38, 'Restaurant 38', 'image38.jpg', 'Description 38'),
(39, 'Restaurant 39', 'image39.jpg', 'Description 39'),
(40, 'Restaurant 40', 'image40.jpg', 'Description 40'),
(41, 'Restaurant 41', 'image41.jpg', 'Description 41'),
(42, 'Restaurant 42', 'image42.jpg', 'Description 42'),
(43, 'Restaurant 43', 'image43.jpg', 'Description 43'),
(44, 'Restaurant 44', 'image44.jpg', 'Description 44'),
(45, 'Restaurant 45', 'image45.jpg', 'Description 45'),
(46, 'Restaurant 46', 'image46.jpg', 'Description 46'),
(47, 'Restaurant 47', 'image47.jpg', 'Description 47'),
(48, 'Restaurant 48', 'image48.jpg', 'Description 48'),
(49, 'Restaurant 49', 'image49.jpg', 'Description 49'),
(50, 'Restaurant 50', 'image50.jpg', 'Description 50');

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(1, 'Extra Cheese', 1.99, 1);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(2, 'Gluten-Free Option', 2.5, 2);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(3, 'Spicy Level 1', 0.5, 3);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(4, 'Double Tempura', 3.99, 4),
(5, 'Extra Enchilada Sauce', 1.25, 5),
(6, 'Guacamole Side', 2.99, 6),
(7, 'Extra Peanuts', 0.75, 7),
(8, 'Vegetarian Option', 2.99, 8),
(9, 'Paneer Lover\'s Delight', 3.5, 9),
(10, 'Extra Ratatouille Sauce', 1.75, 10),
(11, 'Brown Rice Option', 1.25, 11),
(12, 'Extra Lemongrass', 0.99, 12),
(13, 'Extra Basil', 0.5, 13),
(14, 'Spicy Level 2', 1.5, 14),
(15, 'Add Bacon', 1.99, 15),
(16, 'Sweet Potato Fries', 2.5, 16),
(17, 'Extra Fish Sauce', 0.75, 17),
(18, 'Vegetarian Option', 2.99, 18),
(19, 'Extra Kimchi', 1.25, 19),
(20, 'Double Feijoada Sauce', 3.99, 20),
(21, 'Extra Tzatziki', 1.75, 21),
(22, 'Pineapple Fried Rice', 2.99, 22),
(23, 'Extra Lingonberry Sauce', 0.99, 23),
(24, 'Double Meat', 1.5, 24),
(25, 'Extra Tomato Sauce', 1.99, 25),
(26, 'Vegetarian Option', 2.5, 26),
(27, 'Add Saffron', 1.25, 27),
(28, 'Extra Rabbit', 3.99, 28),
(29, 'Spicy Yogurt Sauce', 0.75, 29);

INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(1, 'John Doe', 'john.doe@example.com', 'password1');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(2, 'Jane Smith', 'jane.smith@example.com', 'password2');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(3, 'Bob Johnson', 'bob.johnson@example.com', 'password3');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(4, 'Alice Williams', 'alice.williams@example.com', 'password4'),
(5, 'Charlie Brown', 'charlie.brown@example.com', 'password5'),
(6, 'David Miller', 'david.miller@example.com', 'password6'),
(7, 'Eva Davis', 'eva.davis@example.com', 'password7'),
(8, 'Frank White', 'frank.white@example.com', 'password8'),
(9, 'Grace Martin', 'grace.martin@example.com', 'password9'),
(10, 'Henry Wilson', 'henry.wilson@example.com', 'password10'),
(11, 'Ivy Harris', 'ivy.harris@example.com', 'password11'),
(12, 'Jack Turner', 'jack.turner@example.com', 'password12'),
(13, 'Karen Carter', 'karen.carter@example.com', 'password13'),
(14, 'Leo Taylor', 'leo.taylor@example.com', 'password14'),
(15, 'Mia Evans', 'mia.evans@example.com', 'password15'),
(16, 'Nathan Moore', 'nathan.moore@example.com', 'password16'),
(17, 'Olivia Johnson', 'olivia.johnson@example.com', 'password17'),
(18, 'Peter Smith', 'peter.smith@example.com', 'password18'),
(19, 'Quinn Davis', 'quinn.davis@example.com', 'password19'),
(20, 'Rachel Brown', 'rachel.brown@example.com', 'password20'),
(21, 'Samuel Wilson', 'samuel.wilson@example.com', 'password21'),
(22, 'Tina Miller', 'tina.miller@example.com', 'password22'),
(23, 'Ulysses Jackson', 'ulysses.jackson@example.com', 'password23'),
(24, 'Victoria Harris', 'victoria.harris@example.com', 'password24'),
(25, 'Walter Turner', 'walter.turner@example.com', 'password25'),
(26, 'Xena White', 'xena.white@example.com', 'password26'),
(27, 'Yasmine Evans', 'yasmine.evans@example.com', 'password27'),
(28, 'Zack Davis', 'zack.davis@example.com', 'password28'),
(29, 'Amy Johnson', 'amy.johnson@example.com', 'password29'),
(30, 'Benjamin Miller', 'benjamin.miller@example.com', 'password30'),
(31, 'Cathy Wilson', 'cathy.wilson@example.com', 'password31'),
(32, 'Daniel Harris', 'daniel.harris@example.com', 'password32'),
(33, 'Emily Turner', 'emily.turner@example.com', 'password33'),
(34, 'Frankie White', 'frankie.white@example.com', 'password34'),
(35, 'George Evans', 'george.evans@example.com', 'password35'),
(36, 'Holly Davis', 'holly.davis@example.com', 'password36'),
(37, 'Isaac Smith', 'isaac.smith@example.com', 'password37'),
(38, 'Julia Johnson', 'julia.johnson@example.com', 'password38'),
(39, 'Kyle Martin', 'kyle.martin@example.com', 'password39'),
(40, 'Lily Taylor', 'lily.taylor@example.com', 'password40'),
(41, 'Milo Moore', 'milo.moore@example.com', 'password41'),
(42, 'Nina Harris', 'nina.harris@example.com', 'password42'),
(43, 'Oscar Wilson', 'oscar.wilson@example.com', 'password43'),
(44, 'Penelope Davis', 'penelope.davis@example.com', 'password44'),
(45, 'Quincy Turner', 'quincy.turner@example.com', 'password45'),
(46, 'Ruby White', 'ruby.white@example.com', 'password46'),
(47, 'Samuel Jackson', 'samuel.jackson@example.com', 'password47'),
(48, 'Tessa Evans', 'tessa.evans@example.com', 'password48'),
(49, 'Uriah Smith', 'uriah.smith@example.com', 'password49'),
(50, 'Violet Harris', 'violet.harris@example.com', 'password50');


