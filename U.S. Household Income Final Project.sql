
# U.S. Household Income Final Project 

SELECT *
FROM us_household_income;

SELECT *
FROM us_household_income_statistics;

SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_household_income
GROUP BY State_Name
ORDER BY 3 DESC
LIMIT 10;

SELECT *
FROM us_household_income u
INNER JOIN us_household_income_statistics us
ON u.id = us.id
WHERE Mean <> 0;


SELECT u.State_Name, County, Type, `Primary`, Mean, Median
FROM us_household_income u
INNER JOIN us_household_income_statistics us
ON u.id = us.id
WHERE Mean <> 0;


SELECT u.State_Name, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM us_household_income u
INNER JOIN us_household_income_statistics us
ON u.id = us.id
WHERE Mean <> 0
GROUP BY u.state_name
ORDER BY 3 DESC
LIMIT 10;

SELECT Type, COUNT(TYPE), ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM us_household_income u
INNER JOIN us_household_income_statistics us
ON u.id = us.id
WHERE Mean <> 0
GROUP BY 1
HAVING COUNT(Type) > 100
ORDER BY 4 DESC
LIMIT 20;

SELECT *
FROM us_household_income
WHERE Type = 'Community';

SELECT u.State_Name, City, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM us_household_income u
JOIN us_household_income_statistics us
ON u.id = us.id
GROUP BY u.State_Name, City
ORDER BY ROUND(AVG(Mean),1) DESC;



