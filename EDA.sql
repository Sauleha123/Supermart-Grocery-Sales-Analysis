-- Total Sales & Profit
select
sum(Sales) as Total_Sales,
sum(Profit) as Total_Profit,
avg(Discount) as Avg_Discount
from Supermart_Sales
/* Insights: 
- The business generated nearly 15M in sales over the given period.
- Profitability stands at ~3.75M, which indicates a profit margin of ~25%.
- The average discount is 22.7%, which is relatively high. This could impact profit margins, 
  especially for categories with lower profit margins.
*/


-- Sales by Region
select 
Region,
sum(Sales) as Total_Sales,
sum(Profit) as Total_Profit
from Supermart_Sales
group by Region
order by Total_Sales desc
/* Insights:
- West and East Regions are the top-performing regions.
- Central & South Regions contribute moderately.
- North Region shows negligible sales.
*/


-- Top 10 City by Sales
select top 10
City,
sum(Sales) as Total_Sales,
sum(Profit) as Total_Profit
from Supermart_Sales
group by City
order by sum(Sales) desc
/*
Insights: 
- Kanyakumari, Vellore & Bodi are the top revenue drivers.
- Small cities like Karur, Tirunelveli, and Pudukottai also show strong sales.
- Sales are concentrated in a few high-performing cities.
*/


-- Sales by Category & Sub-Category
select 
Category,
Sub_Category,
sum(Sales) as Total_Sales,
sum(Profit) as Total_Profit
from Supermart_Sales
group by Category, Sub_Category
order by Total_Sales desc
/*
Insights:
- Beverages (Health Drinks, Soft Drinks) lead in sales.
- Snacks & Bakery items are strong performers.
- Oil & Masala shows steady contribution.
- Eggs, Meat, & Fish drive high protein demand.
- Organic Fruits & Vegetables highlight health-focused buying.
*/


-- Monthly Trend of Sales
select 
year(OrderDate) as Year,
month(OrderDate) as Month,
sum(Sales) as Monthly_Sales
from Supermart_Sales
group by year(OrderDate), month(OrderDate)
order by Year, Month
/*
Insights: 
- Sales show a clear seasonal peak in Sept-Dec each year, especially Nov & Dec (festival/holiday effect).
- 2015 started low, but sales steadily grew year by year.
- 2017 & 2018 show strong growth, with 2018 reaching the highest sales (Sept-Dec crossing 600k+ consistently).
- Sales are lowest in Jan-Feb every year, showing a post-festival dip.
*/


-- Top 10 Customers by Sales
select top 10
Customer_Name,
sum(Sales) as Total_Sales,
sum(Profit) as Total_Profit
from Supermart_Sales
group by Customer_Name
order by Total_Sales desc
/*
Insights: 
- Krithika leads in sales (334k) and profit (85k), showing strong customer value.
- Sales are closely distributed among the top 10, all between 312k-334k.
- Customers like Arutra, Vidya, and Surya show higher profit margins compared to others with similar sales.
- These top 10 customers contribute a significant share of revenue and profit, making them key accounts to retain.
*/


-- Profitability by Discount Buckets
select 
case 
	when Discount = 0 then 'No Discount'
	when Discount between 0.01 and 0.10 then 'Low (0-10%)'
	when Discount between 0.11 and 0.20 then 'Medium (11-20%)'
	when Discount between 0.21 and 0.35 then 'High (21-35%)'
end as Discount_Range,
sum(Sales) as Total_Sales,
sum(Profit) as Total_Profit
from Supermart_Sales
group by 
case 
	when Discount = 0 then 'No Discount'
	when Discount between 0.01 and 0.10 then 'Low (0-10%)'
	when Discount between 0.11 and 0.20 then 'Medium (11-20%)'
	when Discount between 0.21 and 0.35 then 'High (21-35%)'
end 
order by Total_Sales desc
/*
Insights: 
- High Discounts (21-35%) drive the most sales (8.8M) but also bring the highest profit (2.2M).
- Medium discounts (11-20%) contribute strongly (5.5M sales, 1.39M profit), showing a healthy balance.
- Low discounts (0-10%) generate very little sales (0.53M), indicating customers prefer bigger discounts.
- No orders were placed without discounts.
*/