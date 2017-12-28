What is the sum of surface area of the 10 biggest countries in the world? The 10 smallest?
WITH biggestcountry AS
  (   SELECT
      code,
      name,
      surfacearea,
      gnp,
      population,
      population / gnp AS gnp_per_capita
      FROM
      country
      WHERE
      population > 0 AND gnp > 0
      ORDER BY
      surfacearea DESC,
      population DESC
   LIMIT 10
      )
      SELECT
      SUM(surfacearea)
      FROM
      biggestcountry

**GROUP BY**
How big are the continents in term of area and population?
  WITH thesum AS (SELECT
  quantity
  FROM
  orderdetails
  ORDER BYo
  quantity DESC
  LIMIT 10)
  SELECT
  SUM(quantity)
  FROM
  thesum;
Which region has the highest average gnp?
Who is the most influential head of state measured by population?
Who is the most influential head of state measured by surface area?
What are the most common forms of government? (hint: use count(*))
What are the forms of government for the top ten countries by surface area?
What are the forms of government for the top ten richest nations? (technically most productive)
What are the forms of government for the top ten richest per capita nations? (technically most productive)
Interesting...
Which countries are in the top 5% in terms of area?
(hint: use a SELECT in a LIMIT clause)

When is the database from?

Stretch Challenges
What is the 3rd most common language spoken?
How many cities are in Chile?
What is the total population in China?
How many countries are in North America?
Which countries gained their independence before 1963?
What is the total population of all continents?
What is the average life expectancy for all continents?
Which countries have the letter z in the name? How many?
What is the age of Jamaica?
Are there any countries without an official language? Hint: WHERE ... NOT IN ( SELECT ... FROM ... WHERE ...)
