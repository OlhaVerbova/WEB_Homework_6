--Знайти 5 студентів із найбільшим середнім балом з усіх предметів.
SELECT s.fullname, ROUND(AVG(gr.grade),2) AS average_grades
FROM grades gr
LEFT JOIN students s ON s.id = gr.students_id 
GROUP BY s.fullname 
ORDER BY average_grades DESC 
LIMIT 5;