--Знайти оцінки студентів у окремій групі з певного предмета.
SELECT g.name,c.name, s.fullname, gr.grade 
FROM grades gr 
JOIN students s  ON gr.students_id = s.id 
JOIN [groups] g ON g.id = s.group_id 
JOIN courses c ON gr.courses_id =c.id 
WHERE g.id = 2 AND c.id = 2
ORDER BY s.fullname;
