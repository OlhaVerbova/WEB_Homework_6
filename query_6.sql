--6. Знайти список студентів у певній групі.
SELECT g.name AS Group_Name, s.fullname AS Student
FROM [groups] g
JOIN students s ON g.id = s.group_id 
WHERE g.id = 1
ORDER BY s.fullname;
