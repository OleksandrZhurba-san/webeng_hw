-- 2. Посмотреть на таблицы city, country из базы world. В каждой таблице есть поле название (Name) и население (Population). Поле Name в одной таблице означает название города, а в другой - название страны. Написать запрос с помощью UNION, который выводит список названий всех городов и стран с их населением. Итоговая выборка должна содержать два столбца: Name, Population. 

select * from city;
select * from country;

select Name, Population from city c
union all
select Name, Population from country c2
order by Name;

-- 3. Посмотреть на таблицы в базе world и объяснить ограничения нескольких столбцов - ответить 1 предложением.

show fields from city;
-- данный запрос покажет, что в таблице city мы имеем id с типом данных int
-- имеет ограничения NOT NULL, так же он является PRIMARY KEY и AUTO INCREMENT
-- столбец population имеет default value 0
show fields from country;
-- столбец Region, SurfaceArea из таблицы country имеет ограничение NOT NULL

-- 4. Далее работаем на локальном сервере. Создать новую таблицу citizen, которая содержит следующие поля: уникальное автоинкрементное, номер соц страхования, имя, фамилию и емейл. 

create table citizen (
id int primary key not null auto_increment,
ssn int,
first_name varchar(50),
last_name varchar(50),
email varchar(50)
);


-- 4. Далее работаем на локальном сервере. Создать новую таблицу citizen, которая содержит следующие поля: уникальное автоинкрементное, номер соц страхования, имя, фамилию и емейл. 

create table citizen (
id int primary key not null auto_increment,
ssn int,
first_name varchar(50),
last_name varchar(50),
email varchar(50)
);
select * from citizen;

-- 5.На вашем локальном сервере в любой базе создать таблицу без ограничений (любую, можно взять с урока). 
-- 
-- 6. Добавить в таблицу 5 значений. Добавить 3 человека с одинаковыми именами и 2 человека без lastname

INSERT INTO citizen (ssn, first_name, last_name, email) VALUES
(123456789, 'John', 'Doe', 'john.doe@example.com'),
(987654321, 'John', 'Smith', 'john.smith@example.com'),
(111223333, 'John', NULL, 'john.anonymous@example.com'),
(222334444, 'Alice', NULL, 'alice@example.com'),
(333445555, 'Bob', 'Brown', 'bob.brown@example.com');
select * from citizen;

-- 7. Использовать оператор alter table … modify , чтобы добавить ограничение not null на поле firstname и lastname. 
update citizen
set last_name = ""
where last_name is null;

select * from citizen;

alter table citizen
modify first_name varchar(50) not null, 
modify last_name varchar(50) not null;

show fields from citizen;

-- 8. Добавить ограничение unique для пары firstname\lastname. 

alter table citizen 
add constraint unique_name unique (first_name, last_name);
show fields from citizen;

-- 9. Удалить таблицу из базы и пересоздать ее, модифицировав запрос add table так, чтобы он учитывал ограничения (см примеры из класса).
drop table if exists citizen;

-- 10. Добавить правильные и неправильные данные (нарушающие и не нарушающие ограничения).

create table citizen (
id int primary key not null auto_increment,
ssn int unique,
first_name varchar(50),
last_name varchar(50),
email varchar(50) unique,
constraint unique_name unique (first_name, last_name)
);

show fields from citizen;

insert into citizen (ssn, first_name, last_name, email) values
(123456789, 'Emma', 'Johnson', 'emma.johnson@example.com'),
(987654321, 'Michael', 'Williams', 'michael.williams@example.com'),
(111223333, 'Sophia', 'Brown', 'sophia.brown@example.com'),
(222334444, 'James', 'Davis', 'james.davis@example.com'),
(333445555, 'Olivia', 'Martinez', 'olivia.martinez@example.com');

select * from citizen;
