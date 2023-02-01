-- SQL Names
SELECT *
FROM names
LIMIT 5;
-- 1. How many rows are in the names table?
SELECT COUNT (*)
FROM names;
-- There are 1,957,046 rows in the table.

-- 2. How many total registered people appear in the dataset?
SELECT SUM(num_registered) AS total_registered
FROM names;
-- There are 351,653,025 registered people in the dataset.

-- 3. Which name had the most appearances in a single year in the dataset?
SELECT *
FROM names 
ORDER BY num_registered DESC
LIMIT 5;

SELECT name, year, MAX(num_registered) AS Most_Names
FROM names
GROUP BY Name, year
ORDER by Most_Names desc, Year
LIMIT 1;

SELECT *
FROM names
WHERE num_registered = (
 SELECT MAX(num_registered) 
 FROM names);

-- 4. What range of years are included?
SELECT MIN(year) AS min_year, MAX(year) AS max_year
FROM names;
-- The years in the dataset run from 1880 - 2018

-- 5. What year has the largest number of registrations?
SELECT year, SUM(num_registered) AS total_registered
FROM names
GROUP BY year
ORDER BY total_registered DESC
LIMIT 5; 
-- 1957 had the largest number of registrations.

-- 6. How many different (distinct) names are contained in the dataset?
SELECT COUNT(DISTINCT name)
FROM names;
-- There are 98,400 distinct names in the dataset

-- 7. Are there more males or more females registered?
SELECT name, SUM(num_registered) AS total_registered
FROM names
GROUP BY name, gender;
-- female = 174,079,232

-- 8. What are the most popular male and female names overall (i.e., the most total registrations)?
SELECT name, SUM(num_registered) AS registrations
FROM names
GROUP BY name, gender
ORDER BY SUM(num_registered) DESC
LIMIT 5; 
-- I show the most popular male name is James and the most popular female name is Mary.

-- 9. What are the most popular boy and girl names of the first decade of the 2000s (2000 - 2009)?
SELECT name, SUM(num_registered) AS registrations
FROM names
WHERE year BETWEEN 2000 AND 2009 
GROUP BY name, gender
ORDER BY SUM(num_registered) DESC;
-- The most popular male name was Jacob and the most popular female name was Emily.

-- 10. Which year had the most variety in names (i.e. had the most distinct names)?
SELECT COUNT(DISTINCT name) AS variety, year
FROM names
GROUP BY year
ORDER BY variety DESC
LIMIT 5;
-- I show 2008 had the most variety in names.

-- 11. What is the most popular name for a girl that starts with the letter X?
SELECT name, SUM(num_registered) AS registrations
FROM names
WHERE name LIKE 'X%' AND gender = 'F'
GROUP BY name
ORDER BY registrations DESC;
-- I show Ximena was the most popular name for a girl beginning with X

-- 12. How many distinct names appear that start with a 'Q', but whose second letter is not 'u'?
SELECT COUNT(DISTINCT name) AS q_names
FROM names
WHERE name LIKE 'Q%' AND name NOT LIKE '_u%';
-- I come up with 46 distinct names meeting this criteria.

-- 13. Which is the more popular spelling between "Stephen" and "Steven"? Use a single query to answer this question.
SELECT name, SUM(num_registered) AS registrations
FROM names
WHERE name = 'Stephen' OR name = 'Steven'
GROUP BY name
ORDER BY SUM(num_registered) DESC;
-- I show Steven is more popular with 1,286,951 registrations vs. 860,972 for Stephen.

-- 14. What percentage of names are "unisex" - that is what percentage of names have been used both for boys and for girls?
-- SELECT name, COUNT(gender) AS unisex_name
-- FROM names
-- GROUP BY name
-- HAVING COUNT(DISTINCT(gender)) = 2
SELECT 10773/98400;

-- 15. How many names have made an appearance in every single year since 1880?
-- SELECT MAX(year) - MIN(year)
-- FROM names;

-- SELECT name
-- FROM names
-- GROUP BY name
-- HAVING COUNT (DISTINCT year) = 139

SELECT COUNT(name)
FROM
(
	SELECT DISTINCT name
	FROM names
	GROUP BY name
	HAVING COUNT(DISTINCT year) = (SELECT COUNT(DISTINCT year) FROM names)
) AS Sub1
-- 921 names appeared in every single year.

-- 16. How many names have only appeared in one year?
SELECT name, COUNT(name) AS only_one_year
FROM names
GROUP BY name
HAVING COUNT(year) = 1; 
-- I'm coming up with 21,100 names.

SELECT name
FROM names
GROUP BY name
HAVING COUNT (DISTINCT year) = 1;

-- 17/ How many names only appeared in the 1950s?
SELECT name
FROM names
GROUP BY name
HAVING MIN(year) = 1950 AND MAX(year) = 1959;

SELECT name
FROM names
GROUP BY name
HAVING MIN(year) BETWEEN 1950 AND 1959
	AND MAX(year) BETWEEN 1950 AND 1959;

-- I show 661 names appeared only in the 1950's.

-- 18. How many names made their first appearance in the 2010s?
SELECT name
FROM names
GROUP BY name
HAVING MIN(year) >= 2010;
-- 11,270

-- 19. Find the names that have not been used in the longest.
SELECT name, MAX(year) AS last_year_used
FROM names
GROUP BY name
ORDER BY last_year_used;

-- 20. Come up with a question that you would like to answer using this dataset. Then write a query to answer this question.



How many names made their first appearance in the 2010s?

Find the names that have not be used in the longest.

Come up with a question that you would like to answer using this dataset. Then write a query to answer this question.
