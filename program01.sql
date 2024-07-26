drop user abc@localhost; flush privileges;

create user abc@localhost identified by 'abc'

GRANT ALL PRIVILEGES ON *.* TO 'abc'@'localhost' WITH GRANT OPTION;

FLUSH PRIVILEGES;



CREATE DATABASE Employee

Use Employee

CREATE TABLE Employee(
	EMPNO INT ,
	ENAME VARCHAR(255) NOT NULL, 
	JOB VARCHAR(255) NOT NULL,
	MANAGER_NO INT NOT NULL, 
	SAL DECIMAL(10, 2) NOT NULL,
	COMMISSION DECIMAL(10, 2) NOT NULL
);

INSERT INTO Employee (EMPNO, ENAME, JOB, MANAGER_NO, SAL, COMMISSION) 
VALUES (1, 'Ajay Kumar', 'Manager', 2, 5000.00, 1000.00);

INSERT INTO Employee (EMPNO, ENAME, JOB, MANAGER_NO, SAL, COMMISSION) 
VALUES (2, 'Amith Kumar', 'HRManager', 4, 7000.00, 3000.00);

INSERT INTO Employee (EMPNO, ENAME, JOB, MANAGER_NO, SAL, COMMISSION) 
VALUES (3, 'Aman Kumar', 'Tester', 8, 3000.00, 2000.00);

SELECT * FROM Employee;




alter table Employee engine=innodb;

-- START A TRANSACTION 

START TRANSACTION;
INSERT INTO Employee (EMPNO, ENAME, JOB, MANAGER_NO, SAL, COMMISSION) 
VALUES (1, 'Ajay Kumar', 'Manager', 2, 5000.00, 1000.00);
INSERT INTO Employee (EMPNO, ENAME, JOB, MANAGER_NO, SAL, COMMISSION) 
VALUES (2, 'Amith Kumar', 'HRManager', 4, 7000.00, 3000.00);
INSERT INTO Employee (EMPNO, ENAME, JOB, MANAGER_NO, SAL, COMMISSION) 
VALUES (3, 'Aman Kumar', 'Tester', 8, 3000.00, 2000.00);

COMMIT;

SELECT * FROM Employee



-- Start a new transaction
START TRANSACTION;

SET SQL_SAFE_UPDATES = 0;

-- Insert a new employee
INSERT INTO Employee (EMPNO, ENAME, JOB, MANAGER_NO, SAL, COMMISSION)
VALUES (4, 'Pradeep Kumar', 'FinanceManager', 5, 8000.00, 4000.00);

-- Update the name of the employee with EMPNO=2
UPDATE Employee SET ENAME = 'Sanjay Kumar' WHERE EMPNO = 2;

-- Delete the employee with the name 'Ajay Kumar'
DELETE FROM Employee WHERE ENAME = 'Ajay Kumar';

-- Rollback all operations in this transaction
ROLLBACK;

-- Select all employees to see the current state of the table
SELECT * FROM Employee;



SET SQL_SAFE_UPDATES = 0;

ALTER TABLE Employee ADD PRIMARY KEY (EMPNO);
 

NOT NULL CONSTRAINT

ALTER TABLE Employee MODIFY ENAME VARCHAR(255) NOT NULL

INSERT INTO Employee (EMPNO, ENAME, JOB, MANAGER_NO, SAL, COMMISSION) 
VALUES (4, NULL, 'clerk,3, 50000, 20)

INSERT INTO Employee (EMPNO, ENAME, JOB, MANAGER_NO, SAL, COMMISSION) 
VALUES (5, 'Hemath', NULL,NULL, NULL, null);