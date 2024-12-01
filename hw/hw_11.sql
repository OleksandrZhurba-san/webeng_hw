-- Подключиться к базе данных hr
-- Вывести список region_id, total_countries, где total_countries - количество стран в таблице. Подсказка: работаем с таблицей countries, использовать оконную функцию over() и суммировать count(country_id).
use hr;
SELECT region_id, COUNT(country_id) OVER() AS total_countries
FROM countries;

-- Изменить запрос 2 таким образом, чтобы для каждого region_id выводилось количество стран в этом регионе. Подсказка: добавить partition by region_id в over().
SELECT region_id, COUNT(country_id) OVER(partition by region_id) AS countries_in_region
FROM countries;

-- Работа с таблицей departments. Написать запрос, который выводит location_id, department_name, dept_total, где dept_total - количество департаментов в location_id.
select location_id, department_name, COUNT(location_id) over() as dept_total from departments d;

-- Изменить запрос 3 таким образом, чтобы выводились названия городов соответствующих location_id.
select l.city , d.department_name, COUNT(d.location_id) over() as dept_total from departments d
join locations l
on l.location_id = d.location_id ;

-- Работа с таблицей employees. Вывести manager_id, last_name, total_manager_salary, где total_manager_salary - общая зарплата подчиненных каждого менеджера (manager_id).
SELECT 
    e.manager_id,
    m.last_name,
    SUM(e.salary) AS total_manager_salary
FROM 
    employees e
JOIN 
    employees m ON e.manager_id = m.employee_id
GROUP BY 
    e.manager_id, m.last_name
ORDER BY 
    total_manager_salary DESC;

