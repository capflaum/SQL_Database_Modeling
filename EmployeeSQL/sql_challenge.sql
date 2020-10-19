Drop table if exists department_employees;
Drop table if exists department_manager;
Drop table if exists salaries;
Drop table if exists titles;
Drop table if exists departments;
Drop table if exists employees;

CREATE TABLE departments( 
	dept_no VARCHAR(30) NOT NULL PRIMARY KEY,
	dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE titles(
	title_id VARCHAR(30) NOT NULL PRIMARY KEY,
	title VARCHAR(30)
);

CREATE TABLE employees(
	emp_no INTEGER NOT NULL PRIMARY KEY,
	emp_title_id VARCHAR(30) NOT NULL,
	birth_date DATE,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(30) NOT NULL,
	hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE department_employees(
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR(30) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE department_manager(
	dept_no VARCHAR(30) NOT NULL,
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE salaries(
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM department_employees;
SELECT * FROM department_manager;
SELECT * FROM salaries;
SELECT * FROM titles;

-- 1) List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

-- 2) List first name, last name, and hire date for employees who were hired in 1986.
SELECT hire_date FROM employees;

SELECT emp_no, first_name, last_name, hire_date FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
GROUP BY emp_no
ORDER BY hire_date;

-- 3) List the manager of each department with the following information: 
--	department number, department name, the manager's employee number, last name, first name.

SELECT departments.dept_no, departments.dept_name, 
	department_manager.emp_no, 
	employees.last_name, employees.first_name 
FROM departments
INNER JOIN department_manager ON
departments.dept_no = department_manager.dept_no
INNER JOIN employees ON
department_manager.emp_no = employees.emp_no;

-- 4) List the department of each employee with the following information: 
-- 	employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN department_employees ON
employees.emp_no = department_employees.emp_no
INNER JOIN departments ON
department_employees.dept_no = departments.dept_no;

-- 5) List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6) List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN department_employees ON
employees.emp_no = department_employees.emp_no
INNER JOIN departments ON
department_employees.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

-- 7) List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN department_employees ON
employees.emp_no = department_employees.emp_no
INNER JOIN departments ON
department_employees.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

-- 8) In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS "Unique Last Names"
FROM employees
GROUP BY last_name 
ORDER BY "Unique Last Names" DESC;
