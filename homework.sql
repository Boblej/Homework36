-- У вас есть таблица `Sales`, содержащая информацию о продажах различных товаров в разных магазинах. Таблица имеет следующую структуру:

CREATE TABLE Sales (
    id INTEGER PRIMARY KEY,
    product_id INTEGER,
    store_id INTEGER,
    sale_date DATE,
    quantity INTEGER,
    price REAL
);

-- 1. Найти общее количество проданных товаров за весь период.
SELECT SUM(quantity) AS total_sold_items
FROM Sales;

-- 2. Рассчитать общую сумму выручки за весь период.
SELECT SUM(quantity * price) AS total_revenue
FROM Sales;

-- 3. Найти среднее количество проданных товаров в одной транзакции
SELECT AVG(quantity) AS average_sold_per_transaction
FROM Sales;

-- 4. Определить самый популярный товар (товар с наибольшим количеством продаж).
SELECT product_id, SUM(quantity) AS total_sold
FROM Sales
GROUP BY product_id
ORDER BY total_sold DESC
LIMIT 1;

-- 5. Найти общее количество уникальных товаров, проданных в каждом магазине.
SELECT store_id, COUNT(DISTINCT product_id) AS unique_products_sold
FROM Sales
GROUP BY store_id;
