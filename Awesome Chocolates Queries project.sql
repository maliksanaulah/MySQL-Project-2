#   "AWESOME CHOCOLATES DATA ANALYSIS PROJECT USING MYSQL"
#       Here awesomes chocolates schema is set as default 
#_______________________________________________________________________________________

# 1) Show all tables in data set ?
show tables;


# 2) What is available within specofic table ?
desc sales;


# 3) show all the sales record ?
Select * from sales ;


# 4) Show saleDate , Amount and customers column in sales table ?
select SaleDate , Amount , Customers from sales;


# 5) create new calculation amount per boxes in sales table 
select SaleDate, Amount, Boxes, Amount/boxes from sales;


# 6) Also add name of new column as "Amount per box"
select SaleDate, Amount, Boxes, Amount/boxes 'Amount per box' from sales;


# 7) Show all the records from sales where amount is greater than 10000?
select * from sales where Amount >10000;


# 8) Show amount is both ascending and descending order ?
# ASCENDING ORDER
select * from sales where Amount >10000
order by Amount;
# DESCENDING ORDER 
select * from sales where Amount >10000
order by Amount desc;


 # 9) Show record in sales where GeoID = G1 and also show both PID and amount in descending order?
 Select * from sales where GeoID = 'G1'
 order by PID , Amount desc;
 
 
 # 10) Show data from sales table where Amount greater then 10000 and year equal to 2022?
 select * from sales 
 where amount >10000 and SaleDate >='2022-01-01';
 
 
 # 11) show the same record show year(Built in function) Function and show amount in desc ;
 select * from sales 
 where amount >10000 and year(SaleDate) = 2022
 order by Amount desc;
 
 
 # 12) Show all data where boxex is in between 0 to 50?
 select * from sales where Boxes between 0 and 50; 
 
 
 # 13) show all the record where weekday = 4 create new column name "Day_of_week?
 select  SaleDate, Amount, Boxes, weekday(SaleDate) as Day_of_week from sales 
 where weekday(SaleDate)= 4;
 
 
 # 14) Show all data from people table?
 select * from people;
 
 
 # 15) show data where team is Delish or Jucies ?
 
select * from people 
where Team = 'delish' or team ='Jucies';


# 16) show data where team is Delish, Jucies , delish ?
select * from people 
where team in ('Delish','Jucies','Yummies');


# 17) Show record from people table where Salesperson name start from  'K'?
Select * from people
where salesperson like "k%";


# 18) Show record from people table where B is any where in the name?
select * from people 
where Salesperson like "%b%";


# 19) Create a new column in sales table And categorize amount as under 1k , under 5k etc?
select SaleDate,Amount,
		case	when amount < 1000 then 'Under 1k'
				when amount < 5000 then 'Under 5k'
                when amount <10000 then 'Under 10k'
			else 'more than 10k'
	    end as 'Amount category'
from sales;


# 20) Show product name in sales table 
select s.SaleDate, s.amount, pr.product
from sales s
left join products pr on pr.PID=s.PID;


# 21) show both product and person name in sales table 
select s.SaleDate,s.Amount,pr.Product,p.Salesperson
from sales s
join people p on p.SPID = s.SPID
join products pr on pr.PID=s.PID;


# 22) show both product and person name in sales table  where amount less than 500
select s.SaleDate,s.Amount,p.Salesperson,pr.Product
from sales s 
join people p on p.SPID=s.SPID
join products pr on pr.PID=s.PID
where s.Amount<500;


# 23) show geography , product name , person name where geagraphy is newzealand or india
select s.SaleDate,s.Amount,p.Salesperson,pr.Product,g.geo
from sales s 
join people p on p.SPID=s.SPID
join products pr on pr.PID=s.PID
join geo g on g.GeoID=s.GeoID
where g.geo in ('India','New Zealand');


# 24) Show above record order salesdate in Ascending order
select s.SaleDate,s.Amount,p.Salesperson,pr.Product,g.geo
from sales s 
join people p on p.SPID=s.SPID
join products pr on pr.PID=s.PID
join geo g on g.GeoID=s.GeoID
where g.geo in ('India','New Zealand')
order by s.SaleDate;


# 25) show sum of amounts by geoid
select GeoID,sum(Amount)
from sales
group by GeoID;


# 26) also show average amount 
select GeoID,sum(Amount),avg(Amount)
from sales
group by GeoID;


# 27) Show country name and then show each country total amount 
select g.geo,sum(Amount),avg(Amount)
from sales s
join geo g on g.GeoID=s.GeoID
group by g.geo;


# 28) Show top 10 product 
select pr.Product,sum(Amount) as "Total Amount"
from sales s
join products pr on pr.pid= s.pid
group by pr.Product
order by "Total Amount" desc
limit 10;
 
 
 
 
 
 
 
 
 
 
 
 
 
 