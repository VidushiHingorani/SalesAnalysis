-- SQL retail Sales Analytics - P1
CREATE DATABASE sql_project_p2;


--Create TABLE
DROP TABLE IF EXISTS retail_sales;
CREATE TABLE retail_sales
(
transactions_id	INT PRIMARY KEY,
sale_date	DATE,
sale_time	TIME,
customer_id INT,
gender	VARCHAR(15),
age	INT,
category VARCHAR(15),
quantiy	INT,
price_per_unit FLOAT, 	
cogs FLOAT,
total_sale FLOAT
);

--Data Cleaning

SELECT *
FROM retail_sales;

SELECT * 
FROM retail_sales
WHERE transactions_id is Null or
sale_date IS NULL OR 
sale_date IS NULL OR 
gender is NULL OR 
sale_time is NUll or 
customer_id is null or 
age is null or 
category is null or
quantiy is null or
price_per_unit is null or
cogs is null or
total_sale is null;

DELETE FROM retail_sales
WHERE transactions_id is Null or
sale_date IS NULL OR 
sale_date IS NULL OR 
gender is NULL OR 
sale_time is NUll or 
customer_id is null or 
age is null or 
category is null or
quantiy is null or
price_per_unit is null or
cogs is null or
total_sale is null;

-- Data Exploration

-- What was the total number of sale?

SELECT COUNT(*) as total_sales
From retail_sales;

-- What is total number of unique customers?

SELECT COUNT(distinct(customer_id))
From retail_sales;

--What are the categories?

SELECT DISTINct(category)
From retail_sales;

--Data analytics/Business Key Problems

--Question 1: find out all the sales made on 2022-11-05


SELECT *
FROM retail_sales
WHERE sale_date ='2022-11-05';

--Question 2: transaction category is clothing and quantity sold is more than 10 for the month of Nov 2022

SELECT *
FROM retail_sales
WHERE category ='Clothing' AND TO_CHAR(sale_date,'YYYY-MM') = '2022-11' AND quantiy >=4;

-- calculate sales for each category
SELECT category, sum(total_sale) AS Net_Sales
FROM retail_sales
GROUP BY category;

--average age of customers who purchased items from beauty catergory
SELECT round(avg(age)) AS average_age 
FROM retail_sales
WHERE category='Beauty';

---total sale is greater than 1000
SELECT *
from retail_sales
Where total_sale >1000;

--total number of transactions (transaction_id) made by each gender in each category
Select count(*) AS total_transaction, category, gender
from retail_sales
GROUP BY category,gender
ORDER BY category;

--average sale for each month. find out best selling month in each year.

Select round(avg(total_sale)) as average_sale, EXTRACT(YEAR from sale_date) as year, EXTRACT(Month from sale_date) as month
From retail_sales
group by year, month
order by year, average_sale desc;

--top 5 customers based on highest total sales

Select customer_id, sum(total_sale) as total_sale
From retail_sales
group by customer_id
order by total_sale desc,
limit 5;

--number of unique customers who purchased items from each category
select count(distinct(customer_id)) as unique_customer, category
from retail_sales
group by category;

--end of project