-- SQL Names
SELECT *
FROM names
LIMIT 5;
-- 1. How many rows are in the names table?
SELECT COUNT (*)
FROM names;
-- There are 1,957,046 rows in the table.

-- 2. How many total registered people appear in the dataset?
SELECT SUM(num_registered)
FROM names;
-- There are 351,653,025 registered people in the dataset.

-- 3. Which name had the most appearances in a single year in the dataset?
SELECT name, num_registered, year
FROM names 
ORDER BY num_registered DESC;

-- 4. What range of years are included?
SELECT MIN(year), MAX(year)
FROM names;
-- The years in the dataset run fro 1880 - 2018

-- 5. What year has the largest number of registrations?
SELECT MAX(num_registered) AS registrations, year
FROM names
GROUP BY year
ORDER BY MAX(num_registered) DESC; 
-- 1947 had the largest number of registrations.

-- 6. How many different (distinct) names are contained in the dataset?
SELECT COUNT(DISTINCT name)
FROM names;
-- There are 98,400 distinct names in the dataset

-- 7. Are there more males or more females registered?
SELECT SUM(num_registered) AS female_registered
FROM names
WHERE gender = 'F'; 
-- female = 174,079,232

SELECT SUM(num_registered) AS male_registered
FROM names
WHERE gender = 'M';
-- male = 177,573,793
-- There are 174,079,232 females and 177,573,793 males.

-- 8. What are the most popular male and female names overall (i.e., the most total registrations)?
SELECT name, SUM(num_registered) AS registrations
FROM names
GROUP BY name, gender
ORDER BY SUM(num_registered) DESC; 
-- I show the most popular male name is James and the most popular female name is Mary.

-- 9. What are the most popular boy and girl names of the first decade of the 2000s (2000 - 2009)?
SELECT name, SUM(num_registered) AS registrations
FROM names
WHERE year BETWEEN 2000 AND 2009 
GROUP BY name, gender
ORDER BY SUM(num_registered) DESC;
-- The most popular male name was Jacob and the most popular female name was Emily.

-- 10. Which year had the most variety in names (i.e. had the most distinct names)?
SELECT COUNT(DISTINCT name), year
FROM names
GROUP BY year
ORDER BY COUNT(DISTINCT name) DESC;
-- I show 2008 had the most variety in names.

-- 11. What is the most popular name for a girl that starts with the letter X?
SELECT name, SUM(num_registered) AS registrations
FROM names
WHERE name LIKE 'X%' AND gender = 'F'
GROUP BY name, gender
ORDER BY SUM(num_registered) DESC;
-- I show Ximena was the most popular name for a girl beginning with X

-- 12. How many distinct names appear that start with a 'Q', but whose second letter is not 'u'?
SELECT COUNT(DISTINCT name)
FROM names
WHERE name LIKE 'Q%' AND name NOT LIKE 'Qu%';
-- I come up with 46 distinct names meeting this criteria.

-- 13. Which is the more popular spelling between "Stephen" and "Steven"? Use a single query to answer this question.
SELECT COUNT(name = 'Stephen') AS stephen, COUNT(name = 'Steven') AS steven
FROM names;
What percentage of names are "unisex" - that is what percentage of names have been used both for boys and for girls?

How many names have made an appearance in every single year since 1880?

How many names have only appeared in one year?

How many names only appeared in the 1950s?

How many names made their first appearance in the 2010s?

Find the names that have not be used in the longest.

Come up with a question that you would like to answer using this dataset. Then write a query to answer this question.
