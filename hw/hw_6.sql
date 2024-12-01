-- Подключитесь к базе данных world (которая находится на удаленном сервере). 

-- 2. Выведите список стран с языками, на которых в них говорят. 
select c2.Name, c.`Language` from countrylanguage c
inner join country c2 
on c.CountryCode=c2.Code;

-- 3. Выведите список городов с их населением и названием стран
select c.Name, c.Population, ctr.Name from city c
inner join country ctr
on ctr.Code = c.CountryCode ;

-- 4.Выведите список городов в South Africa

select c.Name, ctr.Name from city c
inner join country ctr
on ctr.Code = c.CountryCode 
where ctr.Name = 'South Africa';

-- 5. Выведите список стран с названиями столиц. Подсказка: в таблице country есть поле Capital, которое содержит номер города из таблицы City. 

select ctr.Name, c.Name from country ctr
inner join city c
on c.ID = ctr.Capital;

-- 6. Измените запрос 4 таким образом, чтобы выводилось население в столице. 
select ctr.Name, c.Name, ctr.Population from country ctr
inner join city c
on c.ID = ctr.Capital;

-- 7. Напишите запрос, который возвращает название столицы United States
select ctr.Name, c.Name, ctr.Population from country ctr
inner join city c
on c.ID = ctr.Capital
where ctr.Name = "United States"

-- 8. спользуя базу hr_data.sql, вывести имя, фамилию и город сотрудника.
SELECT 
    e.first_name AS employee_name,
    e.last_name AS employee_last_name,
    l.city AS city_name
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    locations l ON d.location_id = l.location_id;
-- 9. Используя базу hr_data.sql, вывести города и соответствующие городам страны.

select l.city, c.country_name from locations l 
inner join countries c 
on c.country_id = l.country_id;