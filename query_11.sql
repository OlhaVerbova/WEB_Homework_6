--Додаткове 1 Середній бал, який певний викладач ставить певному студентові.
SELECT t.fullname AS Teacher, s.fullname AS Student, ROUND(AVG(gr.grade),2) AS Avarage_grade
FROM grades gr
JOIN courses c ON gr.courses_id = c.id 
JOIN teachers t ON c.teacher_id = t.id 
JOIN students s ON gr.students_id = s.id 
WHERE t.id = 4 AND s.id = 16
GROUP BY t.fullname, s.fullname 