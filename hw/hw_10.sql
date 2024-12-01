-- Подключиться к базе данных world
-- Вывести население в каждой стране. Результат содержит два поля: CountryCode, sum(Population). Запрос по таблице city
select CountryCode, sum(Population) from city group by CountryCode having ;

-- Изменить запрос выше так, чтобы выводились только страны с населением более 3 млн человек. 
-- Сколько всего записей в результате? 59
select CountryCode, sum(Population) as sum_of_pop from city group by CountryCode having sum_of_pop > 3000000 order by sum_of_pop;

-- Поменять запрос выше так, чтобы в результате вместо кода страны выводилось ее название. Подсказка: нужен join таблиц city и country по полю CountryCode.
select ctr.Name , sum(c.Population) as sum_of_pop from city c
join country ctr
on c.CountryCode = ctr.Code 
group by CountryCode having sum_of_pop > 3000000 order by sum_of_pop;

-- Вывести количество городов в каждой стране (CountryCode, amount of cities). Подсказка: запрос по таблице city и группировка по CountryCode.
select CountryCode, COUNT(Name) as cities from city c
group by CountryCode order by CountryCode;

-- Поменять запрос так, чтобы вместо кодов стран, было названия стран.
select ctr.Name , COUNT(ctr.Name) as cities from city c
join country ctr
on ctr.Code = c.CountryCode 
group by ctr.Name order by ctr.Name;
-- Поменять запрос так, чтобы выводилось среднее количество городов в стране. Подсказка: разделите задачу на несколько подзадач. Например, сначала вывести код страны и количество городов в каждой стране.  Затем сделать join получившегося результата с запросом, где высчитывается среднее от количества городов. Потом добавить join, который добавит имена стран, вместо кода.
SELECT AVG(city_count) AS avg_cities_per_country
FROM (
    SELECT COUNT(c.ID) AS city_count
    FROM city c
    JOIN country ctr ON ctr.Code = c.CountryCode
    GROUP BY ctr.Name
) AS city_counts;
