-- USING COMPANY DATABASE
USE company;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE,
    manager_id INT
);

INSERT INTO employees (employee_id, employee_name, department, salary, hire_date, manager_id)
VALUES
    (1, 'John Doe', 'IT', 60000.00, '2022-01-15', NULL),
    (2, 'Jane Smith', 'HR', 55000.00, '2022-02-20', 1),
    (3, 'Bob Johnson', 'Finance', 70000.00, '2022-03-10', 1),
    (4, 'Alice Williams', 'IT', 65000.00, '2022-04-05', 2),
    (5, 'Charlie Brown', 'HR', 50000.00, '2022-05-12', 2);
    
-- SELECT & WHERE
-- Select employees with salary greater than 50000
SELECT *
FROM employees
WHERE salary > 50000;

-- ORDER BY
-- Select employees ordered by salary in descending order
SELECT *
FROM employees
ORDER BY salary DESC;

-- SUM
-- Calculate the total salary of all employees
SELECT SUM(salary) AS total_salary
FROM employees;

-- SUM & WHERE 
-- Calculate the total salary of employees in the 'IT' department
SELECT SUM(salary) AS total_salary
FROM employees
WHERE department = 'IT';

-- GROUP BY
-- Calculate the total salary for each department
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;

-- HAVING 
-- Select departments with a total salary greater than 200000
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING total_salary > 70000;

-- SECOND TABLE PROJECTS
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50) NOT NULL,
    employee_id INT,
    project_start_date DATE,
    project_end_date DATE
);

-- Inserting sample data into the projects table
INSERT INTO projects (project_id, project_name, employee_id, project_start_date, project_end_date)
VALUES
    (1, 'Project A', 1, '2022-01-20', '2022-03-15'),
    (2, 'Project B', 2, '2022-02-25', '2022-04-30'),
    (3, 'Project C', 4, '2022-04-10', '2022-06-30'),
    (4, 'Project D', 3, '2022-03-25', '2022-05-20');
    
-- INNER JOIN
-- Select employees and their assigned projects
SELECT employees.employee_id, employees.employee_name, projects.project_name
FROM employees
INNER JOIN projects ON employees.employee_id = projects.employee_id;

-- LEFT JOIN
SELECT employees.employee_id, employees.employee_name, projects.project_name
FROM employees
LEFT JOIN projects ON employees.employee_id = projects.employee_id;

-- RIGHT JOIN
SELECT employees.employee_id, employees.employee_name, projects.project_name
FROM employees
RIGHT JOIN projects ON employees.employee_id = projects.employee_id;

-- SUBQUERY
-- Select employees with a salary greater than the average salary
SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT SUM(salary) AS total_salary 
FROM employees;

-- CREATE VIEW FOR ANALYSIS
CREATE VIEW EmployeeProjectSummary AS
SELECT 
    e.employee_id, 
    e.employee_name, 
    e.department, 
    p.project_name, 
    p.project_start_date, 
    p.project_end_date
FROM employees e
LEFT JOIN projects p ON e.employee_id = p.employee_id;

SELECT * 
FROM EmployeeProjectSummary 
WHERE department = 'IT';

-- Index on Employee Name for Faster Searches
CREATE INDEX idx_employee_name 
ON employees(employee_name);

-- Index on Department to Speed Up Grouping Queries
CREATE INDEX idx_department
ON employees(department);











    
    
    


