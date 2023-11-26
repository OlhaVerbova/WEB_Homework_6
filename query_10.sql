--10.Список курсів, які певному студенту читає певний викладач.
SELECT s.fullname AS Student, t.fullname AS Teacher, c.name AS Courses
FROM grades gr 
JOIN students s ON gr.students_id= s.id
JOIN courses c ON gr.courses_id=c.id
JOIN teachers t ON t.id = c.teacher_id 
WHERE s.id= 15 AND t.id = 4
GROUP BY s.fullname, t.fullname, c.name 
ORDER BY c.name;