-- 1. Написать запрос, возвращающий всех сотрудников, c job_id = IT_PROG.
-- 2. Изменить запрос так, чтобы вывести всех сотрудников с job_id равной AD_VP?
-- 3. Выполнить эти два запроса: 
select * from hr.employees where job_id = 'IT_PROG';
select * from hr.employees where job_id = 'AD_VP';


-- 4.Воспроизвести самостоятельно следующие запросы:
select * from hr.employees where salary BETWEEN 10000 and 20000;
select * from hr.employees where department_id not in (60,30,100);
select * from hr.employees where first_name like '%_ll_%';
select * from hr.employees where last_name like '%_a';

-- 5. Найти всех сотрудников с зарплатой выше 10000
select * from hr.employees where salary > 10000;
-- 6. Найти всех сотрудников, с зарплатой выше 10000 и чья фамилия начинается на букву L
select * from hr.employees where salary > 10000 and last_name like 'L%';

-- 7. Не выполняя запрос к базе данных, предсказать его результат:
-- данный запрос вернет всех сотрудников с любой зарплатой
-- select *  from employees where salary > 10000 or salary <= 10000;

-- 8. Ответить в 1 предложении: чем он будет отличаться от результата этого запроса?
-- данный запрос вернет всех сотрудников кроме с зарплатой 10000
-- select *  from employees where salary > 10000 or salary < 10000;

-- Не выполняя запрос к базе, предсказать результат. 
-- вернет всех сотрудников с зарплатой больше 10000 и меньше 5000
-- select *  from hr.employees where salary > 10000 and salary < 5000;