-- Create database
CREATE DATABASE IF NOT EXISTS walmartSales;
use walmartSales;

-- Create table
CREATE TABLE IF NOT EXISTS sales(
	invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    tax_pct FLOAT(6,2) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date_ DATETIME NOT NULL,
    time_ TIME NOT NULL,
    payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct FLOAT(11,4),
    gross_income DECIMAL(12,4),
    rating FLOAT(2,1)
);

Select * from sales;
Select 
   time,
      (Case
	   When 'time' Between "00:00:00" And "12:00:00" Then "Morning"
       When 'time' Between "12:01:00" And "16:00:00" Then "Afternoon"
       Else "Evening" End) as Time_of_day
       
	from sales;

Alter Table Sales Add column Time_of_day Varchar(20);

Select * from sales;

Update sales
set Time_of_day=(Case
	   When 'time' Between "00:00:00" And "12:00:00" Then "Morning"
       When 'time' Between "12:01:00" And "16:00:00" Then "Afternoon"
       Else "Evening" End);
Select date,dayname(date) from sales;

ALTER TABLE sales ADD COLUMN day_name VARCHAR(10);
Update sales set day_name=dayname(date);

Select * from sales;

Alter Table sales drop column date_;

Select * from sales;

SELECT
	date,
	MONTHNAME(date)
FROM sales;

ALTER TABLE sales ADD COLUMN month_name VARCHAR(10);

UPDATE sales SET month_name = MONTHNAME(date);

Select distinct city from sales;
Select distinct city,branch from sales;
Select count(distinct city) from sales;

Select payment,count(payment) as count from sales group by payment order by count desc;

Select customer_type,count(customer_type) as count__ from sales group by customer_type order by count__ desc;


select branch,city,sum(total) as totalrev from sales group by branch,city order by totalrev desc;

