drop database if exists newdb2;
create database newdb2;
use newdb2;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30)
);

INSERT INTO Customers VALUES
(101, 'Alice', 'New York'),
(102, 'Bob', 'Chicago'),
(103, 'Charlie', 'Dallas'),
(104, 'David', 'Seattle'),
(105, 'Emma', 'Boston'),
(106, 'Frank', 'Chicago'),
(107, 'Grace', 'Dallas'),
(108, 'Henry', 'Miami');


CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    status VARCHAR(20)
);


INSERT INTO Orders VALUES
(1001, 101, '2025-01-05', 1200, 'Delivered'),
(1002, 101, '2025-02-15', 800, 'Cancelled'),
(1003, 102, '2025-01-20', 3500, 'Delivered'),
(1004, 102, '2025-03-10', 600, 'Pending'),
(1005, 103, '2025-02-18', 900, 'Delivered'),
(1006, 104, '2025-03-05', 4500, 'Delivered'),
(1007, 104, '2025-04-01', 700, 'Pending'),
(1008, 105, '2025-01-11', 1500, 'Cancelled'),
(1009, 105, '2025-04-12', 2200, 'Delivered'),
(1010, 107, '2025-05-01', 1800, 'Pending');

show tables;
select * from orders;
select * from customers;

-- in operator check for query list of values rerturn by a subqiery 

-- exists
select * from customers where exists 
(select 1 from orders where orders.customer_id = customers.customer_id);

-- Q1. Show customers who have placed at least one order. 

select * from customers c
where exists (select 1 from Orders o where c.customer_id = o.customer_id);

-- Q2. Show customers who have never placed any order.

select * from customers c
where not exists (select 1 from orders o where c.customer_id = o.customer_id);

-- Q3. Show customers who have at least one Delivered order.

select * from customers c
where exists (select 1 from orders o where c.customer_id = o.customer_id
and status = 'delivered');

-- Q4. Show customers who have at least one Pending order.

select * from customers c
where exists (select 1 from orders o where c.customer_id = o.customer_id
and status = 'Pending');

-- Q5. Show customers who have at least one Cancelled order.

select * from customers c where exists 
(select 1 from Orders o
where c.customer_id = o.customer_id
and status = 'cancelled');

-- Q6. Show customers who have no Cancelled orders.

select * from customers c
where not exists (select 1 from orders o
where c.customer_id = o.customer_id
and status = 'cancelled');

-- Q7. Show customers who have both Delivered and Pending orders.

select * from customers c
where exists (select 1 from orders o where c.customer_id = o.customer_id
and status = 'Delivered')
and exists (select 1 from orders o where c.customer_id = o.customer_id
and status = 'pending');

-- Q8. Show customers who have Delivered orders but no Pending orders

select * from customers c
where exists (select 1 from orders o where c.customer_id = o.customer_id
and status = 'delivered')
and not exists (select 1 from orders o where c.customer_id = o.customer_id
and status = 'pending');

-- Q9. Show customers who have at least one order above 3000.

select * from customers c
where exists (select 1 from orders o where c.customer_id = o.customer_id
and amount > 3000);

-- Q10. Show customers who have no order above 3000.

select * from customers c
where not exists (select 1 from orders o where c.customer_id = o.customer_id
and amount > 3000);

-- Q11. Show customers who have placed an order in March 2025.

select * from customers c
where exists (select 1 from orders o where c.customer_id = o.customer_id
and order_date between '2025-03-01' and '2025-03-31');

-- Q12. Show customers who have more than one order.

select * from Customers c
where exists (select 1 from orders o where c.customer_id = o.customer_id
group by  customer_id
having COUNT(*) > 1);