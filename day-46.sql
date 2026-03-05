-- Tạo database
CREATE DATABASE day_46;

-- Sử dụng database
USE day_46;

-- Tạo bảng customers
CREATE TABLE customers
(
    id         int AUTO_INCREMENT
        PRIMARY KEY,
    full_name  varchar(100) NULL,
    email      varchar(100) NULL,
    city       varchar(100) NULL,
    created_at timestamp    NULL,
    updated_at timestamp    NULL
)
    COLLATE = utf8mb4_unicode_ci;

-- Tạo bảng orders
CREATE TABLE orders
(
    id           int AUTO_INCREMENT
        PRIMARY KEY,
    customer_id  int            NULL,
    order_date   date           NULL,
    total_amount decimal(12, 2) NULL,
    created_at   timestamp      NULL,
    updated_at   timestamp      NULL,
    CONSTRAINT orders_customers_id_fk
        FOREIGN KEY (customer_id) REFERENCES customers (id)
)
    COLLATE = utf8mb4_unicode_ci;

-- Tạo bảng orders_items
CREATE TABLE order_items
(
    id           int AUTO_INCREMENT
        PRIMARY KEY,
    order_id     int            NULL,
    product_name varchar(100)   NULL,
    quantity     int            NULL,
    price        decimal(10, 2) NULL,
    created_at   timestamp      NULL,
    updated_at   timestamp      NULL,
    CONSTRAINT order_items_orders_id_fk
        FOREIGN KEY (order_id) REFERENCES orders (id)
)
    COLLATE = utf8mb4_unicode_ci;

-- Dữ liệu bảng customers
INSERT INTO customers (full_name, email, city, created_at, updated_at)
VALUES ('Quang Trung', 'quangtrung@gmail.com', 'Đà Nẵng', '2026-03-03 21:50:01', '2026-03-03 21:50:02'),
       ('Văn Sơn', 'vanson@gmail.com', 'Hà Nội', '2026-03-03 20:47:57', '2026-03-03 20:47:59'),
       ('Văn An', 'vanan@gmail.com', 'HCM', '2026-03-03 20:48:23', '2026-03-03 20:48:24'),
       ('Minh Khang', 'minhkhang@gmail.com', 'Quảng Ngãi', '2026-03-03 20:49:30', '2026-03-03 20:49:31'),
       ('Hoàng Việt', 'hoangviet@gmail.com', 'Đà Lạt', '2026-03-03 20:50:02', '2026-03-03 20:50:03');

-- Dữ liệu bảng orders
INSERT INTO orders (customer_id, order_date, total_amount, created_at, updated_at)
VALUES (2, '2026-03-03', 5000000.00, '2026-03-03 21:17:14', '2026-03-03 21:17:15'),
       (3, '2026-03-03', 13000000.00, '2026-03-03 21:22:28', '2026-03-03 21:22:30'),
       (5, '2026-03-03', 15900000.00, '2026-03-03 21:22:53', '2026-03-03 21:22:54'),
       (5, '2026-03-03', 2000000.00, '2026-03-03 23:09:28', '2026-03-03 23:09:29');

-- Dữ liệu bảng orders_items
INSERT INTO order_items (order_id, product_name, quantity, price, created_at, updated_at)
VALUES (2, 'Áo Thun', 5, 2000000.00, '2026-03-03 20:56:07', '2026-03-03 20:56:08'),
       (1, 'Quần Jean', 2, 2500000.00, '2026-03-03 20:56:26', '2026-03-03 20:56:27'),
       (2, 'Giày', 2, 1500000.00, '2026-03-03 20:57:08', '2026-03-03 20:57:10'),
       (3, 'Quần Jean', 3, 2500000.00, '2026-03-03 20:57:43', '2026-03-03 20:57:44'),
       (3, 'Áo Khoác', 3, 2800000.00, '2026-03-04 20:58:13', '2026-03-04 20:58:15'),
       (4, 'Áo Thun', 1, 2000000.00, '2026-03-03 21:24:31', '2026-03-03 21:24:33');

-- Bài tập 1
SELECT customers.full_name, COUNT(orders.id) AS total_orders
FROM customers
         JOIN orders
              ON customers.id = orders.customer_id
GROUP BY customers.id, customers.full_name;

-- Bài tập 2
SELECT customers.full_name, SUM(order_items.quantity * order_items.price) AS total_spent
FROM customers
         JOIN orders
              ON customers.id = orders.customer_id
         JOIN order_items
              ON orders.id = order_items.order_id
GROUP BY customer_id, customers.full_name
ORDER BY total_spent DESC;

-- Bài tập 3
SELECT order_items.product_name, SUM(order_items.quantity) AS total_quantity
FROM order_items
GROUP BY product_name
ORDER BY total_quantity DESC;

-- Bài tập 4
SELECT customers.full_name, COUNT(orders.id) AS total_orders
FROM customers
         JOIN orders
              ON customers.id = orders.customer_id
GROUP BY customers.id, customers.full_name
HAVING COUNT(orders.id) >= 2;

-- Bài tập 5
SELECT customers.full_name, SUM(orders.total_amount) AS total_amount
FROM customers
         JOIN orders
              ON customers.id = orders.customer_id
GROUP BY customers.id, customers.full_name
HAVING SUM(orders.total_amount) > 10000000;
