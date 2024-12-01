-- 1. Вывести количество городов для каждой страны. Результат должен содержать CountryCode, CityCount (количество городов в стране). Поменяйте запрос с использованием джойнов так, чтобы выводилось название страны вместо CountryCode. 
select
	CountryCode,
	count(*) as CityCount
from
	city
group by
	CountryCode
order by
	CityCount;


select
	ctr.Name,
	count(*) as CityCount
from
	city c
join country ctr
on
	ctr.Code = c.CountryCode
group by
	CountryCode
order by
	CityCount;


-- 2. Используя оконные функции, вывести список стран с продолжительностью жизнью и средней продолжительностью жизни. 
select 
    Name,
    LifeExpectancy,
    AVG(LifeExpectancy) OVER () AS AverageLifeExpectancy
from 
    country
order by LifeExpectancy desc;

-- 3. Используя ранжирующие функции, вывести страны по убыванию продолжительности жизни.
select 
    Name,
    Continent,
    Region,
    LifeExpectancy,
    RANK() OVER (ORDER BY LifeExpectancy DESC) AS rank_life_exp
from 
    country
order by rank_life_exp;

-- 4. Используя ранжирующие функции, вывести третью страну с самой высокой продолжительностью жизни.
SELECT 
    Name,
    LifeExpectancy
FROM (
    SELECT 
        Name,
        LifeExpectancy,
        RANK() OVER (ORDER BY LifeExpectancy DESC) AS rank_life_exp
    FROM 
        country
) AS RankedCountries
WHERE 
    rank_life_exp = 3;
