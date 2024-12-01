-- Используя https://github.com/it-career-hub/MySQL_databases/blob/main/hr_data.sql, вывести список всех сотрудников. 
select * from employees e;

-- Найти поле с зарплатой сотрудника. 
select salary from employees e;

-- Используя операторы case/when/end, изменить запрос так, чтобы результатом был только один столбец, назовите его SALARY_GROUP и оно будет принимать значение 1 если зп сотрудника больше 10000 и значение 0, если меньше.
select
	case
	when
		salary > 10000 then 1
		else 0
	end as SALARY_GROUP
from
	employees e;
-- Ответить одним предложением: почему выводится только один столбец? 
-- Потому, что мы используем оператор AS для именования столбца;

-- Изменить запрос, так, чтобы вывелось два столбца: имя сотрудника и новое поле SALARY_GROUP.
select first_name,
	case
	when
		salary > 10000 then 1
		else 0
	end as SALARY_GROUP
from
	employees e;
-- Вывести среднюю зарплату для департаментов с номерами 60, 90 и 100 используя составное условие.
select avg(salary) from employees e where department_id in (60,90,10);

-- Разделить уровни (level) сотрудников на junior < 10000, 10000 < mid < 15000, senior>15000 в зависимости от их зарплаты. Вывести список сотрудников (first_name, last_name, level).
select
	first_name,
	last_name,
	salary,
	(case
		when salary < 10000 then "junior"
		when salary < 15000 and salary >= 10000 then "mid"
		when salary > 15000 then "senior"
	end) as level
from
	employees e order by salary;
-- Посмотреть содержимое таблицы jobs. Написать запрос c использованием оператора case/when/end, который возвращает 2 столбца: job_id, payer_rank, где столбец payer_rank формируется по правилу: если максимальная зарплата больше 10000, то “high_payer”, если меньше, то “low payer”. 
select * from jobs;
select
	job_id,
	(case
		when max_salary >= 10000 then "high payer"
		when max_salary < 10000 then "low payer" 
	end) as payer_rank
from
	jobs;
-- Переписать этот запрос с использованием оператора IF.
select
	job_id,
	if(max_salary >= 10000,
	"high payer",
	"low payer") as payer_rank
from
	jobs;
-- Поменять предыдущий запрос так, чтобы выводилось 3 столбца, к двум существующим добавьте max_salary и отсортировать результат по убыванию. 
select
	job_id,
	max_salary,
	if(max_salary >= 10000,
	"high payer",
	"low payer") as payer_rank
from
	jobs order by max_salary desc;