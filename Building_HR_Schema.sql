create database SMARTSTORES
USE SMARTSTORES

CREATE SCHEMA HR

 ALTER TABLE hr.employees
(EMPLOYEEID VARCHAR (20) PRIMARY KEY  , 
FIRSTNAME VARCHAR (50) ,
LASTNAME VARCHAR (50) ,
DATEOFJOINING DATE ,
DATEOFBIRTH DATE ,
DEPARTMENTID VARCHAR (10) ,
SALARY DECIMAL (10,2) ,
CITY VARCHAR (25),
STATENAME VARCHAR (40),
MANAGERID VARCHAR (20) ,
POSITIONID VARCHAR (10));


---I added references from the diffrent tables according to there column name are being use in hr.employees table 
--like departmentis , managerid , positionid.

-- 1. Add FK for DEPARTMENTID
ALTER TABLE hr.employees
ADD CONSTRAINT FK_Employees_Department
FOREIGN KEY (DEPARTMENTID) REFERENCES HR.DEPARTMENTS(DEPARTMENTID);

-- 2. Add FK for POSITIONID
ALTER TABLE hr.employees
ADD CONSTRAINT FK_Employees_Position
FOREIGN KEY (POSITIONID) REFERENCES HR.POSITIONS(POSITIONID);

-- 3. Add FK for MANAGERID (Self-reference)
ALTER TABLE hr.employees
ADD CONSTRAINT FK_Employees_Manager
FOREIGN KEY (MANAGERID) REFERENCES hr.employees(EMPLOYEEID);

CREATE TABLE hr.STORES 
( STOREID VARCHAR (40) primary key  ,
STORELOCATION VARCHAR (150) ,
MANAGERID VARCHAR (20) )

---adding constaint o managerid to make it worthy to take reference as foreign key in 
--employeebystore table 
ALTER TABLE HR.STORES
ADD CONSTRAINT UQ_ManagerID UNIQUE (MANAGERID);


CREATE TABLE hr.positions 
(positionid varchar (10) primary key,
position varchar (25))


create table hr.departments
(departmentid varchar (10 ) primary key , 
departmentname varchar (30))

drop table hr.employeebystores

CREATE TABLE HR.EMPLOYEEBYSTORES
(EMPLOYEEID VARCHAR (20) , 
FIRSTNAME VARCHAR (50) ,
LASTNAME VARCHAR (50) ,
DEPARTMENTID VARCHAR (10) ,
MANAGERID VARCHAR (20) ,
POSITIONID VARCHAR (10) ,
STOREID VARCHAR (40) ,
PRIMARY KEY (EMPLOYEEID , STOREID ) ,
FOREIGN KEY (STOREID) REFERENCES HR.STORES(STOREID),
foreign key (managerid) references hr.stores(managerid) , 
foreign key (positionid) references hr.positions(positionid),
foreign key (employeeid) references hr.employees(employeeid),
foreign key (departmentid ) references hr.departments (departmentid));

SELECT * 
FROM sys.tables AS t
JOIN sys.schemas AS s ON t.schema_id = s.schema_id
WHERE s.name = 'HR' AND t.name = 'STORES';







EXEC xp_fileexist 'C:\Hr_Schema\employeestable.csv';


bulk insert hr.employees
from 'C:\Hr_Schema\employeestable1.csv'
with ( firstrow = 2,
fieldterminator = ',' ,
rowterminator = '\n' ,
tablock );

SELECT * FROM HR.DEPARTMENTS
INSERT INTO HR.DEPARTMENTS
VALUES ('D1001','Maintenance'),
('D1002','Operations'),
('D1003','IT'),
('D1004','Finance'),
('D1005','HR'),
('D1006','Sales'),
('D1007','Inventory');
SELECT * FROM  HR.STORES

INSERT INTO HR.STORES
VALUES ('Mumbai100','Mumbai','M1001'),
('Ahmedabad101','Ahmedabad','M1002'),
('Pune102','Pune','M1003'),
('Hyderabad103','Hyderabad','M1004'),
('Delhi104','Delhi','M1005'),
('Lucknow105','Lucknow','M1006'),
('Jaipur106','Jaipur','M1007'),
('Kolkata107','Kolkata','M1008'),
('Chennai108','Chennai','M1009'),
('Bangalore109','Bangalore','M1010');

INSERT INTO HR.POSITIONS
VALUES ('P50000','Ceo'),
('P50001','Coo'),
('P50002','National_hr'),
('P50003','Reginal_hr'),
('P50004','Store Manager'),
('P50005','Inventory Manager'),
('P50006','Cleaner'),
('P50007','Assistant Manager'),
('P50008','HR Executive'),
('P50009','Cashier'),
('P50010','Finance Officer'),
('P50011','Sales Executive'),
('P50012','Stock Clerk'),
('P50013','Technician');

SELECT * FROM HR.STORES


SELECT * FROM HR.EMPLOYEES

---here i update managerid as employeeid because managers are also employees before i was mantioned managerid in 
--hr.stores and the managerid was diffrent from employees like employeeid = E1001 and managerid = M1001 
--so i chanaged it and made employeeid and managerid in same format 


UPDATE HR.EMPLOYEES
SET MANAGERID = 'E1002'
WHERE EMPLOYEEID BETWEEN 'E1101' AND 'E1200'

UPDATE HR.EMPLOYEES
SET MANAGERID = 'E1003'
WHERE EMPLOYEEID BETWEEN 'E1200' AND 'E1300'

UPDATE HR.EMPLOYEES
SET MANAGERID = 'E1004'
WHERE EMPLOYEEID BETWEEN 'E1300' AND 'E1400'

UPDATE HR.EMPLOYEES
SET MANAGERID = 'E1005'
WHERE EMPLOYEEID BETWEEN 'E1401' AND 'E1491'

UPDATE HR.EMPLOYEES
SET MANAGERID = 'E1006'
WHERE EMPLOYEEID BETWEEN 'E1491' AND 'E1600'

UPDATE HR.EMPLOYEES
SET MANAGERID = 'E1007'
WHERE EMPLOYEEID BETWEEN 'E1601' AND 'E1700'

UPDATE HR.EMPLOYEES
SET MANAGERID = 'E1008'
WHERE EMPLOYEEID BETWEEN 'E1701' AND 'E1800'

UPDATE HR.EMPLOYEES
SET MANAGERID = 'E1009'
WHERE EMPLOYEEID BETWEEN 'E1801' AND 'E1900'

UPDATE HR.EMPLOYEES
SET MANAGERID = 'E1010'
WHERE EMPLOYEEID BETWEEN 'E1901' AND 'E2000'

---droping managerid column froom hr.store to reenter the employeeid's as managerid 

ALTER TABLE HR.STORES
DROP COLUMN MANAGERID

SELECT * FROM HR.STORES

ALTER TABLE HR.STORES
ADD  MANAGERID VARCHAR (20) 

---INSERTING THE EMPLOYEEID AS MANAGERID INTO HR.STORES

with store_with_rownum as
(
 select storeid , row_number () over (order by storeid ) rn 
 from hr.stores
 )
 update S
 set managerID = CONCAT('E10', right('0' +  CAST(W.rn AS VARCHAR ) , 2 ))
 FROM HR.STORES S
 JOIN store_with_rownum AS W ON W.STOREID = S.STOREID 




 SELECT * FROM HR.EMPLOYEES
  SELECT * FROM HR.departments
   SELECT * FROM HR.STORES
    SELECT * FROM HR.positions 
    SELECT * FROM HR.EMPLOYEEBYSTORES


bulk insert hr.employeebystores
from 'C:\HR_SCHEMA\EMPLOYEESINSTORE11.CSV'
WITH 
  ( FIRSTROW = 2 , 
  FIELDTERMINATOR = ',' ,
  ROWTERMINATOR = '\n' ,
  tablock );


SELECT * FROM HR.EMPLOYEES
SELECT * FROM HR.departments
SELECT * FROM HR.STORES
SELECT * FROM HR.positions 
SELECT * FROM HR.EMPLOYEEBYSTORES


    ---NOW MY HR SCHEMA IS READY 
    --ALL THE TABLES  HAS BEEN CREATED AN THE DATA HAS BEEN INSERTED IN THE TABLES

