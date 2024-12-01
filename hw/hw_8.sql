-- Подключитесь к базе данных Students (которая находится на удаленном сервере). 
-- Найдите самого старшего студента
select first_name, age from Students where age = (select max(age) from Students s );

-- Найдите самого старшего преподавателя
select name , age from Teachers t where age = (select max(age) from Teachers s );

-- Выведите список преподавателей с количеством компетенций у каждого
SELECT 
    t.name AS teacher_name,
    COUNT(tc.competencies_id) AS competencies_count
FROM 
    Teachers t
LEFT JOIN 
    Teachers2Competencies tc ON t.id = tc.teacher_id
LEFT JOIN 
    Competencies c ON tc.competencies_id = c.id
GROUP BY 
    t.id, t.name
ORDER BY 
    competencies_count DESC;
   
-- Выведите список курсов с количеством студентов в каждом
SELECT 
    c.title AS course_title,
    COUNT(sc.student_id) AS student_count
FROM 
    Courses c
LEFT JOIN 
    Students2Courses sc ON c.id = sc.course_id
LEFT JOIN 
    Students s ON sc.student_id = s.id
GROUP BY 
    c.id, c.title
ORDER BY 
    student_count DESC;

-- Выведите список студентов, с количеством курсов, посещаемых каждым студентом.
SELECT 
    s.first_name AS student_name,
    COUNT(sc.course_id) AS course_count
FROM 
    Students s
LEFT JOIN 
    Students2Courses sc ON s.id = sc.student_id
LEFT JOIN 
    Courses c ON sc.course_id = c.id
GROUP BY 
    s.id, s.first_name 
ORDER BY 
    course_count DESC;

