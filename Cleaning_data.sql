select count(*) as Total_Rows from Supermart_Sales

select * from Supermart_Sales
-- Check for Null/Missing Values
select 
sum(case when Order_ID is null then 1 else 0 end) as Missing_OrderID,
sum(case when Customer_Name is null then 1 else 0 end) as Missing_Customer,
sum(case when Category is null then 1 else 0 end) as Missong_Category,
sum(case when Sub_Category is null then 1 else 0 end) as Missing_Sub_Category,
sum(case when City is null then 1 else 0 end) as Missing_City,
sum(case when Region is null then 1 else 0 end) as Missing_Region,
sum(case when Sales is null then 1 else 0 end) as Missing_Sales,
sum(case when Discount is null then 1 else 0 end) as Missing_Discount,
sum(case when Profit is null then 1 else 0 end) as Missing_Profit,
sum(case when State is null then 1 else 0 end) as Missing_State,
sum(case when OrderDate is null then 1 else 0 end) as Missing_OrderDate
from Supermart_Sales


-- Check for Duplicates
select Order_ID, count(*) as Occurrences
from Supermart_Sales
group by Order_ID
having count(*) > 1


-- Check for negative or zero values
select * 
from Supermart_Sales
where Sales <= 0 or Profit< 0 or Discount < 0 or Discount > 1


