-- 1. Создать базу данных онлайн-магазина из двух таблиц: заказчики (Customer) и заказы
-- (Orders).
CREATE TABLE customer (
    customer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    street VARCHAR(100) NOT NULL,
    post_code VARCHAR(10) NOT NULL,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    date_of_registration TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    order_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    item_name VARCHAR(100) NOT NULL,
    item_description TEXT NOT NULL,
    item_photo_url VARCHAR(255),
    item_price NUMERIC(10 , 2 ) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- 2. Заполнить таблицу тестовыми данными: 3-5 заказчиков и с десяток ордеров так,
-- чтобы у всех заказчиков было разное количество заказов.
INSERT INTO customer (
    first_name,
    last_name,
    street,
    post_code,
    city,
    country,
    email,
    date_of_registration
) VALUES 
('John', 'Doe', '123 Maple Street', '10001', 'New York', 'USA', 'johndoe@example.com', '2023-01-15'),
('Jane', 'Smith', '456 Oak Avenue', '20002', 'Washington', 'USA', 'janesmith@example.com', '2023-02-20'),
('Michael', 'Brown', '789 Pine Road', '30003', 'Atlanta', 'USA', 'michaelbrown@example.com', '2023-03-12'),
('Emily', 'Johnson', '101 Cedar Lane', '40004', 'Louisville', 'USA', 'emilyjohnson@example.com', '2023-04-07'),
('Daniel', 'Williams', '202 Birch Boulevard', '50005', 'Chicago', 'USA', 'danielwilliams@example.com', '2023-05-15'),
('Sophia', 'Miller', '303 Elm Street', '60006', 'Houston', 'USA', 'sophiamiller@example.com', '2023-06-20'),
('James', 'Wilson', '404 Ash Avenue', '70007', 'Phoenix', 'USA', 'jameswilson@example.com', '2023-07-10'),
('Olivia', 'Taylor', '505 Fir Road', '80008', 'Denver', 'USA', 'oliviataylor@example.com', '2023-08-02'),
('Liam', 'Anderson', '606 Spruce Lane', '90009', 'Seattle', 'USA', 'liamanderson@example.com', '2023-09-14'),
('Ava', 'Thomas', '707 Willow Street', '10010', 'San Francisco', 'USA', 'avathomas@example.com', '2023-10-05');

insert into customer (
    first_name,
    last_name,
    street,
    post_code,
    city,
    country,
    email,
    date_of_registration
) VALUES ('Liam', 'Anderson', '606 Spruce Lane', '90009', 'Seattle', 'USA', 'liamanderson@gmail.com', '2023-09-14'),
('Ava', 'Thomas', '707 Willow Street', '10010', 'San Francisco', 'USA', 'avathomas@gmail.com', '2023-10-05');

-- Orders for customer_id 1 (John Doe)
INSERT INTO orders (customer_id, order_date, item_name, item_description, item_photo_url, item_price) VALUES
(1, '2023-08-01', 'Laptop', '15-inch gaming laptop', 'https://example.com/laptop.jpg', 1200.00),
(1, '2023-08-10', 'Headphones', 'Noise-cancelling over-ear headphones', 'https://example.com/headphones.jpg', 200.00),
(1, '2023-08-15', 'Mouse', 'Wireless ergonomic mouse', 'https://example.com/mouse.jpg', 50.00),

-- Orders for customer_id 3 (Michael Brown)
(3, '2023-07-20', 'Smartphone', 'Latest model with 128GB storage', 'https://example.com/smartphone.jpg', 899.99),
(3, '2023-07-25', 'Phone Case', 'Rugged protective case', 'https://example.com/phonecase.jpg', 30.00),
(3, '2023-07-28', 'Screen Protector', 'Tempered glass screen protector', 'https://example.com/screenprotector.jpg', 15.00),
(3, '2023-08-01', 'Wireless Charger', 'Fast charging pad', 'https://example.com/charger.jpg', 40.00),

-- Orders for customer_id 5 (Daniel Williams)
(5, '2023-06-18', 'Tablet', '10-inch tablet with Wi-Fi', 'https://example.com/tablet.jpg', 350.00),
(5, '2023-06-22', 'Tablet Case', 'Folio case with stand', 'https://example.com/tabletcase.jpg', 45.00),
(5, '2023-06-24', 'Stylus', 'Precision stylus pen', 'https://example.com/stylus.jpg', 25.00),

-- Orders for customer_id 7 (James Wilson)
(7, '2023-09-05', 'Smartwatch', 'Fitness tracker with heart rate monitor', 'https://example.com/smartwatch.jpg', 150.00),
(7, '2023-09-10', 'Wireless Earbuds', 'In-ear Bluetooth earbuds', 'https://example.com/earbuds.jpg', 70.00),
(7, '2023-09-15', 'Charging Cable', 'USB-C fast charging cable', 'https://example.com/cable.jpg', 15.00),

-- Orders for customer_id 9 (Liam Anderson)
(9, '2023-05-10', 'Gaming Console', 'Next-gen gaming console', 'https://example.com/console.jpg', 500.00),
(9, '2023-05-15', 'Extra Controller', 'Wireless gaming controller', 'https://example.com/controller.jpg', 60.00),
(9, '2023-05-18', 'Game', 'Action-adventure video game', 'https://example.com/game.jpg', 70.00),
(9, '2023-05-20', 'Headset', 'Gaming headset with microphone', 'https://example.com/headset.jpg', 80.00),
(9, '2023-05-25', 'HDMI Cable', 'High-speed HDMI cable', 'https://example.com/hdmi.jpg', 20.00);


SELECT * FROM orders;
-- 4. К таблице Customer добавить поле last_modified, которое содержит дату последнего
-- изменения данных заказчика. Установить его значение в now. 
ALTER TABLE customer
ADD last_modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON
UPDATE
	CURRENT_TIMESTAMP;


-- 5. Добавить к таблице Order поле discounter_price, которое содержит скидочную
-- стоимость заказа. Выставить значение этого поля для всех заказов на 10% меньше,
-- чем оригинальная стоимость заказа.
ALTER TABLE orders
ADD COLUMN discounter_price NUMERIC(10,2);


UPDATE
	orders
SET
	discounter_price = item_price * 0.9;
select * from orders;

-- 1. Вывести все заказы, отсортированные по убыванию по стоимости
select * from orders order by item_price desc;

-- 2. Вывести всех заказчиков, у которых почта зарегистриварована на gmail.com
select * from customer c where email like '%@gmail.com'

-- 3. Вывести заказы, добавив дополнительный вычисляемый столбец status, который вычисляется по стоимости заказа и имеет три значения: low, middle, high. 

alter table orders add column status varchar(10);

update
	orders
set
	status = 
case
		WHEN item_price < 300 then 'low'
		WHEN item_price >= 300
		and item_price < 600 then 'middle'
		WHEN item_price >= 600 then 'high'
end;

-- 4. Вывести заказчиков по убыванию рейтинга.
select first_name,last_name, o.status, o.order_id from customer c
inner join orders o 
using(customer_id)
order by o.status;

-- 5.Вывести всех заказчиков из города на ваш выбор. 
select
	*
from
	customer c
where
	city in("Houston", "Washington");


-- 6.Написать запрос, который вернет самый часто продаваемый товар. 

select item_name, count(*) as item_count
from orders o 
group by item_name
order by item_count desc
limit 1;

-- 7. Вывести список заказов с максимальной скидкой. 
select item_name, (item_price - discounter_price) as discount_amount from orders
order by discount_amount desc
limit 1;
-- 8. Ответьте в 1 предложении: как вы определите скидку? 
-- изначальная цена - цена со скидкой

-- 9. Ответьте в 1 предложении: может ли это быть разница между нормальной ценой и скидочной ценой? 
-- да

-- 10. Написать запрос, который выведет все заказы с дополнительным столбцом процент_скидки, который содержит разницу в процентах между нормальной и скидочной ценой?

alter table orders 
add column discount decimal(4,2);
update orders 
set discount=((item_price - discounter_price)/item_price)*100;
select discount from orders;

