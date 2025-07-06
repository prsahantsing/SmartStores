use SMARTSTORES;


create schema sales;

create table sales.customers
(customerid varchar (30) primary key , 
customername varchar (70) , 
phonenumber varchar (25) ) ;

create table sales.orderdetails
(Serial  int primary key ,
orderid varchar (30) , 
customerid varchar (30) ,  
quantity int ,
productid varchar (25) , 
PRICE INT) ;


create table sales.orders
( orderid varchar (30) ,
customerid varchar (30) ,
saledate date ,
productid varchar (30) ,
storeid varchar (30) , 
paymentmode varchar (25) ,
orderstatus varchar (25)) ;

ALTER TABLE SALES.ORDERS
ADD CONCSTRAINT
 

 bulk insert sales.customers
 from 'C:\\customers-schema\\SALES.CUSTOMER_TABLE1.csv'
 WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  tablock );


  select * from sales.orders

  bulk insert sales.orders
  from 'C:\customers-schema\CUSTOMERS_SCHEMA\customers.order_filtered.csv'
  with (
		firstrow =2,
		fieldterminator = ',',
		rowterminator = '\n',
		tablock );

select * from sales.orderdetails


bulk insert sales.orderdetails
from 'C:\customers-schema\CUSTOMERS_SCHEMA\realorderdetails.csv'
with (
		firstrow = 2 , 
		fieldterminator = ',',
		rowterminator = '\n',
		tablock );




select * from sales.orderdetails


select customerid , 
count(customerid) as ordercount , sum(price*quantity) as totalsales
from sales.orderdetails 
where customerid = 'C001'
group by customerid 
having count(customerid) > 3 and sum(price*quantity) > 200000;

drop index IDX_CUSTOMER_AGG ON SALES.ORDERDETAILS

drop index IDX_PRICE_QUANTITY_CUSTOMERID ON SALES.ORDERDETAILS
CREATE INDEX IDX_PRICE_QUANTITY_CUSTOMERID ON SALES.ORDERDETAILS(CUSTOMERID , QUANTITY,PRICE) 
CREATE NONCLUSTERED INDEX IDX_CUSTOMER_AGG
ON sales.orderdetails(customerid)
INCLUDE (price, quantity);


