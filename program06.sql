CREATE DATABASE ROLLCALL;
USE ROLLCALL;

-- Create N_RollCall table 
CREATE TABLE N_RollCall (
	student_id INT PRIMARY KEY, 
    student_name VARCHAR (255), 
    birth_date DATE);
    
-- Create O_RollCall table with common data
CREATE TABLE O_RollCall (
	student_id INT PRIMARY KEY, 
    student_name VARCHAR (255), 
      birth_date DATE);
    

-- Insert common data into O_RollCall
INSERT INTO O_RollCall (student_id, student_name, birth_date) VALUES 
(1, 'Amith', '1995-08-15'),
(2, 'Ajay', '1990-12-10');


SELECT * FROM  O_Rollcall 



INSERT INTO N_RollCall (student_id, student_name, birth_date) VALUES
(1, 'Amith', '1995-08-15'), -- Common record with O_RollCall (2, 'Ajay', '1990-12-10'),
(3, 'Ravi', '1990-12-10'), -- Common record with O_RollCall (4, 'Rakesh', '2000-05-18'),
(5, 'Vinay', '1997-09-03');

SELECT * FROM  N_Rollcall 