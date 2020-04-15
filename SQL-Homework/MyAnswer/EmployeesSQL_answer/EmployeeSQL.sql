CREATE TABLE Employees (
	emp_no varchar(15) NOT NULL,
	birth_date date NOT NULL,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	gender varchar(1) NOT NULL,
	hire_date date NOT NULL,
	CONSTRAINT Employee_key PRIMARY KEY (emp_no));


CREATE TABLE Salaries (
	emp_no varchar(15) NOT NULL REFERENCES Employees (emp_no),
	salary integer NOT NULL,
	sal_from_date date NOT NULL,
	sal_to_date date,
	CONSTRAINT Salary_key PRIMARY KEY (emp_no, salary));
	


CREATE TABLE Title (
	emp_no varchar(15) NOT NULL REFERENCES Employees (emp_no),
	title varchar NOT NULL,
	title_from_date date NOT NULL,
	title_to_date date,
	CONSTRAINT Title_key PRIMARY KEY (emp_no, title, title_from_date));

	
CREATE TABLE department (
	dept_no varchar(5) NOT NULL,
	dept_name varchar(50) NOT NULL,
	CONSTRAINT department_key PRIMARY KEY (dept_no));
	
CREATE TABLE dept_emp (
	emp_no varchar(15) NOT NULL REFERENCES Employees (emp_no),
	dept_no varchar(15) NOT NULL REFERENCES department (dept_no),
	dept_from_date date NOT NULL,
	dept_to_date date,
	CONSTRAINT dept_emp_key PRIMARY KEY (emp_no, dept_no));
	

	
CREATE TABLE dept_manager (
	dept_no varchar(15) NOT NULL REFERENCES department (dept_no),
	emp_no varchar(15) NOT NULL REFERENCES Employees (emp_no),
	mang_from_date date NOT NULL,
	mang_to_date date,
	CONSTRAINT dept_manager_key PRIMARY KEY (dept_no, emp_no));

COPY Employees
FROM 'C:\Users\Rachel Brinkley.DESKTOP-VK0Q8VS\git\DataVizClass\SQL Homework\data\employees.csv'
WITH DELIMITER ',' CSV HEADER;

COPY Salaries
FROM 'C:\Users\Rachel Brinkley.DESKTOP-VK0Q8VS\git\DataVizClass\SQL Homework\data\salaries.csv'
WITH DELIMITER ',' CSV HEADER;

COPY Title
FROM 'C:\Users\Rachel Brinkley.DESKTOP-VK0Q8VS\git\DataVizClass\SQL Homework\data\titles.csv'
WITH DELIMITER ',' CSV HEADER;

COPY department
FROM 'C:\Users\Rachel Brinkley.DESKTOP-VK0Q8VS\git\DataVizClass\SQL Homework\data\departments.csv'
WITH DELIMITER ',' CSV HEADER;
	
COPY dept_emp
FROM 'C:\Users\Rachel Brinkley.DESKTOP-VK0Q8VS\git\DataVizClass\SQL Homework\data\dept_emp.csv'
WITH DELIMITER ',' CSV HEADER;

COPY dept_manager
FROM 'C:\Users\Rachel Brinkley.DESKTOP-VK0Q8VS\git\DataVizClass\SQL Homework\data\dept_manager.csv'
WITH DELIMITER ',' CSV HEADER;

select current_user;
