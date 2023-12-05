/* Lab | SQL Queries 3 */

-- 1. How many distinct (different) actors' last names are there?
select count(distinct last_name) as "Number of different actors' last name" from sakila.actor;

-- 2. In how many different languages where the films originally produced? (Use the column language_id from the film table)
select count(distinct language_id) as "Number of different languages" from sakila.film;

-- 3. How many movies were released with "PG-13" rating?
select count(*) as "Number of movies with PG" from sakila.film
where rating = 'PG-13';

-- 4. Get 10 the longest movies from 2006.
select * from sakila.film
order by length desc
limit 10;

-- 5. How many days has been the company operating (check DATEDIFF() function)?
select datediff(current_date(), convert(max(create_date), date)) from sakila.customer;
select datediff(convert(max(payment_date), date),convert(min(payment_date), date)) from sakila.payment;

-- 6. Show rental info with additional columns month and weekday. Get 20.
select * , date_format(rental_date, "%M") as 'rental_month', date_format(rental_date, "%W") as 'rental_weekday',  
date_format(return_date, "%M") as 'return_month', date_format(return_date, "%W") as 'return_weekday' from sakila.rental
limit 20;

-- 7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select *, date_format(rental_date, "%W") as 'rental_weekday',
case
when weekday(rental_date) =  5 then 'weekend'
when weekday(rental_date) = 6 then 'weekend'
else 'workday'
end as 'day_type'
from sakila.rental;

-- 8. How many rentals were in the last month of activity?
select date_format(max(payment_date), "%M") as "Last month of activity", date_format(max(payment_date), "%Y") as "Last year of activity" from sakila.payment;

select count(*) from sakila.rental
where date_format(rental_date, "%M") = 'February' and date_format(rental_date, "%Y") = '2006';