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
