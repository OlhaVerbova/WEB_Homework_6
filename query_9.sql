--9. Знайти список курсів, які відвідує студент.
SELECT s.fullname AS Students_fullname, c.name AS  Courses
FROM grades gr
JOIN students s ON gr.students_id = s.id 
JOIN courses c ON gr.courses_id =c.id 
WHERE s.id = 3
GROUP BY s.fullname, c.name
ORDER BY s.fullname, c.name;
