-- Q1: How many total customers are there?
SELECT COUNT(*) AS total_customers FROM customers;

-- Q2: How many customers are there in each country?
SELECT country, COUNT(*) AS customer_count FROM customers 
GROUP BY country ORDER BY customer_count DESC;

-- Q3: Top 5 cities with highest number of customers
SELECT city, COUNT(*) AS customer_count FROM customers
GROUP BY city ORDER BY customer_count DESC
LIMIT 5;

-- Q4: How many unique countries and cities?
SELECT COUNT(DISTINCT country) AS total_countries,
COUNT(DISTINCT city) AS total_cities FROM customers;

-- Q5: Customers from India
SELECT * FROM customers WHERE country = 'India';

-- Q6: Customers whose city starts with 'S'
SELECT * FROM customers WHERE city LIKE 'S%';

-- Q7: Countries having more than 50 customers
SELECT country, COUNT(*) AS customer_count FROM customers
GROUP BY country HAVING COUNT(*) > 50
ORDER BY customer_count DESC;

-- Q8: Countries with above-average customer count
SELECT country, COUNT(*) AS customer_count
FROM customers GROUP BY country
HAVING COUNT(*) > (SELECT AVG(country_count)
FROM (SELECT COUNT(*) AS country_count FROM customers 
GROUP BY country) AS avg_table);
