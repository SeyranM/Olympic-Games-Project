-- Let's see what countries partisipated in both winter and summer olympic games using self-join.
SELECT DISTINCT g1.country_id
FROM games AS g1
INNER JOIN games AS g2
ON g1.country_id = g2.country_id
AND g1.year = g2.year - 2;

-- We got country_id. To see what countries they are, we have to use subquery in where statement.
SELECT country
FROM countries
WHERE id IN(
SELECT DISTINCT g1.country_id
FROM games AS g1
INNER JOIN games AS g2
ON g1.country_id = g2.country_id
AND g1.year = g2.year - 2);

-- Let's see gold medal winners' names in summer(2016) olympic games using left join.
SELECT g.medal AS gold_medal, a.name AS athlete
FROM games AS g
LEFT JOIN athletes AS a
ON g.athlete_id = a.id
WHERE medal = 'Gold'
AND year = 2016;

-- Gold medal winner country ids(using group by).
SELECT country_id, COUNT(*) AS gold_medals
FROM games
WHERE medal = 'Gold'
GROUP BY country_id;

-- Gold medal winner country names (using subquery in from statement).
SELECT country, subquery.gold_medals
FROM countries,
(SELECT country_id, COUNT(*) AS gold_medals
FROM games
WHERE medal = 'Gold'
GROUP BY country_id) AS subquery
WHERE countries.id = subquery.country_id;

-- Youngest and eldest partisipants' ages (using partition by).
SELECT DISTINCT gender,
MIN(age) OVER (PARTITION BY gender) AS min_age,
MAX(age) OVER (PARTITION BY gender) AS max_age
FROM athletes;

-- View
DROP VIEW IF EXISTS Gold_medal_winners;
CREATE VIEW Gold_medal_winners AS
SELECT country, subquery.gold_medals
FROM countries,
(SELECT country_id, COUNT(*) AS gold_medals
FROM games
WHERE medal = 'Gold'
GROUP BY country_id) AS subquery
WHERE countries.id = subquery.country_id;

SELECT *
FROM Gold_medal_winners;
