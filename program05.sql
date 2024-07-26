CREATE DATABASE Employee4

USE Employee4

CREATE TABLE Employee ( 
	E_id INT,
	E_name VARCHAR(255), 
    Age INT,
	Salary DECIMAL(10, 2)
);

INSERT INTO Employee (E_id, E_name, Age, Salary) VALUES
(1, 'Samarth', 30, 50000.00),
(2, 'Ramesh Kumar', 25, 45000.00),
(3, 'Seema Banu', 35, 62000.00),
(4, 'Dennis Anil', 28, 52000.00),
(5, 'Rehman Khan', 32, 58000.00);

SELECT * FROM Employee




DELIMITER $$
CREATE PROCEDURE gettable ( INOUT Tableontents varchar(4000))
BEGIN
	DECLARE finished INTEGER DEFAULT 0;
	DECLARE content varchar(100) DEFAULT ""; #Cursor declaration
DEClARE curName CURSOR FOR
	SELECT concat(E_id ,' , ' , E_name,Age ,' , ' , Salary) 
    FROM Employee order by E_id desc;
#declare NOT FOUND handler
DECLARE CONTINUE HANDLER FOR NOT FOUND 
SET finished = 1;
#Open cursor
OPEN curName; 
#fetch records
getName: LOOP
FETCH curName INTO content;
IF finished = 1 THEN LEAVE getName; 
END IF;
SET Tableontents = CONCAT(content,";",Tableontents); END LOOP getName;
CLOSE curName;
END$$ 




SET @Tableontents = ""; 
CALL gettable(@Tableontents); 
SELECT @Tableontents;