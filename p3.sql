CREATE DATABASE Employee_db
Use Employee_db
CREATE TABLE ED ( 
	E_id INT,
	E_name VARCHAR(100), 
    Age INT,
	Salary DECIMAL(10, 2)
);

INSERT INTO ED (E_id, E_name, Age, Salary) VALUES 
(002, 'AJAY', 19, 50000.00),
(007, 'DARSHAN', 20, 60000.00),
(009, 'DEEKSHITH', 21, 70000.00),
(010, 'DHAKSHATH', 22, 45000.00),
(039, 'PRAJWAL', 45, 80000.00);




SELECT COUNT(E_name) AS NumberOfEmployees FROM ED;



SELECT MAX(Age) AS MaxAge FROM ED;




SELECT Salary 
FROM ED 
ORDER BY Salary ASC;



SELECT Salary, COUNT(*) AS NumberOfEmployees 
FROM ED
GROUP BY Salary;