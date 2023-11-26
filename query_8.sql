--8. Знайти середній бал, який ставить певний викладач зі своїх предметів.
SELECT t.fullname AS Teacher, ROUND(AVG(gr.grade),2) AS Average_Grade
FROM grades gr
JOIN courses c ON c.id = gr.courses_id 
JOIN teachers t ON t.id = c.teacher_id 
WHERE t.id = 4
GROUP BY t.fullname;
