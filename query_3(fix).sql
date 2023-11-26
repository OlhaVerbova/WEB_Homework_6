-- Знайти середній бал у групах з певного предмета.
SELECT c.name, ROUND(AVG(g.grade), 2) AS average_grades_for_courses
FROM grades g
JOIN courses c ON c.id = g.courses_id
GROUP BY c.name
ORDER BY average_grades_for_courses DESC;