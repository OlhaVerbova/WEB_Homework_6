--Знайти які курси читає певний викладач.
SELECT t.fullname AS Teacher, c.name AS Course
FROM teachers t
JOIN courses c ON c.teacher_id  = t.id 
WHERE t.id = 4;