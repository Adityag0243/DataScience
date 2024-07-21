create database activity2;
use activity2;
select * from carsales;

select Make,Model,SalePrice
from carsales;

select * 
from carsales
where  CountryName = 'United Kingdom' and SalePrice > 90000;

select * 
from carsales
where Make = 'Rolls Royce' or Make = 'Aston Martin';


select * 
from carsales
order by SalePrice desc;



-- where Model starts with 'Silver'.
select * 
from carsales
where Model like 'Silver%';

--  where Region is either 'East Midlands' or 'Greater London Authority'.
select * 
from carsales
where Region in ('East Midlands' ,'Greater London Authority');


-- Retrieve all records where SalePrice is between 80000 and 100000.
select * 
from carsales
where SalePrice >= 80000 and SalePrice<= 100000;


select * 
from carsales
where TotalDiscount is NOT NULL;


-- 13. Retrieve Make, Model, and the difference between SalePrice and CostPrice as Profit.
select Make, Model, (SalePrice - CostPrice) as Profit
from carsales;

-- don't know whether correct or not
select sum(SalePrice) as Total_sum_of_saleprice
from carsales;


select avg(SalePrice) as Total_sum_of_saleprice
from carsales;

-- 16. Retrieve the count of cars sold per Make.

select make,count(make) as count_of_car_sold
from carsales
group by Make;

-- 17. Retrieve the makes where the average SalePrice is greater than 90000.


-- don't know how to segrregate data based no average sale that 90k but this data shows each avg salesprice > 90k
select Make,avg(SalePrice) as AvgSalePrice 
from carsales 
group by Make
order by Make desc;



-- 18. Retrieve Make, Model, and the same for another car in the same CountryName.
 -- don't know
-- 19. Retrieve Make, Model, and the total number of cars sold for each Make.

select Make,Model,count(Make) as total_no_of_cars_sold
from carsales 
group by Make;

select make,Model,count(make) as count_of_car_sold
from carsales
group by Make,model;

--  where SalePrice is greater than the average SalePrice of all cars.

select avg(SalePrice) as avg_of_saleprice
from carsales;

-- got 69360.9190 as average of all salespriceusing this 
select * 
from carsales
where SalePrice> 69360.9190;



-- 1. Retrieve all records where SalePrice is greater than CostPrice.



-- 2.Retrieve all records where CountryName is 'United Kingdom' and SalePrice is greater than 80000.

select * 
from carsales
where CountryName = 'United Kingdom' and SalePrice >80000;

-- 3. Retrieve all records where Make is 'Rolls Royce' or Color is 'Red'.


select * 
from carsales
where Make = 'Rolls Royce' or Color = 'Red';

-- 4. Retrieve all records and order them by CountryName and SalePrice in descending order.


select * 
from carsales
order by CountryName,SalePrice desc;

-- 5. Retrieve distinct Color values from the CarSales table.

-- 6. Retrieve all records where Make contains 'Royce'.

select *
from carsales
where Make like '%Royce%';


-- 7. Retrieve all records where Make is either 'Aston Martin' or 'Rolls Royce'.
select *
from carsales
where Make in ('Aston Martin' , 'Rolls Royce');




-- 8. Retrieve all records where InvoiceDate is between '2012-01-01' and '2012-12-31'.
select *
from carsales
where InvoiceDate between '2012-01-01' and '2012-12-31';

-- 9. Retrieve all records where IsDealer is NULL.\
select *
from carsales
where TotalDiscount is NOT NULL;

-- 10. Retrieve all records where TotalDiscount is NOT NULL.



-- 11. Retrieve Make, Model, and the sum of SalePrice and DeliveryCharge as TotalCost.
select Make, Model,(SalePrice - DeliveryCharge) as TotalCost
from carsales;

-- 12. Retrieve the top 10 most expensive cars based on SalePrice.


-- 13. Retrieve all records where Model ends with 'Ghost'.
select * 
from carsales
where Model like '%Ghost';

-- 14. Retrieve all records where the length of Region is greater than 10 characters.

select * 
from carsales
where length(Region)>10;

-- 15. Retrieve all records where the difference between SalePrice and CostPrice is greater than 10000.

select * 
from carsales
where (SalePrice-CostPrice) > 10000;

-- 16. Retrieve all records where CountryName is not 'United Kingdom'.
select * 
from carsales
where CountryName != 'United Kingdom';

-- 17. Retrieve Make, Model, and calculate the profit (SalePrice - CostPrice) as Profit.

select Make, Model,(SalePrice - CostPrice) as Profit
from carsales;


-- 18. Retrieve all records where the year of InvoiceDate is 2012.

select *
from carsales
where year(InvoiceDate) = '2012';

-- 19. Retrieve all records where CountryName is 'United Kingdom' and (SalePrice > 80000 or Color ='Red').

select *
from carsales
where CountryName = 'United Kingdom' and (SalePrice > 80000 or Color ='Red');


-- 20. Retrieve Make and Model with all characters in uppercase.

select distinct upper(Make),upper(Model)
from carsales;




-- 1.all records where the SalePrice is greater than CostPrice and the TotalDiscount is greater than 500, but only if the Color is not 'Red'.
select *
from carsales
where SalePrice > CostPrice and TotalDiscount > 500 and color != "Red";

-- 2.where either the Make is 'Rolls Royce' and the SalePrice is greater than 90000, or the Make is 'Aston Martin' and the SalePrice is less than 100000.
select *
from carsales
where (Make in ('Rolls Royce') and SalePrice > 90000) or (Make ='Aston Martin' and SalePrice < 100000);

-- 3. Retrieve Make, Model, and SalePrice, but only for records where the difference between SalePrice and CostPrice is at least 20000, and TotalDiscount is less than or equal to 1000.
select Make, Model, SalePrice
from carsales
where SalePrice- CostPrice >= 20000 and TotalDiscount <= 1000;


-- 4. Retrieve Make, Model, and Color where the Model starts with 'Silver' and the Color is in uppercase.
select Make, Model,upper(Color)
from carsales
where Model like 'Silver%';

-- 5. where the InvoiceDate is within the year 2012, and the DeliveryCharge is between 500 and 1500.
select * 
from carsales
where year(InvoiceDate) <= 2012 and DeliveryCharge between 500 and 1500;


-- 6. Retrieve all records and order them by CountryName, Make, and SalePrice in descending order.

select * 
from carsales
order by CountryName, Make, SalePrice desc;


-- 7. Retrieve Make, Model, and a new column PriceCategory that categorizes cars as 'High' if SalePrice is above 100000, 'Medium' if between 50000 and 100000, and 'Low' if below 50000.

-- select Make, Model, and a new column PriceCategory that categorizes cars as 'High' if
-- SalePrice is above 100000, 'Medium' if between 50000 and 100000, and 'Low' if below 50000.
-- select if SalePrice>10000
-- 		then return "high" endif
-- 		 as PriceCategory
-- from carsales;32szx 

















