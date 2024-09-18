use tpcds;
select count(*) from store_sales;
select * from item;
select * from store_sales;
select * 
from date_dim
where year(d_date) in (2023,2024)
limit 500;

-- different category present in our dataset
 
SELECT DISTINCT i_category
FROM item;
-- Music -- Women -- Home -- Children -- Men
-- Electronics -- Jewelry -- Sports -- Books -- Shoes



--     QUESTION 1 Total Sales by Product Category

-- connection between "store_sales(ss_item_sk)" and "items(i_item_sk)" 
-- we will use this connection to get category from items(i_category) and total sales revenue from store_sales(ss_net_paid)
-- The net amount paid by the customer, which is the total amount after applying discounts, taxes, and coupons.

select item.i_category as product_category , sum(store_sales.ss_net_paid)/1000000 AS total_sale_in_million
from store_sales
inner join item on store_sales.ss_item_sk = item.i_item_sk
group by item.i_category;
-- product_category   total_sale_in_million
-- Music	493.222405
-- Women	470.922820
-- Home	471.405004
-- Children	466.745198
-- Men	468.657349
-- Electronics	473.761573
-- Jewelry	461.504370
-- Sports	471.387326
-- Books	466.346603
-- Shoes	484.970859



-- for year 2002 store_sales
select item.i_category as product_category , sum(store_sales.ss_net_paid)/1000000 AS total_sale_in_million
from store_sales
inner join item on store_sales.ss_item_sk = item.i_item_sk
inner join date_dim on store_sales.ss_sold_date_sk = date_dim.d_date_sk
WHERE YEAR(date_dim.d_date) = 2002
group by item.i_category;


-- Music	94.823250
-- Home	94.165996
-- Men	91.520923
-- Children	92.349163
-- Women	92.376012
-- Jewelry	87.211684
-- Sports	91.680945
-- Books	89.585516
-- Electronics	94.303832
-- Shoes	92.571945

-- for year 2002 web_store
select item.i_category as product_category , sum(web_sales.ws_net_paid)/1000000 AS total_sale_in_million
from web_sales
inner join item on web_sales.ws_item_sk = item.i_item_sk
inner join date_dim on web_sales.ws_sold_date_sk = date_dim.d_date_sk
WHERE YEAR(date_dim.d_date) = 2002
group by item.i_category;

-- Music	32.592532
-- Home	33.475020
-- Men	32.973695
-- Children	32.648308
-- Women	33.100864
-- Jewelry	30.319478


-- for year 2002 for catalog_sales
select item.i_category as product_category , sum(catalog_sales.cs_net_paid)/1000000 AS total_sale_in_million
from catalog_sales
inner join item on catalog_sales.cs_item_sk = item.i_item_sk
inner join date_dim on catalog_sales.cs_sold_date_sk = date_dim.d_date_sk
WHERE YEAR(date_dim.d_date) = 2002
group by item.i_category;

-- Music	67.074700
-- Home	66.403402
-- Men	65.759645
-- Children	66.075390
-- Women	65.769786
-- Jewelry	61.567413


-- 2. Sales Trend Over Time:
-- Question: Analyze monthly sales trends for the past two years.

-- considering year 2001 and 2002   as sales table have data till 2002 only...


select month(date_dim.d_date) as month_no  , sum(store_sales.ss_net_paid)/1000000 AS total_sale_in_million
from store_sales
inner join date_dim on store_sales.ss_sold_date_sk = date_dim.d_date_sk
WHERE YEAR(date_dim.d_date) in (2001,2002)
group by month(date_dim.d_date)
order by  total_sale_in_million desc;
-- month_no total_sales
-- 12	313.177924
-- 11	293.978184
-- 10	209.322266
-- 8	198.530944
-- 9	197.793935
-- 1	105.438511
-- 5	89.670216
-- 7	89.597997
-- 6	87.639703
-- 4	87.469422
-- 3	86.231279
-- 2	81.387968

select month(date_dim.d_date) as month_no  , sum(web_sales.ws_net_paid)/1000000 AS total_sale_in_million
from web_sales
inner join date_dim on web_sales.ws_sold_date_sk = date_dim.d_date_sk
WHERE YEAR(date_dim.d_date) in (2001,2002)
group by month(date_dim.d_date)
order by  total_sale_in_million desc;
 -- top 4 months 
-- 12	114.168656
-- 11	109.076817
-- 9	72.901663
-- 10	72.423912

select month(date_dim.d_date) as month_no  , sum(catalog_sales.cs_net_paid)/1000000 AS total_sale_in_million
from catalog_sales
inner join date_dim on catalog_sales.cs_sold_date_sk = date_dim.d_date_sk
WHERE YEAR(date_dim.d_date) in (2001,2002)
group by month(date_dim.d_date)
order by  total_sale_in_million desc;
 -- top 3 months 
-- 12	224.459636
-- 11	213.467295
-- 10	145.674669







-- 3. Top 10 Best-Selling Products:
-- Question: Identify the top 10 best-selling products by total revenue.
select i_product_name
from item;
select count(i_product_name)
from item;
-- total distict 17964 product



SELECT item.i_product_name as product_name, 
       SUM(store_sales.ss_net_paid) AS total_sale
FROM store_sales
INNER JOIN item ON store_sales.ss_item_sk = item.i_item_sk
WHERE item.i_product_name IS NOT NULL
GROUP BY item.i_product_name
ORDER BY total_sale DESC
LIMIT 10;


-- n stn stableeing	708128.90
-- ationn stationeseought	707371.60
-- antibarn steseought	698212.46
-- priationationationought	694169.27
-- priationeseanti	692171.15
-- n stationableought	685899.37
-- ationationbaroughtought	685754.52
-- ationesecallyeing	681712.44
-- antipribareseought	678670.95
-- antioughteingeing	674713.13


-- 4. Sales by Region:
-- Question: Calculate the total sales revenue by region for each sales channel

-- customer_address (ss_addr_sk → ca_address_sk)

select customer_address.ca_city as city , sum(store_sales.ss_net_paid) AS total_sale
from store_sales
inner join customer_address on store_sales.ss_addr_sk = customer_address.ca_address_sk 
inner join date_dim on store_sales.ss_sold_date_sk = date_dim.d_date_sk
where year(date_dim.d_date) = 2002 and month(date_dim.d_date) > 9
group by customer_address.ca_city
limit 0,100;

-- city     total_sales
-- Aberdeen	109842.43
-- Acme	151607.65
-- Adams	28029.21
-- Adrian	90286.02
-- Afton	82072.40
-- Allentown	140559.96
-- Allison	209527.47

-- 5. Compare month-over-month sales growth for the current year.
select month(date_dim.d_date) as month_no  , sum(store_sales.ss_net_paid) AS total_sale
from store_sales
inner join date_dim on store_sales.ss_sold_date_sk = date_dim.d_date_sk
WHERE YEAR(date_dim.d_date) = 2002
group by month(date_dim.d_date)
order by month_no;


-- 1	56018133.63
-- 2	40213949.33
-- 3	44110412.27
-- 4	42775091.46
-- 5	44645899.82
-- 6	43099779.15
-- 7	43425465.49
-- 8	97262399.71
-- 9	100471683.50
-- 10	104506618.14
-- 11	148179002.47
-- 12	157863161.99




-- 6. Calculate sales by channel (store, catalog, online) in the last 6 months.
	-- there is no data for this year so can't consider year 2024 
	-- data is till 2 jan 2003 here is proof
	select * 
	FROM date_dim
	INNER JOIN store_sales
	ON store_sales.ss_sold_date_sk = date_dim.d_date_sk;       -- output   --> 2003-01-02

	-- now considering last 6 month means last 6 month of 2002

select month(date_dim.d_date) as month_no  , sum(store_sales.ss_net_paid) AS total_sale
from store_sales
inner join date_dim on store_sales.ss_sold_date_sk = date_dim.d_date_sk
WHERE YEAR(date_dim.d_date) = 2002 and month(date_dim.d_date) >5
group by month(date_dim.d_date)
order by month_no;
	-- month_n total_sales
	-- 6	43099779.15
	-- 7	43425465.49
	-- 8	97262399.71
	-- 9	100471683.50
	-- 10	104506618.14
	-- 11	148179002.47
	-- 12	157863161.99

-- 7. Analyze the sales performance of new products introduced in the last 6 months.
	-- i_rec_start_date is the column in item table which has record of introduction date of that particular item
	select max(i_rec_start_date)
	from item ;						-- output 2001-10-27 
	-- data is till 2002 and the last introduced product on  2001-10-27 
	-- i.e. no product introduce in last 6 month considering last year to be 2002
	-- so analysing for last 6 month from the last date on which product introduce ...
    
    -- product vs total (introduce in last 6 month)
	SELECT item.i_product_name as product_name, 
	   SUM(store_sales.ss_net_paid) AS total_sale
	from store_sales
	inner join date_dim on store_sales.ss_sold_date_sk = date_dim.d_date_sk
    INNER JOIN item ON store_sales.ss_item_sk = item.i_item_sk
	WHERE item.i_rec_start_date between '2001-04-27' and '2001-10-27' 
	group by product_name;
    
    
	SELECT SUM(store_sales.ss_net_paid) AS total_sale
	from store_sales
	inner join date_dim on store_sales.ss_sold_date_sk = date_dim.d_date_sk
	INNER JOIN item ON store_sales.ss_item_sk = item.i_item_sk
	WHERE item.i_rec_start_date between '2001-04-27' and '2001-10-27' ;     -- output 307909116.33 
    
    SELECT SUM(store_sales.ss_net_paid) AS total_sale
	from store_sales
	inner join date_dim on store_sales.ss_sold_date_sk = date_dim.d_date_sk
	WHERE year(date_dim.d_date)=2001 and date_dim.d_date between '2001-04-27' and '2001-10-27' ;    -- o/p 431355490.11
    
    -- 307909116.33/431355490.11   = 0.71
    -- 71 % newly introduces items contribute in total sales
    

-- 8. Calculate the average order value per channel in the last 6 months.
	-- considering order value as total-sales / total-quantity
	select sum(ss_net_paid)/sum(ss_quantity)
	from store_sales;                          -- o/p 34.125977

	select sum(ws_net_paid)/sum(ws_quantity)
	from web_sales;                           -- o/p 45.471889

	select sum(cs_net_paid)/sum(cs_quantity)
	from catalog_sales;                       -- o/p 45.422887


-- 9. Compare sales for the Summer and Winter seasons.
select sum(store_sales.ss_net_paid) AS total_sale
from store_sales
inner join date_dim on store_sales.ss_sold_date_sk = date_dim.d_date_sk
WHERE date_dim.d_moy in (5,6,7);

select sum(store_sales.ss_net_paid) AS total_sale
from store_sales
inner join date_dim on store_sales.ss_sold_date_sk = date_dim.d_date_sk
WHERE date_dim.d_moy in (11,12,1);


-- 10. Identify the top 3 categories by total sales in the last year.

select item.i_category as product_category , sum(store_sales.ss_net_paid) AS total_sale
from store_sales
inner join item on store_sales.ss_item_sk = item.i_item_sk
inner join date_dim on store_sales.ss_sold_date_sk = date_dim.d_date_sk
WHERE date_dim.d_year = 2002
group by item.i_category
order by total_sale desc
limit 3;




