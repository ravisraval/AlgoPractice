SELECT Name FROM STUDENTS
WHERE Marks > 75
ORDER BY SUBSTRING(Name, -3, 3) ASC, ID ASC
