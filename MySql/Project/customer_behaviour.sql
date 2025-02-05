use tpcds;
select * from customer;
select * from household_demographics;
select * from income_band;


                     -- INCOME BASED ANALYSIS  

	select household_demographics.hd_income_band_sk as income_band, count(*) as customer_count
	from customer
	inner join household_demographics on customer.c_current_hdemo_sk = household_demographics.hd_demo_sk
	group by household_demographics.hd_income_band_sk;

	-- almost each section have same count in term of income

	select household_demographics.hd_income_band_sk as income_band, sum(store_sales.ss_net_paid) AS total_sale
	from store_sales
	inner join customer on store_sales.ss_customer_sk = customer.c_customer_sk
	inner join household_demographics on customer.c_current_hdemo_sk = household_demographics.hd_demo_sk
	group by household_demographics.hd_income_band_sk;

	-- almost each section(based on income) have same total-sale amount

	select household_demographics.hd_income_band_sk as income_band, sum(ss_net_paid)/sum(ss_quantity) AS total_sale
	from store_sales
	inner join customer on store_sales.ss_customer_sk = customer.c_customer_sk
	inner join household_demographics on customer.c_current_hdemo_sk = household_demographics.hd_demo_sk
	group by household_demographics.hd_income_band_sk;

	-- almost same
    
                                   -- ADDRESS BASED ANALYSIS
    select customer_address.ca_city as city,
    count(*) as customer_count
	from customer
	inner join customer_address on customer.c_current_addr_sk = customer_address.ca_address_sk
	group by city
    order by customer_count DESC;

--    city      count of customers
--  Bunker Hill	975
-- 	Plainview	963
-- 	New Hope	957
-- 	Enterprise	957
-- 	Edgewood	947
-- 	Shiloh	    945

								--  Gender Based Analysis

	select customer_demographics.cd_gender as gender,
    count(*) as count
    from customer
    inner join customer_demographics on customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk
    group by gender;

-- Almost same count
-- 	M	48420
-- 	F	48142

    
	select customer_demographics.cd_gender as gender,
    format(sum(ss_net_paid)/1000000,2) as total_sale
    from store_sales
    inner join customer_demographics on customer_demographics.cd_demo_sk = store_sales.ss_cdemo_sk
    group by gender;
    
    -- store_sales
    -- gender total_sale(in million)
    --  F		2,324.14
	-- 	M		2,304.98
    
	select customer_demographics.cd_gender as gender,
    format(sum(ws_net_paid)/1000000,2) as total_sale
    from web_sales
    inner join customer_demographics on customer_demographics.cd_demo_sk = web_sales.ws_bill_cdemo_sk
    group by gender;
    
    -- web_sales
    -- gender total_sale(in million) 
	-- 	M		828.02
	--  F		822.22

	select customer_demographics.cd_gender as gender,
    format(sum(cs_net_paid)/1000000,2) as total_sale
    from catalog_sales
    inner join customer_demographics on customer_demographics.cd_demo_sk = catalog_sales.cs_bill_cdemo_sk
    group by gender;
    
    -- catalog_sales
    -- web_sales
    -- gender total_sale(in million) 
	-- 	M		1,635.91
	-- 	F		1,646.53
    
    
					-- category and gender analysis
    select customer_demographics.cd_gender as gender,item.i_category as category,
    format(sum(ss_net_paid)/1000000 , 2) as total_sale_in_million
    from store_sales
    inner join item on store_sales.ss_item_sk = item.i_item_sk
    inner join customer_demographics on customer_demographics.cd_demo_sk = store_sales.ss_cdemo_sk
    where item.i_category is not null
    group by gender , category
    order by total_sale_in_million desc;
    -- gender category tota_sales(in million)
	-- 	F	Music	241.73
	-- 	M	Music	239.73
	-- 	F	Shoes	238.45
	-- 	M	Shoes	235.22
	-- 	F	Sports	232.04
	-- 	F	Electronics	231.39
	-- 	M	Electronics	231.08
	-- 	F	Home	231.01
	-- 	F	Women	230.41
	-- 	F	Men		229.67
	-- 	M	Women	229.33
	-- 	M	Home	229.08
	-- 	F	Children228.99
	-- 	M	Sports	228.03
	-- 	M	Books	227.96
	-- 	M	Men		227.65
	-- 	F	Books	227.43
	-- 	M	Children226.82
	-- 	F	Jewelry	226.70
    
    
-- Analyze how many new customers were acquired through each sales channel in the last 3 months.

	-- finding last date when a new customer introduced
	select max(date_dim.d_date)
	from customer
	inner join date_dim on date_dim.d_date_sk = customer.c_first_sales_date_sk;
	-- o/p => 2003-01-08   last date when a new customer introduced
	-- searching for customers comes in last 3 month i.e october 2002 and onward
    
    select count(*)
    from customer
    inner join date_dim on date_dim.d_date_sk = customer.c_first_sales_date_sk
    where date_dim.d_date_sk >= '2002-10-01' ;   -- o/p --> 96482


    
