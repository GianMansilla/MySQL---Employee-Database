SELECT 
    first_name, last_name
FROM
    employees;
    
SELECT 
    *
FROM
    employees;
    
SELECT 
    dept_no
FROM
    departments;
    
SELECT 
    *
FROM
    departments;
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' AND gender = 'M';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' AND gender = 'F';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie'
        OR first_name = 'Aruna';
        
SELECT 
    *
FROM
    employees
WHERE
    last_name = 'DENIS'
		AND (gender = 'M' OR gender = 'F');
        
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND (first_name = 'Kellie'
        OR first_name = 'Aruna');
        
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Cathie' , 'Mark', 'Nathan');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('Cathie' , 'Mark', 'Nathan');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Denis' , 'Elvis');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('john' , 'Mark', 'Jacob');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mar%');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%ar');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mar_');
    
    SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%Mar%');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%Mar%');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mark%');
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE ('2000%');
    
SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%Jack%');
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date BETWEEN '1990-01-01' AND '2000-01-01';
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date NOT BETWEEN '1990-01-01' AND '2000-01-01';
    
SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN '66000' AND '70000';
    
SELECT 
    *
FROM
    employees
WHERE
    emp_no NOT BETWEEN '10004' AND '10012';
    
SELECT 
    *
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'd006';
    
SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no IS NOT NULL;
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date >= '2000-01-01';
    
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND hire_date >= '2000-01-01';
        
SELECT 
    *
FROM
    salaries
WHERE
    salary > 150000;
    
SELECT DISTINCT
    gender
FROM
    employees;
    
SELECT DISTINCT
    hire_date
FROM
    employees;
    
SELECT 
    COUNT(emp_no)
FROM
    employees;
    
SELECT 
    COUNT(DISTINCT first_name)
FROM
    employees;
    
SELECT 
    COUNT(*)
FROM
    salaries
WHERE
    salary >= 100000;
    
SELECT 
    COUNT(*)
FROM
    dept_manager;
    
SELECT 
    *
FROM
    employees
ORDER BY first_name;

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC;

SELECT 
    *
FROM
    employees
ORDER BY first_name , last_name;

SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
ORDER BY first_name;

SELECT 
    salary, COUNT(emp_no) AS emps_with_same_salary
FROM
    salaries
WHERE
    salary > 80000
GROUP BY salary
ORDER BY salary;
    
SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
HAVING COUNT(first_name) > 250
ORDER BY first_name;
    
SELECT 
    *, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY emp_no;

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name;

SELECT 
    emp_no
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no;

SELECT 
    *
FROM
    salaries
ORDER BY salary DESC
LIMIT 10;

INSERT INTO employees
(emp_no, birth_date, first_name, last_name, gender, hire_date)
VALUES 
( 999901, '1986-04-21', 'John', 'Smith', 'M', '2011-01-01' );

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC
LIMIT 10;

INSERT INTO employees
VALUES (999902, '1977-09-14', 'Johnathan', 'Creek', 'M', '1999-01-01');

INSERT INTO employees
VALUES (999903, '1977-09-14', 'Johnathan', 'Creek', 'M', '1999-01-01');

SELECT 
    *
FROM
    titles
ORDER BY emp_no DESC
LIMIT 10;

INSERT INTO titles
(emp_no, title, from_date)
VALUES
(999903, 'Senior Engineer', '1997-10-01');

SELECT 
    *
FROM
    dept_emp
ORDER BY emp_no DESC
LIMIT 10;

INSERT INTO dept_emp
VALUES (999903, 'd005', '1997-10-01', '9999-01-01');

SELECT 
    *
FROM
    departments
LIMIT 10;

CREATE TABLE departments_dup (
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;
    
INSERT INTO departments_dup
(dept_no, dept_name)
SELECT *
FROM departments;

INSERT INTO departments
VALUES ('d010', 'Business Analysis');

SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999901;
    
UPDATE employees 
SET 
    first_name = 'Stella',
    last_name = 'Parkinson',
    birth_date = '1990-12-31',
    gender = 'F'
WHERE
    emp_no = 999901;
    
SELECT 
    *
FROM
    departments;
    
UPDATE departments
SET
	dept_name = 'Data Analysis'
WHERE 
	dept_no = 'd010';
    
COMMIT;

SELECT 
    *
FROM
    titles
WHERE
    emp_no = 999903;
    
DELETE FROM employees 
WHERE
    emp_no = 999903;
    
ROLLBACK;

DELETE FROM departments_dup;

SELECT 
    *
FROM
    departments_dup;
    
ROLLBACK;

SELECT 
    *
FROM
    departments
ORDER BY dept_no;

DELETE FROM departments 
WHERE
    dept_no = 'd010';