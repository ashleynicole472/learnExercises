SQL Country Database Challenges
Save your queries in a file if you want to keep them for posterity.

WHERE
What is the population of the US? (starts with 2, ends with 000)
    SELECT
    code,
    population
    FROM country
    WHERE name = 'United States';

What is the area of the US? (starts with 9, ends with million square miles)
    SELECT
    code,
    surfacearea
    FROM country
    WHERE name = 'United States';



List the countries in Africa that have a population smaller than 30,000,000 and a life expectancy of more than 45? (all 37 of them)
    SELECT
    code,
    lifeexpectancy,
    population,
    name
    FROM country
    WHERE continent = 'Africa'
    AND
    lifeexpectancy > 45
    AND
    population < 3e+7;


Which countries are something like a republic? (are there 122 or 143 countries or ?)
    SELECT
    code,
    name,
    governmentform
    FROM
    country
    WHERE
    governmentform = 'Republic';

//this is the answer. it was 143. The keyword was 143
        SELECT
    code,
    name,
    governmentform
    FROM
    country
    WHERE
    governmentform LIKE '%Republic%';




Which countries are some kind of republic and acheived independence after 1945?
    SELECT
    code,
    name,
    governmentform,
    indepyear
    FROM
    country
    WHERE
    governmentform LIKE '%Republic%'
    AND
    indepyear > 1945;

Which countries acheived independence after 1945 and are not some kind of republic?
    ORDER BY
    SELECT
    code,
    name,
    governmentform,
    indepyear
    FROM
    country
    WHERE
    governmentform NOT LIKE '%Republic%'
    AND
    indepyear > 1945;

Which fifteen countries have the lowest life expectancy? highest life expectancy?
    SELECT
    code,
    name,
    lifeexpectancy
    FROM
    country
    ORDER BY
    lifeexpectancy DESC

    SELECT
    code,
    name,
    lifeexpectancy
    FROM
    country
    ORDER BY
    lifeexpectancy ASC


Which five countries have the lowest population density? highest population density?

    SELECT
    code,
    name,
    population
    FROM
    country
    ORDER BY
    population asc
    LIMIT 15;

    HIGHEST
    'CHN','China',1277558000
    'IND','India',1013662000
    'USA','United States',278357000
    'IDN','Indonesia',212107000
    'BRA','Brazil',170115000

    LOWEST
    'IOT','British Indian Ocean Territory',0
    'BVT','Bouvet Island',0
    'ATA','Antarctica',0
    'HMD','Heard Island and McDonald Islands',0
    'SGS','South Georgia and the South Sandwich Islands',0

Which is the smallest country, by area and population? the 10 smallest countries, by area and population?
    SELECT
    code,
    name,
    surfacearea,
    population
    FROM
    country
    ORDER BY
    surfacearea,
    population ASC
    LIMIT 10;

Which is the biggest country, by area and population? the 10 biggest countries, by area and population?
    SELECT
    code,
    name,
    population,
    surfacearea
    FROM
    country
    ORDER BY
    population DESC,
    surfacearea DESC
    LIMIT 10;

WITH
Of the smallest 10 countries, which has the biggest gnp? (hint: use WITH and LIMIT)
    WITH smallestcountry AS
    (   SELECT
        code,
        name,
        surfacearea,
        gnp,
        population
        FROM
        country
        ORDER BY
        surfacearea ASC,
        population ASC
     LIMIT 10
        )
    SELECT
    gnp,
    name,
    population
    FROM
    smallestcountry
    ORDER BY
    gnp DESC;

Of the smallest 10 countries, which has the biggest per capita gnp?
    WITH smallestcountry AS
    (   SELECT
        code,
        name,
     	surfacearea,
     	population,
        surfacearea * population AS total_area,
        gnp,
     	population / gnp AS gnp_per_capita
        FROM
        country
     	WHERE
     	population > 0 AND gnp > 0
        ORDER BY
        surfacearea ASC,
        population ASC
     LIMIT 10)
    SELECT *
        FROM
        smallestcountry
        ORDER BY
        gnp_per_capita DESC;

Of the biggest 10 countries, which has the biggest gnp?
    WITH biggestcountry AS
    (   SELECT
        code,
        name,
        surfacearea,
        gnp,
        population
        FROM
        country
        ORDER BY
        surfacearea DESC,
        population DESC
     LIMIT 10
        )
    SELECT
    gnp,
    name,
    population
    FROM
    biggestcountry
    ORDER BY
    gnp DESC;

Of the biggest 10 countries, which has the biggest per capita gnp?
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
    *
    FROM
    biggestcountry
    ORDER BY
    gnp_per_capita DESC;

What is the sum of surface area of the 10 biggest countries in the world? The 10 smallest?
GROUP BY
How big are the continents in term of area and population?
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
