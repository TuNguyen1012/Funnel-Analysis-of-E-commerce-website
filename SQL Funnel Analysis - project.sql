use [Funnel Analysis]
--overview of Home Page table: 
select *  from home_page_table
-- Do people come twice or more?? : 
select count(distinct user_id) as unique_id , count(user_id) as num_user_id from home_page_table
-- It seems that the data contains one-time users only

--overview the Search Page table: 
select *  from search_page_table
--overview the Payment Page table:
select *  from payment_page_table
--overview the Payment Confirmation Page table:
select *  from payment_confirmation_table
--overview the User table: 
select *  from user_table

--- Number of user on each page--
Drop table if exists number_of_user
select count(h.user_id) as home_page, count(s.user_id) as search_page, count(p.user_id ) as payment_page,
count(pc.user_id) as payment_confirmation_page into number_of_user from home_page_table h
left join search_page_table s
on h.user_id = s.user_id
left join payment_page_table p
on h.user_id = p.user_id
left join payment_confirmation_table pc
on h.user_id = pc.user_id

select * from number_of_user

--Percent of each page in the Sale Funnel--
Drop table if exists percent_of_page
select cast((count(h.user_id)/count(h.user_id)) as float) as per_home_page,
round((cast((select count(s.user_id) from search_page_table s) as float)/cast(count(h.user_id) as float)),4) as per_search_page,
round((cast((select count(p.user_id) from payment_page_table p) as float)/cast(count(s.user_id)as float)),4) as per_payment_page,
round((cast((select count(pc.user_id) from payment_confirmation_table pc) as float)/cast(count(p.user_id)as float)),4) as per_payment_confirmation_page
into percent_of_page
from home_page_table h
left join search_page_table s
on h.user_id = s.user_id
left join payment_page_table p
on h.user_id = p.user_id
left join payment_confirmation_table pc
on h.user_id = pc.user_id

select * from percent_of_page

-- Trend Analysis -- 

-- Time series Page Visitor --

Drop table if exists time_series_of_page
SELECT u.date as date,
count (h.user_id) as home_page_visitor,
count (s.user_id) as serch_page_visitor,
count (p.user_id) as payment_page_visitor,
count (pc.user_id) as payment_confirmation_page_visitor
into time_series_of_page
FROM home_page_table h
left join user_table u on h.user_id = u.user_id
left join search_page_table s on s.user_id = h.user_id
left join payment_page_table p on p.user_id = s.user_id
left join payment_confirmation_table pc on pc.user_id = p.user_id
where u.date is not null
group by u.date
order by u.date

select * from time_series_of_page
order by date

-- Conversion rate over time --
Drop table if exists conversion_rate
SELECT date,
round((cast(serch_page_visitor as float)/cast(home_page_visitor as float)),2) as per_search_page,
round((cast(payment_page_visitor as float)/cast(serch_page_visitor as float)),2) as per_payment_page,
round((cast(payment_confirmation_page_visitor as float)/cast(payment_page_visitor as float)),2) as per_payment_confirmation_page
into conversion_rate
FROM time_series_of_page
order by date

select * from conversion_rate
order by date

-- Customer segmentation --

-- traffic page based on Gender --

Drop table if exists gender_traffic_page
select  u.sex as gender, 
count(h.user_id) as gen_home_page,
count(s.user_id) as gen_search_page,
count(p.user_id ) as gen_payment_page,
count(pc.user_id) as gen_payment_confirmation_page 
into gender_traffic_page
from user_table u 
left join home_page_table h
on u.user_id = h.user_id
left join search_page_table s
on u.user_id = s.user_id
left join payment_page_table p
on u.user_id = p.user_id
left join payment_confirmation_table pc
on u.user_id = pc.user_id
group by u.sex

select * from gender_traffic_page

-- Conversion rate over time based on gender --

Drop table if exists #temp1
SELECT u.sex as gender, u.date as date, 
count (h.user_id) as gen_home_page_visitor,
count (s.user_id) as gen_serch_page_visitor,
count (p.user_id) as gen_payment_page_visitor,
count (pc.user_id) as gen_payment_confirmation_page_visitor
into #temp1
FROM home_page_table h
left join user_table u on h.user_id = u.user_id
left join search_page_table s on s.user_id = h.user_id
left join payment_page_table p on p.user_id = s.user_id
left join payment_confirmation_table pc on pc.user_id = p.user_id
where u.date is not null
group by u.sex, u.date

Drop table if exists #temp_gender_conversion_rate
select te.*, t.home_page_visitor as home_page_visitor  into #temp_gender_conversion_rate from #temp1 te
full join time_series_of_page t
on t.date = te.date


Drop table if exists gender_conversion_rate
SELECT gender, date,
round((cast(gen_home_page_visitor as float)/cast(home_page_visitor as float)),2) as gen_per_home_page,
round((cast(gen_serch_page_visitor as float)/cast(gen_home_page_visitor as float)),2) as gen_per_search_page,
round((cast(gen_payment_page_visitor as float)/cast(gen_serch_page_visitor as float)),2) as gen_per_payment_page,
round((cast(gen_payment_confirmation_page_visitor as float)/cast(gen_payment_page_visitor as float)),2) as gen_per_payment_confirmation_page
into gender_conversion_rate
FROM #temp_gender_conversion_rate
order by gender, date

Select* from gender_conversion_rate
order by gender, date

-- traffic page based on Device --

Drop table if exists device_traffic_page
select  u.device as device, count(h.user_id) as dev_home_page, count(s.user_id) as dev_search_page, count(p.user_id ) as dev_payment_page,
count(pc.user_id) as dev_payment_confirmation_page 
into device_traffic_page
from user_table u 
left join home_page_table h
on u.user_id = h.user_id
left join search_page_table s
on u.user_id = s.user_id
left join payment_page_table p
on u.user_id = p.user_id
left join payment_confirmation_table pc
on u.user_id = pc.user_id
group by u.device

select * from device_traffic_page

-- Conversion rate over time based on device --

Drop table if exists #temp2
SELECT u.device as device, u.date as date, count (h.user_id) as dev_home_page_visitor,
count (s.user_id) as dev_serch_page_visitor,
count (p.user_id) as dev_payment_page_visitor,
count (pc.user_id) as dev_payment_confirmation_page_visitor
into #temp2
FROM home_page_table h
left join user_table u on h.user_id = u.user_id
left join search_page_table s on s.user_id = h.user_id
left join payment_page_table p on p.user_id = s.user_id
left join payment_confirmation_table pc on pc.user_id = p.user_id
where u.date is not null
group by u.device, u.date
order by u.device, u.date

Drop table if exists #temp_device_conversion_rate
select te.*, t.home_page_visitor as home_page_visitor into #temp_device_conversion_rate from #temp2 te
full join time_series_of_page t
on t.date = te.date

Drop table if exists device_conversion_rate
SELECT device, date,
round((cast(dev_home_page_visitor as float)/cast(home_page_visitor as float)),2) as gen_per_home_page,
round((cast(dev_serch_page_visitor as float)/cast(dev_home_page_visitor as float)),2) as dev_per_search_page,
round((cast(dev_payment_page_visitor as float)/cast(dev_serch_page_visitor as float)),2) as dev_per_payment_page,
round((cast(dev_payment_confirmation_page_visitor as float)/cast(dev_payment_page_visitor as float)),2) as dev_per_payment_confirmation_page
into device_conversion_rate
FROM #temp_device_conversion_rate
order by device, date

select * from device_conversion_rate
order by device, date