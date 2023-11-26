--Знайти середній бал на потоці (по всій таблиці оцінок).
SELECT  ROUND(AVG(g.grade),2) AS averageGrade
FROM grades g