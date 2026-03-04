# CREATE DATABASE day_46;

# use day_46

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
