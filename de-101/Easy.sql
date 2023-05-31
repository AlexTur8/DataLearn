-- Total Sales
select 
   to_char(ship_date, 'MM-YYYY') as "month-year", 
   round(sum(sales)) as revenue
from orders
where to_char(ship_date, 'YYYY') = '2019'
group by to_char(ship_date, 'MM-YYYY')
order by to_char(ship_date, 'MM-YYYY')


-- Total Profit
select 
   to_char(ship_date, 'YYYY') as "year", 
   round(sum(profit)) as profit
from orders
group by to_char(ship_date, 'YYYY')
order by to_char(ship_date, 'YYYY')


-- Profit Ratio
select 
   to_char(ship_date, 'YYYY') as "year", 
   round(sum(profit)) as profit, 
   round(sum(sales)) as revenue,
   round(sum(profit)/sum(sales), 2) as profit_ratio
from orders
group by to_char(ship_date, 'YYYY') 
order by to_char(ship_date, 'YYYY')


-- Profit per Sub-Category
select 
   subcategory, 
   round(sum(profit)) as profit
from orders
where to_char(ship_date, 'YYYY') = '2020'
group by subcategory
order by profit desc

--Sales per Customer
select 
   Customer_Name, 
   round(sum(sales)) as sales,
   sum(quantity) as quantity
from orders
where to_char(ship_date, 'YYYY') = '2019'
group by Customer_Name
order by sales desc



--Avg. Discount
select  
   round(avg(discount), 3) as discount
from orders
where to_char(ship_date, 'YYYY') = '2019' and caegory like '%urnit%'


--Monthly Sales by Segment 
select 
   to_char(ship_date, 'MM-YYYY') as "month-year",
   segment,
   round(sum(sales)) as revenue
from orders
where to_char(ship_date, 'YYYY') = '2019'
group by to_char(ship_date, 'MM-YYYY'), segment
order by to_char(ship_date, 'MM-YYYY'), revenue desc



--Monthly Sales by Product Category 
select 
   to_char(ship_date, 'MM-YYYY') as "month-year",
   category,
   round(sum(sales)) as revenue
from orders
where to_char(ship_date, 'YYYY') = '2020'
group by to_char(ship_date, 'MM-YYYY'), category
order by to_char(ship_date, 'MM-YYYY'), revenue desc