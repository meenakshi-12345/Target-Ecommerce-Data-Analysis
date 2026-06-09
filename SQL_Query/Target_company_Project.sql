-- 1. Import the dataset and do usual exploratory analysis steps like checking the
-- structure & characteristics of the dataset:

-- 1. Data type of all columns in the "customers" table.




SELECT *
FROM my_project_on_target.customers 
LIMIT 10;

SELECT *
FROM my_project_on_target.geolocation
LIMIT 10;


-- 2. Get the time range between which the orders were placed. 

SELECT * FROM `my_project_on_target.orders`; 

SELECT MIN(order_purchase_timestamp) AS start_time, 

        MAX(order_purchase_timestamp) AS end_time 

        FROM `my_project_on_target.orders`;




-- 3. Display the details of Cities & States of customers who ordered during the given period.


SELECT * FROM `my_project_on_target.orders`;


SELECT * FROM `my_project_on_target.customers`; 


SELECT c.customer_city, c.customer_state
FROM my_project_on_target.customers c
JOIN my_project_on_target.orders o ON c.customer_id = o.customer_id
WHERE EXTRACT(YEAR FROM o.order_purchase_timestamp) = 2018
AND EXTRACT(MONTH FROM o.order_purchase_timestamp) BETWEEN 1 AND 3;


-- INSIGHTS : THESE ARE THE CUSTOMERS WITH THEIR CITY WHO ORDERD IN GIVEN TIME PERIOD 


-- 2. In-depth Exploration:-



-- 1. Is there a growing trend in the no. of orders placed over the past years?

SELECT * FROM `my_project_on_target.orders`;

SELECT EXTRACT(YEAR FROM order_purchase_timestamp) ,COUNT(order_id) 
FROM `my_project_on_target.orders`
GROUP BY EXTRACT(YEAR FROM order_purchase_timestamp);


-- INSIGHTS : SINCE 2016 THE SALES ARE GROWING EXPONENTIALLY WHICH IS A GOOD SIGN


-- Can we see some kind of monthly seasonality in terms of the no. of orders being placed? 


SELECT EXTRACT(MONTH FROM order_purchase_timestamp),COUNT(order_id) AS total_orders 
FROM `my_project_on_target.orders` 
GROUP BY EXTRACT(MONTH FROM order_purchase_timestamp)
ORDER BY COUNT(order_id) DESC;


-- INSIGHTS: AUGUST AND MAY ARE BEST PERFORMER MONTHS WHEREAS OCTOBER AND NOVEMBER ARE PERFORMING POORLY, REST ARE MODERATE PERFORMERS 



-- 3. During what time of the day, do the Brazilian customers mostly place
-- their orders? (Dawn, Morning, Afternoon or Night)
-- 0-6 hrs : Dawn
-- 7-12 hrs : Mornings
-- 13-18 hrs : Afternoon
-- 19-23 hrs : Night


SELECT 
CASE WHEN EXTRACT(HOUR FROM o.order_purchase_timestamp) BETWEEN 0 AND 6 THEN "Dawn"

     WHEN EXTRACT(HOUR FROM o.order_purchase_timestamp) BETWEEN 7 AND 12 THEN "Mornings"

     WHEN EXTRACT(HOUR FROM o.order_purchase_timestamp) BETWEEN 13 AND 18 THEN "Afternoon"

     ELSE "Night" 

     END AS time_of_the_day, COUNT(*)
    
    FROM  my_project_on_target.orders o 

    JOIN my_project_on_target.customers c ON o.customer_id = c.customer_id 

    GROUP BY time_of_the_day;


    -- INSIGHTS : IT CAN BE CLEARLY INTERPRETED THAT DURING AFTERNOON MOST ORDERS ARE PLACED FOLLOWED BY NIGHT AND --   --  MORNING, LEAST ORDERS ARE PLACED DURING DAWN



-- 3. Evolution of E-commerce orders in the Brazil region:


-- 1. Get the month on month no. of orders placed in each state.
      

      SELECT * FROM `my_project_on_target.orders`;


      SELECT * FROM `my_project_on_target.customers`; 



      SELECT c.customer_state,EXTRACT(YEAR FROM o.order_purchase_timestamp) as year,

      EXTRACT(MONTH FROM o.order_purchase_timestamp) as month, COUNT(*) AS order_count

      FROM my_project_on_target.customers c 

      JOIN my_project_on_target.orders o ON o.customer_id = c.customer_id

      GROUP BY c.customer_state, year ,month

      ORDER BY c.customer_state, year, month;


-- INSIGHTS : CAN CLEARLY OBSERVE DIFFERENT STATE'S ORDER COUNT FOR DIFFERENT MONTHS AND YEARS



-- 2. How are the customers distributed across all the states?



      SELECT * FROM `my_project_on_target.orders`;


      SELECT * FROM `my_project_on_target.customers`; 



      SELECT customer_state, COUNT(DISTINCT(customer_id)) AS customer_count 
      FROM `my_project_on_target.customers` 
      GROUP BY customer_state
      ORDER BY customer_count DESC;



-- INSIGHTS : STATE SP (São Paulo) HAS HIGHEST NUMBER OF UNIQUE CUSTOMERS WHEREAS RR (Roraima) HAS LOWEST NUMBER OF CUSTOMERS 





-- 4. Impact on Economy: Analyze the money movement by e-commerce by looking at order prices, freight and others.


-- 1. Get the % increase in the cost of orders from year 2017 to 2018
-- (include months between Jan to Aug only).


WITH yearly_cost AS (

SELECT EXTRACT(YEAR FROM o.order_purchase_timestamp) AS year, SUM(p.payment_value) AS total_cost 

FROM my_project_on_target.orders o

JOIN my_project_on_target.payments p ON o.order_id = p.order_id 

WHERE EXTRACT(YEAR FROM o.order_purchase_timestamp) IN (2017,2018) AND EXTRACT(MONTH FROM o.order_purchase_timestamp) 

BETWEEN 1 AND 8

GROUP BY year

),

yearly_comparison AS (


SELECT year,total_cost, 

LEAD(total_cost) OVER(ORDER BY year DESC) AS prev_year_payment

FROM yearly_costs

)

SELECT ROUND(((total_cost-prev_year_payment)/prev_year_payment)*100,2) ;


-- INSIGHTS: WE HAVE MORE THAN 100% INCREASE IN COST FROM PREVIOUS YEAR 



-- 2. Calculate the Total & Average value of order price for each state.



SELECT c.customer_state, ROUND(SUM(q.price),2) AS total, ROUND(AVG(q.price),2) AS average

FROM my_project_on_target.customers c

JOIN  my_project_on_target.orders o ON c.customer_id = o.customer_id 

JOIN  my_project_on_target.order_items q ON o.order_id = q.order_id 

GROUP BY c.customer_state

ORDER BY total DESC,average DESC;


-- INSIGHTS : STATE SP LEADS WHEN IT COMES TO TOTAL ORDER PRICE WHEREAS PB LEADS IN TERMS OF AVERAGE PRICE



-- 3. Calculate the Total & Average value of order freight for each state.


-- ORDER_ITEMS - FREIGH 


SELECT c.customer_state, ROUND(SUM(q.freight_value),2) AS total, ROUND(AVG(q.freight_value),2) AS average

FROM my_project_on_target.customers c

JOIN  my_project_on_target.orders o ON c.customer_id = o.customer_id 

JOIN  my_project_on_target.order_items q ON o.order_id = q.order_id 

GROUP BY c.customer_state;



-- INSIGHTS : WE CAN CLEARLY INTERPRET THE STATE WITH HIGHEST TOTAL FREIGHT VALUE AND AVERAGE FREIGHT VALUE 



-- 5. Analysis based on sales, freight and delivery time.


-- 1. Find the no. of days taken to deliver each order from the order’s purchase date as delivery time.
-- Also, calculate the difference (in days) between the estimated & actual
-- delivery date of an order.
-- Do this in a single query.
-- You can calculate the delivery time and the difference between the
-- estimated & actual delivery date using the given formula:

--  time_to_deliver = order_delivered_customer_date - order_purchase_timestamp
--  diff_estimated_delivery = order_delivered_customer_date - order_estimated_delivery_date


SELECT order_id, DATE_DIFF(order_delivered_customer_date, order_purchase_timestamp, DAY) AS days_diff,

DATE_DIFF(order_delivered_customer_date, order_estimated_delivery_date, DAY) AS days_estimated_diff

FROM `my_project_on_target.orders`;



-- INSIGHTS : WE CAN CHECK IF PRODUCTS ARE ON TIME OR DELAYED USING IT'S OUTPUT




-- 2. Find out the top 5 states with the highest & lowest average freight value.



(
SELECT c.customer_state, ROUND(AVG(q.freight_value),2) AS average

FROM my_project_on_target.customers c

JOIN  my_project_on_target.orders o ON c.customer_id = o.customer_id 

JOIN  my_project_on_target.order_items q ON o.order_id = q.order_id 

GROUP BY c.customer_state

ORDER BY average DESC

LIMIT 5)


UNION ALL



(

SELECT c.customer_state, ROUND(AVG(q.freight_value),2) AS average

FROM my_project_on_target.customers c

JOIN  my_project_on_target.orders o ON c.customer_id = o.customer_id 

JOIN  my_project_on_target.order_items q ON o.order_id = q.order_id 

GROUP BY c.customer_state

ORDER BY average ASC

LIMIT 5);




-- INSIGHTS : WE CAN CHECK THE FREIGHT VALUE FLUCTUATION FROM STATE TO STATE 



-- 3. Find out the top 5 states with the highest & lowest average delivery time.




SELECT c.customer_state, AVG(EXTRACT(DATE FROM o.order_delivered_customer_date) - EXTRACT(DATE FROM o.

order_purchase_timestamp)) AS avg_time_to_deliver 

FROM my_project_on_target.customers c

JOIN  my_project_on_target.orders o ON c.customer_id = o.customer_id 

JOIN  my_project_on_target.order_items q ON o.order_id = q.order_id 

GROUP BY c.customer_state

ORDER BY avg_time_to_deliver DESC

LIMIT 5



 
-- INSIGHTS : STATE BY STATE AVERAGE TIME OF DELIVERY 



-- 6. Analysis based on the payments:



-- 1. Find the month on month no. of orders placed using different payment types.



SELECT payment_type, 

EXTRACT(YEAR FROM order_purchase_timestamp) AS year, 

EXTRACT(MONTH FROM order_purchase_timestamp ) AS month, 

COUNT(DISTINCT o.order_id)  AS order_count 

FROM my_project_on_target.orders o

JOIN my_project_on_target.payments p 

ON o.order_id = p.order_id 

GROUP BY payment_type, year,month 

ORDER BY payment_type, year, month 


-- INSIGHTS : WE CAN FIND WHICH PAYMENT METHOD IS MORE PREFFERED NOW 




-- 2. Find the no. of orders placed on the basis of the payment installments that have been paid.




SELECT p.payment_installments ,COUNT(DISTINCT(o.order_id))

FROM my_project_on_target.payments p

JOIN my_project_on_target.orders o  ON p.order_id = o.order_id 

WHERE payment_installments = 1

GROUP BY p.payment_installments



-- INSIGHTS : THERE ARE ON TOTAL 49060 orders that have been paid in 1 installment 