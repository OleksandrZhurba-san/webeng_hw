-- Вывести текущую дату и время.
select now() as current_datetime;

-- Вывести текущий год и месяц
select YEAR(NOW()) as current_year, MONTH(NOW()) as current_month;

-- Вывести текущее время
select CURTIME() as ct;

-- Вывести название текущего дня недели
SELECT DAYNAME(NOW()) AS current_day;

-- Вывести номер текущего месяца
SELECT MONTH(NOW()) as current_month;

-- Вывести номер дня в дате “2020-03-18” 
SELECT DAYOFWEEK('2020-03-18') AS day_number;

-- Подключиться к базе данных shop (которая находится на удаленном сервере).
-- Определить какие из покупок были совершены апреле (4-й месяц)
select * from ORDERS o where MONTH(ODATE) = 4;

-- Определить количество покупок в 2022-м году
select count(*) as total_orders from ORDERS o where YEAR(ODATE) = 2022;

-- Определить, сколько покупок было совершено в каждый день. Отсортировать строки в порядке возрастания количества покупок. Вывести два поля - дату и количество покупок
SELECT 
    odate,
    COUNT(order_id) AS total_sells
FROM 
    ORDERS o 
GROUP BY 
    odate
ORDER BY 
    odate ASC;

-- Определить среднюю стоимость покупок в апреле
select avg(AMT) as avg_in_aprile from ORDERS o where MONTH(ODATE) = 4;