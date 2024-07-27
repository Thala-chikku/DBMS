CREATE DATABASE RC;

USE RC;



CREATE TABLE N_RollCall (
	student_id INT PRIMARY KEY, 
    student_name VARCHAR (255), 
    birth_date DATE);
    

CREATE TABLE O_RollCall (
	student_id INT PRIMARY KEY, 
    student_name VARCHAR (255), 
      birth_date DATE);
      

INSERT INTO O_RollCall (student_id, student_name, birth_date) VALUES 
(5, 'Deekshith', '2004-08-05'),
(10, 'Dhakshath', '2004-03-01');

SELECT * FROM  O_Rollcall 



INSERT INTO N_RollCall (student_id, student_name, birth_date) VALUES
(2, 'Ajay', '2004-08-05'),
(8, 'Dhanush', '2004-04-03'),
(5, 'Vinay', '2004-09-03');



SELECT * FROM  N_Rollcall 



DELIMITER //

CREATE PROCEDURE merge_rollcall_data()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE n_id INT;
    DECLARE n_name VARCHAR(255);
    DECLARE n_birth_date DATE;

    DECLARE n_cursor CURSOR FOR
        SELECT student_id, student_name, birth_date FROM N_RollCall;

    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = TRUE;

    OPEN n_cursor;

    cursor_loop: LOOP
        FETCH n_cursor INTO n_id, n_name, n_birth_date;

        IF done THEN
            LEAVE cursor_loop;
        END IF;

        IF NOT EXISTS (
            SELECT 1 FROM O_RollCall WHERE student_id = n_id
        ) THEN
            INSERT INTO O_RollCall (student_id, student_name, birth_date)
            VALUES (n_id, n_name, n_birth_date);
        END IF;
    END LOOP;

    CLOSE n_cursor;
END //

DELIMITER ;

CALL merge_rollcall_data();

SELECT * FROM O_RollCall;
