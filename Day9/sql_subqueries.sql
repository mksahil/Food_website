-- Use of ALL operator   
USE sql_invoicing;
SELECT *
FROM invoices
WHERE invoice_total > ALL (

SELECT invoice_total
FROM  invoices
WHERE client_id=3
);

-- Use of ANY operator
-- Select clients with atlest two invoices
SELECT*
FROM clients
where client_id= ANY(
SELECT client_id
FROM invoices
GROUP BY client_id
HAVING COUNT(*)>=2
);


-- USING IN OPERATOR FOR THE SAME
SELECT*
FROM clients
where client_id IN(
SELECT client_id
FROM invoices
GROUP BY client_id
HAVING COUNT(*)>=2
);
 
  #Correleted subqueries
 -- Query the employees whose salariesare less than the average salary of their office
 USE sql_hr;
 
  SELECT *
 FROM employees e
 WHERE salary< (
 
 SELECT avg(salary)
 FROM employees
 WHERE office_id=e.office_id
 )
 
 
 
 
 
 
 
 
 
 
 