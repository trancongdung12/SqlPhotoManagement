drop database  if exists db_banhang;
create database db_banhang;
use db_banhang;
CREATE TABLE `users` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50) ,
  `username` varchar(50) ,
  `password` varchar(50) ,
  `amount` bigint ,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
);
CREATE TABLE `categories` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50) ,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
);
CREATE TABLE `products` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50) ,
  `price` bigint ,
  `quantity` int,
  `id_category` int,
  FOREIGN KEY (id_category) REFERENCES categories(id) ON DELETE CASCADE,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
);
CREATE TABLE `product_descriptions` (
  `id_product` int PRIMARY KEY ,
  `content` varchar(255) ,
  FOREIGN KEY (id_product) REFERENCES products(id) ON DELETE CASCADE,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
);
CREATE TABLE `carts` (
  `id_product` int ,
  `id_user` int ,
  `quantity` int ,
  PRIMARY KEY(id_product,id_user),
  FOREIGN KEY (id_product) REFERENCES products(id) ON DELETE CASCADE,
  FOREIGN KEY (id_user) REFERENCES users(id) ON DELETE CASCADE,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
);



