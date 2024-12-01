-- создать таблицу weather с тремя полями:
-- название города (city)
-- дата (forecast_date)
-- температура в эту даты (temperature)
create table weather (
id integer NOT NULL AUTO_INCREMENT PRIMARY KEY,
city varchar(100),
forecast_date date,
temperature integer
);

-- 2)Вывести содержимое таблицы
select * from weather;
-- 3)Добавить данные в таблицу, используя запрос INSERT
insert into weather 
(city, forecast_date, temperature)
values
("Berlin", str_to_date("2024-08-29", "%Y-%m-%d"), 30);
-- 4)Добавить еще 3 записи в таблицу (произвольную погоду в разных городах в разные дни). 
insert into weather 
(city, forecast_date, temperature)
values
("Dortmund", str_to_date("2024-08-08", "%Y-%m-%d"), 18),
("Cologne", str_to_date("2024-08-11", "%Y-%m-%d"), 21),
("Munich", str_to_date("2024-07-25", "%Y-%m-%d"), 22),
("Hamburg", str_to_date("2024-01-05", "%Y-%m-%d"), -5);
-- 5)Написать запрос, который возвращает содержимое таблицы.
select * from weather;
-- 6)Изменить данные в таблице о температуре в Берлине с 30 на 26 градусов.
update weather set temperature = 26 where city = "Berlin";
-- 7)Поменяйте во всей таблице название города на Paris для записей, где температура выше 25 градусов. 
update weather set city = "Paris" where temperature > 25;
-- 8)Добавить к таблице weather дополнительный столбец min_temp типа integer.
alter table weather add min_temp integer;
-- 9)Используя команду update, установить значение поля min_temp в 0 для всех записей в таблице.
update weather set min_temp = 0;




