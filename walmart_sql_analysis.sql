create database walmart_db;
use  walmart_db;
select * from walmart_data;

select count(*) from walmart_data;


-- Basic Data Analysis
-- 1. Total Revenue
select round(sum(total_price),2) as total_revenue from walmart_data;

-- 2. Number of unique Branches
 select  count(distinct branch) from walmart_data;
 
 -- 3. Most common payment method
 select payment_method,count(*) as count
 from walmart_data
 group by payment_method
 order by count desc;
 
 -- Average rating
 select round(avg(rating),2)
 from walmart_data;
 
 -- Business Problems
 -- 1. What are the different payment methods, and how many transactions and total items were sold with each method?
 SELECT 
    payment_method,
    COUNT(*) AS no_of_transactions,
    SUM(quantity) AS total_items_sold
FROM
    walmart_data
GROUP BY payment_method
ORDER BY no_of_transactions DESC;
 
 -- 2 Which product category has the highest average rating in each branch?
 select * from(
 select branch,category, round(avg(rating),2) as avg_rating,
 rank() over(partition by branch order by round(avg(rating),2) desc) as ranks
 from walmart_data
 group by branch,category
 order by branch,avg_rating desc) as ranked_categories
 where ranks = 1;
 
 -- 3 What is the busiest day of the week for each branch based on transaction count?
SELECT *
FROM (
    SELECT 
        branch,
        DAYNAME(date) AS day,
        COUNT(*) AS no_of_transactions,
        RANK() OVER (PARTITION BY branch ORDER BY COUNT(*) DESC) AS ranks
    FROM walmart_data
    GROUP BY branch, DAYNAME(date)
) AS ranked_days
WHERE ranks =1 ;

-- 4. Which branch has the highest and lowest total sales?
-- Highest total sales
SELECT 
    branch,
    ROUND(SUM(unit_price * quantity), 2) AS highest_sales
FROM 
    walmart_data
GROUP BY 
    branch
ORDER BY 
    highest_sales DESC
LIMIT 1;



-- Lowest total sales
SELECT 
    branch,
    ROUND(SUM(unit_price * quantity), 2) AS lowest_sales
FROM 
    walmart_data
GROUP BY 
    branch
ORDER BY 
    lowest_sales ASC
LIMIT 1;

-- 5. Which product category generates the highest total profit in each city?
SELECT 
    city,
    category,
    total_profit
FROM 
(SELECT city, category, 
      round( SUM(total_price * profit_margin),2) AS total_profit,
      RANK() OVER (PARTITION BY city ORDER BY SUM(unit_price * quantity * profit_margin) DESC) AS rank_in_city
FROM walmart_data
GROUP BY city, category)
AS ranked_data
WHERE rank_in_city = 1
ORDER BY city;

-- 6. Determine the off-peak shopping hours
select hour(time) as hrs, count(*) as transaction_count
from walmart_data
group by hrs
order by transaction_count ;

-- 7. What is the total sales amount for weekdays vs weekends?
SELECT 
    CASE 
        WHEN DAYNAME(date) IN ('Saturday', 'Sunday') THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    round(SUM(total_price),2) AS total_sales
FROM walmart_data
GROUP BY day_type
order by total_sales desc;

-- 8.  Which day of the week generates the highest total sales across all branches?
SELECT 
    DAYNAME(date) AS day_of_week,
    ROUND(SUM(total_price), 2) AS total_sales
FROM 
    walmart_data
GROUP BY 
    DAYNAME(date)
ORDER BY 
    total_sales DESC;
    
    
    
    -- 9. How have customer ratings changed over time (monthly or yearly)?
   SELECT 
    YEAR(date) AS year,
    MONTH(date) AS month,
    ROUND(AVG(rating), 2) AS avg_rating
FROM
    walmart_data
GROUP BY year , month
ORDER BY year , month;


