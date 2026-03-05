# CREATE DATABASE day_46;

# use day_46;

-- Tạo bảng customers
# create table customers
# (
#     id         int auto_increment
#         primary key,
#     full_name  varchar(100) null,
#     email      varchar(100) null,
#     city       varchar(100) null,
#     created_at timestamp    null,
#     updated_at timestamp    null
# )
#     collate = utf8mb4_unicode_ci;

-- Tạo bảng orders
# create table orders
# (
#     id           int auto_increment
#         primary key,
#     customer_id  int            null,
#     order_date   date           null,
#     total_amount decimal(12, 2) null,
#     created_at   timestamp      null,
#     updated_at   timestamp      null,
#     constraint orders_customers_id_fk
#         foreign key (customer_id) references customers (id)
# )
#     collate = utf8mb4_unicode_ci;

-- Tạo bảng orders_items
# create table order_items
# (
#     id           int auto_increment
#         primary key,
#     order_id     int            null,
#     product_name varchar(100)   null,
#     quantity     int            null,
#     price        decimal(10, 2) null,
#     created_at   timestamp      null,
#     updated_at   timestamp      null,
#     constraint order_items_orders_id_fk
#         foreign key (order_id) references orders (id)
# )
#     collate = utf8mb4_unicode_ci;

-- Dữ liệu bảng customers
# INSERT INTO customers (full_name, email, city, created_at, updated_at) VALUES
# ('Quang Trung','quangtrung@gmail.com','Đà Nẵng','2026-03-03 21:50:01','2026-03-03 21:50:02'),
# ('Văn Sơn','vanson@gmail.com','Hà Nội','2026-03-03 20:47:57','2026-03-03 20:47:59'),
# ('Văn An','vanan@gmail.com','HCM','2026-03-03 20:48:23','2026-03-03 20:48:24'),
# ('Minh Khang','minhkhang@gmail.com','Quảng Ngãi','2026-03-03 20:49:30','2026-03-03 20:49:31'),
# ('Hoàng Việt','hoangviet@gmail.com','Đà Lạt','2026-03-03 20:50:02','2026-03-03 20:50:03');

-- Dữ liệu bảng orders
# INSERT INTO orders (customer_id, order_date, total_amount, created_at, updated_at) VALUES
# (2,'2026-03-03',5000000.00,'2026-03-03 21:17:14','2026-03-03 21:17:15'),
# (3,'2026-03-03',13000000.00,'2026-03-03 21:22:28','2026-03-03 21:22:30'),
# (5,'2026-03-03',15900000.00,'2026-03-03 21:22:53','2026-03-03 21:22:54'),
# (5,'2026-03-03',2000000.00,'2026-03-03 23:09:28','2026-03-03 23:09:29');

-- Dữ liệu bảng orders_items
# INSERT INTO order_items (order_id, product_name, quantity, price, created_at, updated_at) VALUES
# (2,'Áo Thun',5,2000000.00,'2026-03-03 20:56:07','2026-03-03 20:56:08'),
# (1,'Quần Jean',2,2500000.00,'2026-03-03 20:56:26','2026-03-03 20:56:27'),
# (2,'Giày',2,1500000.00,'2026-03-03 20:57:08','2026-03-03 20:57:10'),
# (3,'Quần Jean',3,2500000.00,'2026-03-03 20:57:43','2026-03-03 20:57:44'),
# (3,'Áo Khoác',3,2800000.00,'2026-03-04 20:58:13','2026-03-04 20:58:15'),
# (4,'Áo Thun',1,2000000.00,'2026-03-03 21:24:31','2026-03-03 21:24:33');

-- Bài tập 1
# SELECT customers.full_name, COUNT(orders.id) as total_orders
# FROM customers
# JOIN orders
# ON customers.id = orders.customer_id
# GROUP BY customers.id, customers.full_name;

-- Bài tập 2
# SELECT customers.full_name, SUM(order_items.quantity * order_items.price) as total_spent
# FROM customers
# JOIN orders
# ON customers.id = orders.customer_id
# JOIN order_items
# ON orders.id = order_items.order_id
# GROUP BY customer_id, customers.full_name
# ORDER BY total_spent DESC;

-- Bài tập 3
# SELECT order_items.product_name, sum(order_items.quantity) as total_quantity
# FROM order_items
# GROUP BY product_name
# ORDER BY total_quantity DESC;

-- Bài tập 4
# SELECT customers.full_name, COUNT(orders.id) as total_orders
# FROM customers
# JOIN orders
# ON customers.id = orders.customer_id
# GROUP BY customers.id, customers.full_name
# HAVING COUNT(orders.id) >= 2;

-- Bài tập 5
# SELECT customers.full_name, SUM(orders.total_amount) as total_amount
# FROM customers
# JOIN orders
# ON customers.id = orders.customer_id
# GROUP BY customers.id, customers.full_name
# HAVING sum(orders.total_amount) > 10000000;
