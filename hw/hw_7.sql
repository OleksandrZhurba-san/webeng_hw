-- Выведите количество сотрудников в базе
select count(*) as employees_count from employees e ;

-- Выведите количество департаментов (отделов) в базе
select count(department_id) as department_count from departments d;

-- Подключитесь к базе данных World (которая находится на удаленном сервере).
-- Выведите среднее население в городах Индии (таблица City, код Индии - IND)
select avg(Population) from city where CountryCode = "IND";

-- Выведите минимальное население в индийском городе и максимальное.
select min(Population), max(Population) from city where CountryCode = "IND";

-- Выведите самую большую площадь территории. 
select SurfaceArea, Name from country c where SurfaceArea = (select max(SurfaceArea) from country c2);

-- Выведите среднюю продолжительность жизни по странам. 
select avg(LifeExpectancy) from country c;

-- Найдите самый населенный город (подсказка: использовать подзапросы)
select Population, Name from city where Population = (select max(Population) from city);