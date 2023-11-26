--12. Додаткове 2 Оцінки студентів у певній групі з певного предмета на останньому занятті.
SELECT g.name AS Groups_of_student, s.fullname AS Students, c.name AS Courses, gr.date_of AS Date_of, gr.grade AS Grede
FROM grades gr
JOIN students s ON gr.students_id = s.id
JOIN [groups] g ON s.group_id = g.id
JOIN courses c ON gr.courses_id = c.id 
WHERE g.id = 3 AND c.id = 5 AND gr.date_of = (SELECT MAX(date_of) FROM grades WHERE students_id = s.id )
ORDER BY gr.date_of DESC


