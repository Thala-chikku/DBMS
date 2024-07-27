CREATE DATABASE Employee_db

USE Employee_db

CREATE TABLE ED1 ( 
	E_id INT,
	E_name VARCHAR(255), 
    Age INT,
	Salary DECIMAL(10, 2)
);

INSERT INTO ED1 (E_id, E_name, Age, Salary) VALUES
(1, 'AJAY', 30, 50000.00),
(2, 'DARSHAN', 25, 45000.00),
(3, 'DEEKSHITH', 35, 62000.00),
(4, 'DHAKSHATH', 28, 52000.00),
(5, 'PRAJWAL', 32, 58000.00);

SELECT * FROM ED1



DELIMITER $$
CREATE PROCEDURE gettable ( INOUT Tableontents varchar(4000))
BEGIN
	DECLARE finished INTEGER DEFAULT 0;
	DECLARE content varchar(100) DEFAULT ""; #Cursor declaration
DEClARE curName CURSOR FOR
	SELECT concat(E_id ,' , ' , E_name,Age ,' , ' , Salary) 
    FROM ED1 order by E_id desc;
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