CREATE SCHEMA inventory 

create table inventory.products 
(productid varchar (25) primary key ,
productname varchar (70) ,
categoryid varchar (30) , 
price decimal(15,2));

create table inventory.stores
(storeid varchar(20) primary key ,
storelocation varchar (50) ) ;

create table inventory.suppliers
(supplierid varchar (25) primary key  ,
suppliername varchar (40) ,
supplierphone varchar (25) , 
supplieraddress varchar (50) ) ;

create table  inventory.category 
(category_id varchar (35) primary key  ,
category varchar (50) );


create table inventory.inventory_Stock
(REFILLINGID VARCHAR (25) PRIMARY KEY ,
storeid varchar ( 20) ,
productid varchar (25 ) ,
quantity int ,
restockdate date ,
foreign key (productid) references inventory.products(productid) ,
foreign key (storeid) references inventory.stores(storeid ) );

select * from inventory.category

select * from inventory.STORES

truncate table  inventory.stores;

insert into inventory.stores
values ('S008','Lucknow'),
('S007','Jaipur'),
('S006','Pune'),
('S005','Chennai'),
('S004','Kolkata'),
('S003','Hyderabad'),
('S002','Delhi'),
('S001','Mumbai');

SELECT * FROM INVENTORY.PRODUCTS

bulk insert inventory.products
from 'C:\Hr_Schema\inventory_schema\inventory_products1.CSV'
WITH (
FIRSTROW = 2 ,
FIELDTERMINATOR = ',' ,
ROWTERMINATOR = '\N' ,
TABLOCK );


insert into inventory.products
values ('P1001','iPhone 14','Mobile Phones','95573'),
('P1002','Samsung TV 55','Televisions','98482'),
('P1003','Dell XPS 13','Laptops','41439'),
('P1004','HP Printer','Printers','113759'),
('P1005','Sony Headphones','Audio','68174'),
('P1006','Logitech Mouse','Accessories','24227'),
('P1007','Canon DSLR','Cameras','36211'),
('P1008','Asus Monitor','Monitors','46002'),
('P1009','MacBook Air','Laptops','76477'),
('P1010','HP EliteBook','Laptops','113527');

insert into inventory.suppliers
values ('S5001','Dell Technologies','1800-DELL','Bengaluru'),
('S5002','Sony India','1800-SONY','Chennai'),
('S5003','Asus India','1800-ASUS','Lucknow'),
('S5004','HP India','1800-HPHELP','Kolkata'),
('S5005','Canon India','1800-CANON','Jaipur'),
('S5006','Apple Inc.','1800-APPLE','Mumbai'),
('S5007','Logitech','1800-LOGI','Pune'),
('S5008','Samsung India','1800-SAMSUNG','Delhi');


bulk insert inventory.inventory_stock
from 'C:\Hr_Schema\inventory_schema\stockrefill.csv'
with (
		FIRSTROW = 2 ,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n',
		tablock );

INSERT INTO INVENTORY.CATEGORY
VALUES ('CI2500','Laptops'),
('CI2501','Audio'),
('CI2502','Monitors'),
('CI2503','Printers'),
('CI2504','Cameras'),
('CI2505','Mobile Phones'),
('CI2506','Accessories'),
('CI2507','Televisions');


SELECT * FROM INVENTORY.INVENTORY_STOCK
SELECT * FROM INVENTORY.STORES
SELECT * FROM INVENTORY.PRODUCTS
SELECT * FROM INVENTORY.suppliers
SELECT * FROM INVENTORY.CATEGORY
