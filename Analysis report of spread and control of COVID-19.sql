-- ******************************
-- SLIDE 1 thrumnail page of ppt image
-- ******************************

-- ******************************
-- SLIDE 2
-- ******************************
SELECT MAX(total_cases), MAX(total_deaths) FROM combined_table WHERE location = 'World';

-- ******************************
-- SLIDE 3
-- ******************************
-- world
SELECT 
location,(max(population)/max(population))*100 as population_percentage,
(max(total_cases)/max(population))*100 as spread_rate,
(max(total_deaths)/max(population))*100 as death_rate,
(max(people_fully_vaccinated)/max(population))*100 as vaccination_rate
FROM combined_table
where location = "world"
GROUP BY location order by 2;

-- ******************************
-- SLIDE 4
-- ******************************
-- the top 3 countries of world(with the highest number population)
SELECT location,population
FROM 
(
select * from africa
union
select * from asia
union
select * from europe
union
select * from north_america
union
select * from oceania
union
select * from south_america
) as T group by 1,2 order by population desc limit 3 ;
-- top 3 countries of world(with the highest number of COVID-19 cases)
-- (total_cases_as_a_percentage_of_the_population)
SELECT location, MAX(total_cases) AS highest_cases
FROM africa
GROUP BY location
UNION ALL
SELECT location, MAX(total_cases) AS highest_cases
FROM asia
GROUP BY location
UNION ALL
SELECT location, MAX(total_cases) AS highest_cases
FROM europe
GROUP BY location
UNION ALL
SELECT location, MAX(total_cases) AS highest_cases
FROM north_america
GROUP BY location
UNION ALL
SELECT location, MAX(total_cases) AS highest_cases
FROM oceania
GROUP BY location
UNION ALL
SELECT location, MAX(total_cases) AS highest_cases
FROM south_america
GROUP BY location
ORDER BY highest_cases DESC
LIMIT 3;

-- ******************************
-- SLIDE 5
-- ******************************
-- united states
SELECT 
location,
(max(total_cases)/max(population))*100 as percentage_total_cases,
(max(total_deaths)/max(population))*100 as percentage_total_deaths,
(max(people_fully_vaccinated)/max(population))*100 as percentage_people_fully_vaccinated,
(max(population)/max(population))*100 as percentage_population
from north_america where location ="united states" group by location;
 -- ******************************
-- SLIDE 6
-- ******************************
 -- INDIA
SELECT 
location,
(max(total_cases)/max(population))*100 as percentage_total_cases,
(max(total_deaths)/max(population))*100 as percentage_total_deaths,
(max(people_fully_vaccinated)/max(population))*100 as percentage_people_fully_vaccinated,
(max(population)/max(population))*100 as percentage_population
from asia where location ="india" group by location;
-- China
SELECT 
location,
(max(total_cases)/max(population))*100 as percentage_total_cases,
(max(total_deaths)/max(population))*100 as percentage_total_deaths,
(max(people_fully_vaccinated)/max(population))*100 as percentage_people_fully_vaccinated,
(max(population)/max(population))*100 as percentage_population
from asia where location ="china" group by location;
-- ******************************
-- SLIDE 7
-- ******************************
-- income level classification
select location as income_level,
 MAX(total_cases)/ MAX(population) * 100 as spread_rate,
 max(total_deaths)/ MAX(population) * 100 as death_rate 
 from combined_table where location != "world" group by 1;
-- ******************************
-- SLIDE 8
-- ******************************
 select location as income_level,
 MAX(people_fully_vaccinated)/ MAX(population) * 100 as vaccinated
 from combined_table where location != "world" group by 1;
-- ******************************
-- SLIDE 9
-- ******************************
SELECT location,
max(total_deaths)/max(population)*100 as death_rate
FROM 
(
select * from africa
union
select * from asia
union
select * from europe
union
select * from north_america
union
select * from oceania
union
select * from south_america
) as T 
group by location order by 2 desc limit 10;

-- ******************************
-- SLIDE 10
-- SPREAD, Death & Vaccinations by Continent
-- ******************************

-- SPREAD
SELECT continent, MAX(total_cases) / MAX(population) * 100 as spread
FROM 
(
select * from africa
union
select * from asia
union
select * from europe
union
select * from north_america
union
select * from oceania
union
select * from south_america
) as T  
GROUP by 1;

-- Death Rate
SELECT continent, MAX(total_deaths) / MAX(population) * 100 as Death_rate
FROM
(
select * from africa
union
select * from asia
union
select * from europe
union
select * from north_america
union
select * from oceania
union
select * from south_america
) as T  
GROUP by 1;
-- Vaccination Rate
SELECT continent, MAX(total_vaccinations) / MAX(population) as Vaccination_rate
FROM
(
select * from africa
union
select * from asia
union
select * from europe
union
select * from north_america
union
select * from oceania
union
select * from south_america
) as T  
GROUP by 1;

-- ******************************
-- SLIDE 11
-- try it at power bi 
-- ******************************
select continent, max(total_cases) from
(
select * from africa
union
select * from asia
union
select * from europe
union
select * from north_america
union
select * from oceania
union
select * from south_america
) as T group by 1
order by 1;
-- /////////////// end
