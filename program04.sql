create database CUSTOMER 

USE CUSTOMER;

CREATE TABLE CUSTOMERS ( 
	ID INT PRIMARY KEY, 
    NAME VARCHAR(255),
	AGE INT,
	ADDRESS VARCHAR(255), 
    SALARY DECIMAL(10, 2));
    
INSERT INTO CUSTOMERS VALUES (1, 'Ajay Hegde', 50, 'Mysuru',50000.00); 
INSERT INTO CUSTOMERS VALUES (2, 'Satynaryana Rao ', 65,'Mandya', 45000.00);
INSERT INTO CUSTOMERS VALUES (3, 'Ravishankar', 35,'Shivmogga', 60000.00); 
INSERT INTO CUSTOMERS VALUES (4, 'Anish Behl', 28,'Manglore', 80000.00); 
INSERT INTO CUSTOMERS VALUES (5, 'Hari das Upadaya', 28,'Udupi', 90000.00);

SELECT * FROM CUSTOMERS




DELIMITER //

CREATE TRIGGER after_insert_salary_difference
AFTER INSERT ON CUSTOMERS
FOR EACH ROW
BEGIN
    SET @my_sal_diff = CONCAT('Salary inserted is ', NEW.SALARY);
END//

DELIMITER ;

INSERT INTO CUSTOMERS VALUES (6, 'amit kumar', 38,'bijapur', 90000.00)

SELECT@my_sal_diff as SALARY_INSERTED




DELIMITER //
CREATE TRIGGER after_update_salary_difference 
AFTER UPDATE ON CUSTOMERS
FOR EACH ROW 
BEGIN
	DECLARE old_salary DECIMAL(10, 2); 
    DECLARE new_salary DECIMAL(10, 2); 
    SET old_salary = OLD.SALARY;
SET new_salary = NEW.SALARY;
SET @my_sal_diff = CONCAT('salary difference after update is ', NEW.SALARY - OLD.SALARY);
END;
// DELIMITER ;

INSERT INTO CUSTOMERS VALUES (6, 'amit kumar', 38,'bijapur', 90000.00) 

UPDATE CUSTOMERS 
SET SALARY=95000 
WHERE ID=6

SELECT @my_sal_diff AS salary_differnce



DELIMITER //

CREATE TRIGGER after_delete_salary_difference
AFTER DELETE ON CUSTOMERS
FOR EACH ROW
BEGIN
    SET @my_sal_diff = CONCAT('Salary deleted is ', OLD.SALARY);
END//

DELIMITER ;

DELETE from CUSTOMERS where ID=1

SELECT @my_sal_diff AS Deleted_Salary

