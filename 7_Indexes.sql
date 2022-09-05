# Indexes
-- How many people have been hired after the 1st of January 2000?
SELECT *
FROM employees
WHERE hire_date > '2000-01-01';

CREATE INDEX i_hire_date ON employees(hire_date);


-- Select all employees with the name "Georgi Facello"
SELECT *
FROM employees
WHERE first_name = 'Georgi'
	AND last_name = 'Facello';
    
CREATE INDEX i_composite ON employees(first_name, last_name);

ALTER TABLE employees
DROP INDEX i_hire_date;

-- Select all records from the "salaries" table of people whose salary is higher than 89000 per annum
SELECT *
FROM salaries
WHERE salary > 89000;

CREATE INDEX i_salary ON salaries(salary);

-- CASE Statement
SELECT
	emp_no,
    first_name,
    last_name,
CASE
	WHEN gender = 'M' THEN 'Male'
    ELSE 'Female'
END AS gender
FROM employees;


SELECT
	emp_no,
    first_name,
    last_name,
CASE gender
	WHEN  'M' THEN 'Male'
    ELSE 'Female'
END AS gender
FROM employees;


SELECT
	dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    CASE
		WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'Salary was raised by more than $30,000'
        WHEN MAX(s.salary) - MIN(s.salary) BETWEEN 20000 AND 30000 THEN 'Salary was raised by more then $20,000 but less than $30,000'
        ELSE 'Salary was raised by less than $20,000'
	END AS salary_increase
FROM dept_manager dm
	JOIN
    employees e ON e.emp_no = dm.emp_no
    JOIN
    salaries s ON s.emp_no = dm.emp_no
GROUP BY s.emp_no;
    
