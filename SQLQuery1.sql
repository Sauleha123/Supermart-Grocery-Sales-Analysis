create database SupermartDB

use SupermartDB

create table Supermart_Sales (
Order_ID VARCHAR(20),
Customer_Name NVARCHAR(100),
Category NVARCHAR(50),
Sub_Category NVARCHAR(50),
City NVARCHAR(50),
Order_Date NVARCHAR(20),
Region NVARCHAR(50),
Sales DECIMAL(10,2),
Discount DECIMAL(5,2),
Profit DECIMAL(10,2),
State NVARCHAR(50)
)

select * from Supermart_Sales

insert into Supermart_Sales(
Order_ID, Customer_Name, Category, Sub_Category, City, Order_Date, Region, Sales, Discount, Profit, State
)

select Order_ID, Customer_Name, Category, Sub_Category, City, Order_Date, Region, Sales, Discount, Profit, State
from [dbo].[Supermart Grocery Sales - Retail Analytics Dataset];

select * from Supermart_Sales

alter table Supermart_Sales
add OrderDate DATE

update Supermart_Sales
set OrderDate = try_convert(DATE, Order_Date, 101) 

alter table Supermart_Sales
drop column Order_Date

select * from Supermart_Sales

select count(*) from Supermart_Sales
select count(*) from [dbo].[Supermart Grocery Sales - Retail Analytics Dataset]

drop table [dbo].[Supermart Grocery Sales - Retail Analytics Dataset]


