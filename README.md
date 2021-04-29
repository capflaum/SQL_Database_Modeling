Objective is to conduct a research projecton employees from a corporation from 1980 to 1990. Using six CSV files, the task is to design the tables to hold data in the CSVs, import the CSVs into a SQL database, and answer questions about the data. In other words, to perform the following:

1. Data Modeling

2. Data Engineering

3. Data Analysis

**Data Modeling**
Modeling begins with sketching an ERD (Entity Relation Database) diagram of the six CSV files in order to inspect them.

![image](https://user-images.githubusercontent.com/69134400/116486934-9de15e80-a843-11eb-817a-429efb80e18e.png)

**Data Engineering**
Table schemas are created with accompanying data types and keys to fit the incoming CSV files. The six CSV files are then imported into the corresponding SQL table.

**Data Analysis**
Now with a complete database, the following tasks are performed with SQL queries:

1. List the following details of each employee: employee number, last name, first name, sex, and salary.

2. List first name, last name, and hire date for employees who were hired in 1986.

3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

4. List the department of each employee with the following information: employee number, last name, first name, and department name.

5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

**Data Visualization**
The SQL database is imported into Pandas to further inspect the data. 
