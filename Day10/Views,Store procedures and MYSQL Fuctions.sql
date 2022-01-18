  -------- VIEWS IN SQL----------
  USE sql_invoicing;
 CREATE VIEW Sales_by_client AS
 SELECT 
      c.client_id,
      c.name,
      sum(invoice_total) AS total_sales
 FROM clients c
 JOIN invoices USING(client_id)
 GROUP BY client_id,name;
--  Using Views as same as Tables
 SELECT*
 FROM sales_by_client
 WHERE total_sales>500;
   
   
   
-----  STORE PROCEDURES-----
--  Creating Store Procedures
DELIMITER $$
CREATE PROCEDURE get_clients()
BEGIN
     SELECT * FROM clients;
END$$

DELIMITER ;   
--  Droping Store procedure
DROP PROCEDURE get_clients;
DROP PROCEDURE IF EXISTS get_clients;



 ----- Essintial MYSQL Fuctions-------
 -- IFNULL FUCTION
USE sql_store;
SELECT
 order_id,shipper_id,
IFNULL(shipper_id, 
       (select AVG(shipper_id)
	   FROM ORDERS))
FROM orders;


-- COALESCE FUNCTION
SELECT
 order_id,shipper_id,
COALESCE(shipper_id,comments,'not assiend' )
FROM orders;

 -- Using If in SQL
-- Syntax: If (Expression,First,Second)
SELECT 
      order_id,
      order_date,
      IF(YEAR(order_date) >"2018-01-01",'Active',"Archived") AS Categary
FROM orders ;     
      

-- The CASE Operator
SELECT 
      order_id,
      order_date,
     CASE 
         WHEN YEAR(order_date) >= "2019-01-01" THEN "CURRENT ORDERS"
		 WHEN YEAR(order_date) = "2018-01-01" THEN "ACTIVE ORDERS"
         WHEN YEAR(order_date) < "2018-01-01" THEN "ARCHIVE ORDERS"
         ELSE "FUTURE"
     END AS Categary    
FROM orders; 
      
      
-- MYSQL Numeric Fuctions  
SELECT ROUND(4.4);
SELECT ROUND(4.45555,3);
SELECT truncate(4.556,2);
SELECT FLOOR(4.9);
SELECT CEILING(2.1);
SELECT ABS(-3.66);
SELECT RAND(5);


-- MYSQL String Fuctions
SELECT LENGTH('HELLO WORLD');
SELECT UPPER('sahil');
SELECT LOWER('SAHIL');
SELECT LTRIM(' LAPTOP');
SELECT RTRIM('LAPTOP ');
SELECT TRIM(' LAPTOP  ');
SELECT LTRIM('LAPTOP',3);
SELECT LEFT('MOBILE',3);
SELECT RIGHT('LAPTOP',3);
SELECT SUBSTRING('LAPTOP',3,3);
SELECT LOCATE( 'O' ,'LAPTOP');
SELECT LOCATE( 'Z' ,'LAPTOP');  -- IT WILL RETURN 0
SELECT REPLACE( 'LAPTOP',"TOP",'BUTTOM');
SELECT CONCAT( 'LAP','TOP');


--  MYSQL Date Time fuctions
SELECT NOW();
SELECT CURDATE();
SELECT CURTIME();
SELECT YEAR(NOW());
SELECT date(NOW());
SELECT DAYNAME(NOW());
SELECT EXTRACT(SECOND FROM NOW()); 
SELECT DATE_ADD(NOW(), INTERVAL 1 MONTH);
SELECT DATE_ADD(NOW(), INTERVAL -1 MONTH);
SELECT DATE_SUB(NOW(), INTERVAL 1 YEAR);
SELECT DATEDIFF('2022-02-02','2022-02-06');
SELECT TIME_TO_SEC('4:00')-TIME_TO_SEC('3:00');
-- Date time formating
SELECT DATE_FORMAT(NOW(),'%D''%M''%Y');
SELECT TIME_FORMAT(NOW(),'%H:%I %p');
 


