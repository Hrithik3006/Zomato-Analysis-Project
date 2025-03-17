select * from main;
select * from country;
select * from currency;


select count('restaurant name') from main;

/*---------------------------------------------------------------------------------------------------------------------------------*/

/*4.Find the Numbers of Resturants based on City and Country*/

select city,count('restaurantid') from main
group by city;

select countryname,count('restaurantid') from main
group by countryname;

/*---------------------------------------------------------------------------------------------------------------------------------*/

/*5.Numbers of Resturants opening based on Year , Quarter , Month*/

SELECT Year, COUNT(*) AS Number_of_Restaurants
FROM main
GROUP BY Year
ORDER BY Year;
-------------------------------------------------------------------------------------------------------------------------------------
SELECT Month,COUNT(*) AS Number_of_Restaurants
FROM main
GROUP BY Month
ORDER BY Month;
------------------------------------------------------------------------------------------------------------------------------------
SELECT Quater, COUNT(*) AS RestaurantCount
FROM main
WHERE Quater IS NOT NULL
GROUP BY Quater
ORDER By Quater;
/*--------------------------------------------------------------------------------------------------------------------------------*/
/*6.Count of Resturants based on Average Ratings*/

SELECT Rating AS IndividualRating,COUNT(*) AS RestaurantCount
FROM main
WHERE Rating IS NOT NULL
GROUP BY Rating
ORDER BY Rating ASC;
/*----------------------------------------------------------------------------------------------------------------------------------*/
/*7.BUCKET WISE COST OF RESTAURANT*/

SELECT cost_range,count(*) as Total_Restaurant
FROM(
SELECT CASE
WHEN Average_Cost_for_two BETWEEN 0 AND 300 THEN '0-300'
WHEN Average_Cost_for_two BETWEEN 301 AND 600 THEN '301-600'
WHEN Average_Cost_for_two BETWEEN 601 AND 1000 THEN '601-1000'
WHEN Average_Cost_for_two BETWEEN 1001 AND 430000 THEN '1001-430000'
ELSE 'Other'
END AS COST_RANGE
FROM MAIN)AS SUBQUERY
group by COST_RANGE;
/*---------------------------------------------------------------------------------------------------------------------------------*/
/*8.Percentage of Resturants based on "Has_Table_booking".*/

select Has_Table_booking, 
count(*) as Total_Restaurant,
round((count(*) / (select count(*) from main)) * 100, 2) as Percentage
from main
group by Has_Table_booking;

/*---------------------------------------------------------------------------------------------------------------------------------*/
/*9.Percentage of Resturants based on "Has_Online_delivery*/

select Has_Online_delivery, 
count(*) as Total_Restaurant,
round((count(*) / (select count(*) from main)) * 100, 2) as Percentage
from main
group by Has_Online_delivery;
/*-----------------------------------------------------------------------------------------------------------------------------------*/
/* Total cuisines*/

select cuisines,count(cuisines)
from main
group by Cuisines;
/*---------------------------------------------------------------------------------------------------------------------------------*/

/*11.KPI OF COUNTRY.CITY,CUISINES,RESTAURANT,AVERAGE RATING*/

select 
COUNT(DISTINCT City) AS Total_City, 
COUNT(DISTINCT Countryname) AS Total_Country, 
COUNT(DISTINCT Cuisines) AS Total_Cuisines, 
COUNT(RestaurantID) AS Total_Restaurant, 
round(AVG(Rating), 2) AS Average_Rating
from main;

/*-----------------------------------------------END----------------------------------------------------------------------------*/


