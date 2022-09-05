USE employees;

DROP PROCEDURE IF EXISTS select_employees;

-- Create a Procedure that shows * from the employees database with a limit of 1000 rows
DELIMITER $$
CREATE PROCEDURE select_employees()
BEGIN
select *
from employees
limit 1000;
END $$

DELIMITER ;

CALL employees.select_employees();

CALL select_employees();

-- Delete the Procedure
DROP PROCEDURE select_employees;


-- Create a Procedure that shows the average salary
DELIMITER $$
CREATE PROCEDURE avg_salary()
BEGIN
SELECT AVG(salary)
FROM salaries;
END $$

DELIMITER ;

CALL avg_salary();


-- Stored Procedure with an Input Parameter (employee number)
DELIMITER $$
USE employees $$
CREATE PROCEDURE emp_salary(IN p_emp_no INTEGER)
BEGIN
SELECT
	e.first_name, e.last_name, s.salary, s.from_date, s.to_date
FROM
	employees e
    JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
	e.emp_no = p_emp_no;
END $$

-- Same as before but calculating avg salary
DELIMITER $$
USE employees $$
CREATE PROCEDURE emp_avg_salary(IN p_emp_no INTEGER)
BEGIN
SELECT
	e.first_name, e.last_name, AVG(s.salary)
FROM
	employees e
    JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
	e.emp_no = p_emp_no;
END $$

DELIMITER ;
    
CALL emp_avg_salary(11300);

-- Stored Procedure with and Output Parameter
DELIMITER $$
CREATE PROCEDURE emp_avg_salary_out (IN p_emp_no INTEGER, OUT p_avg_salary DECIMAL(10,2))
BEGIN
SELECT
	AVG(s.salary)
    INTO p_avg_salary FROM
		employees e
        JOIN
        salaries s ON e.emp_no = s.emp_no
WHERE
	e.emp_no = p_emp_no;
END$$
    
DELIMITER ;

-- Create a Variable
SET @p_avg_salary = 0;
CALL employees.emp_avg_salary_out(11300, @p_avg_salary);
SELECT @p_avg_salary;

-- User-defined Functions
DELIMITER $$
CREATE FUNCTION f_emp_avg_salary (p_emp_no INTEGER) RETURNS DECIMAL(10,2)
DETERMINISTIC NO SQL READS SQL DATA
BEGIN
DECLARE v_avg_salary DECIMAL(10,2);
SELECT AVG(s.salary)
INTO v_avg_salary FROM
	employees e
    JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
	e.emp_no = p_emp_no;
RETURN v_avg_salary;
END$$

DELIMITER ;