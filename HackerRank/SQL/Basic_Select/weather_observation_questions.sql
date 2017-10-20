/*
Enter your query here.
*/
SELECT CITY, STATE FROM STATION
-- ^ 1


SELECT DISTINCT CITY FROM STATION
WHERE ID % 2 = 0
-- 3


SELECT (SELECT DISTINCT COUNT(CITY)
FROM STATION) -
(SELECT DISTINCT COUNT(DISTINCT CITY)
FROM STATION)
-- 4


SELECT CITY, LENGTH(CITY)
FROM STATION
ORDER BY LENGTH(CITY) ASC, CITY ASC
LIMIT 1;

SELECT CITY, LENGTH(CITY)
FROM STATION
ORDER BY LENGTH(CITY) DESC, CITY ASC
LIMIT 1
-- 5

SELECT DISTINCT CITY FROM STATION
WHERE SUBSTRING(CITY, 1, 1) IN ("a", "e", "i", "o", "u")
-- 6

SELECT DISTINCT CITY FROM STATION
where SUBSTRING(CITY, -1, 1) IN ("a", "e", "i", "o", "u")
-- 7

SELECT DISTINCT CITY FROM STATION
WHERE SUBSTRING(CITY, 1, 1) IN ("a", "e", "i", "o", "u")
AND SUBSTRING(CITY, -1, 1) IN ("a", "e", "i", "o", "u")
-- 8

SELECT DISTINCT CITY FROM STATION
WHERE SUBSTRING(CITY, 1, 1) NOT IN ("a", "e", "i", "o", "u")
-- 9

SELECT DISTINCT CITY FROM STATION
WHERE SUBSTRING(CITY, -1, 1) NOT IN ("a", "e", "i", "o", "u")
-- 10

SELECT DISTINCT CITY FROM STATION
WHERE SUBSTRING(CITY, -1, 1) NOT IN ("a", "e", "i", "o", "u")
OR SUBSTRING(CITY, 1, 1) NOT IN ("a", "e", "i", "o", "u")
-- 11

SELECT DISTINCT CITY FROM STATION
WHERE SUBSTRING(CITY, -1, 1) NOT IN ("a", "e", "i", "o", "u")
AND SUBSTRING(CITY, 1, 1) NOT IN ("a", "e", "i", "o", "u")
-- 12