--Знайти студента із найвищим середнім балом з певного предмета.
SELECT c.name, s.fullname, ROUND(AVG(gr.grade),2) AS average_grades
FROM grades gr 
JOIN students s ON s.id = gr.students_id 
JOIN courses c ON c.id  = gr.courses_id 
WHERE c.id = 1
GROUP BY s.fullname 
ORDER BY average_grades DESC 
LIMIT 1;