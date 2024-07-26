CREATE TABLE Employee2 ( 
	E_id INT,
	E_name VARCHAR(100), 
    Age INT,
	Salary DECIMAL(10, 2)
);

INSERT INTO Employee2 (E_id, E_name, Age, Salary) VALUES (1, 'John', 30, 50000.00),
(2, 'Jane', 35, 60000.00),
(3, 'David', 40, 70000.00),
(4, 'Emily', 25, 45000.00),
(5, 'Michael', 45, 80000.00);


SELECT COUNT(E_name) AS NumberOfEmployees FROM Employee2;



SELECT MAX(Age) AS MaxAge FROM Employee2;



SELECT MIN(Age) AS MinAge FROM Employee2;



SELECT Salary FROM Employee2 ORDER BY Salary ASC;



SELECT Salary, COUNT(*) AS NumberOfEmployees 
FROM Employee2
GROUP BY Salary;


