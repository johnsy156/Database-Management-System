--Functionality 1: Generate report to find out which books were sold most / least in the last 3 months
--This query gives the books that were sold most in the last 3 months:

select bprod_id,count(bprod_id)
from f17_3_purchase,f17_3_books
where bprod_id=prod_id
and (sell_date-sysdate)<=90
group by(bprod_id)
having count(bprod_id)>1
order by count(bprod_id) desc;

--This query gives the books that were sold least in the last 3 months:

select * from (
select bprod_id,count(bprod_id)
from f17_3_purchase,f17_3_books
where bprod_id=prod_id
and (sell_date-sysdate)<=90
group by(bprod_id)
order by count(bprod_id)
)
where rownum = 1;

--Functionality 2: Report listing the details of the books that havent been sold in the last year.
--The inner query lists the books that were not purchases comparing it with the books table
--The outer query lists the products and their buy_date(the day they were bought by the store) and filters if they have not sold for a year.

select PROD_ID,BUY_DATE from f17_3_products 
where (sysdate-BUY_DATE) >= 365
and PROD_ID IN ( 
				select BPROD_ID from f17_3_books left join f17_3_purchase P on BPROD_ID = P.PROD_ID
				where P.PROD_ID is null 
				);

--Functionality 3: Type of merchandise that got sold the most in the past three months.
--The query compares the prod_id of the merchandise with the purchase table and groups them based on the product ordering by maximum count.
--The date filters the products for the last 3 months approximately.
--
select m.mprod_id,count(m.mprod_id) As MaxCount
from f17_3_purchase,f17_3_merchandise m
where sell_date>=(sysdate-90)
and prod_id=m.mprod_id
group by m.mprod_id
order by count(m.mprod_id) desc;

--Functionality 4: List of employees sorted according to the years of experience they have with the store.
--This query will give the name and SSN of the employee along with the no. of days he/she has been associated with the company
--The output will be ordered by the employee with the maximum experience on top and thus follows.

select SSN, NAME, round(sysdate-doj), BID as DayswithCompany   
from f17_3_employee 
order by round(sysdate-DOJ) desc;

--Functionality 5: Report on what category of books were rented the most in the last 6 months.
--The inner query returns the categories of the books rented the most sorted by the maximum count
--The outer query will fetch the first row (which is the most rented category) and diaplay it.

select * from
			(
			select cname, count(*) as Total 
			from f17_3_products p, f17_3_rents r 
			where p.prod_id=r.prod_id 
			and r.rent_date >= (sysdate-180)
			group by cname
			order by count(*) desc
			)
where ROWNUM =1;

--Functionality 6: Identify the branch that grossed more profit till date.
--The total expenses is subtracted from the total purchases

select * from (
select p.bid, sum(selling_price), Cost as f17_3_expenses, (sum(selling_price) - cost) as Profit 
from f17_3_expenses e,f17_3_purchase p, f17_3_branch b
where b.bid=p.bid
and b.bid=e.bid
and p.bid=e.bid
group by p.bid,Cost
order by (sum(selling_price) - cost) desc
)
where ROWNUM = 1;

--Functionality 7: List the members who have made the top 10 purchases among the bookstore members in the past year.
--The inner select query picks the customer ID, name and the sum of the purchases they made if they are a member of the store
--It then groups them together and orders based on the customer having maximum purchase amount.
--The outer query then filters top 10 

select * from
(select c.CID, Name, sum(selling_price) as Totalf17_3_purchaseAmt
from f17_3_customer c, f17_3_purchase p 
where c.cust_type = 'Member'
and c.cid = p.cid
and p.sell_date >= (sysdate-365)
group by c.CID,Name,p.cid
order by sum(selling_price) desc 
)
where ROWNUM <= 10;

--Functionality 8: Give a report on the total no. of books and merchandise (irrespective of the categories) sold.
--The first output gives the number of books sold till date and the output in 2nd row gives the total no. of merchandise sold till date.

select count(*) as ProdCount from purchase where PROD_ID IN (select bprod_id from books) 
UNION 
select count(*) from purchase where PROD_ID IN (select mprod_id from merchandise);
