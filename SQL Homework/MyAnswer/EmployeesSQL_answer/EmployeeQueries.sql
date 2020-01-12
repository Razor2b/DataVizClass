SELECT Employees.emp_no,
		Employees.last_name,
		Employees.first_name,
		Employees.gender,
		Salaries.salary
from Employees join Salaries
on Employees.emp_no = Salaries.emp_no;

SELECT emp_no,
		last_name,
		first_name,
		hire_date
from Employees
WHERE EXTRACT(year FROM hire_date)=1986;

SELECT dept_manager.dept_no,
	department.dept_name,
	dept_manager.emp_no,
	Employees.last_name,
	Employees.first_name,
	dept_manager.mang_from_date,
	dept_manager.mang_to_date
FROM Employees JOIN dept_manager
	ON Employees.emp_no = dept_manager.emp_no
JOIN department
	on dept_manager.dept_no = department.dept_no;
	
select Employees.emp_no,
	Employees.last_name,
	Employees.first_name,
	department.dept_name
FROM Employees JOIN dept_emp
	on Employees.emp_no = dept_emp.emp_no
JOIN department
	on dept_emp.dept_no = department.dept_no;
	

select first_name, last_name from Employees
where first_name = 'Hercules' and last_name like 'B%'


SELECT 
	dept_emp.dept_no,
	Employees.emp_no,
	Employees.last_name,
	Employees.first_name,
	department.dept_name
FROM Employees JOIN dept_emp
	ON Employees.emp_no = dept_emp.emp_no
JOIN department
	on dept_emp.dept_no = department.dept_no
WHERE department.dept_name = 'Sales';


SELECT 
	dept_emp.dept_no,
	Employees.emp_no,
	Employees.last_name,
	Employees.first_name,
	department.dept_name
FROM Employees JOIN dept_emp
	ON Employees.emp_no = dept_emp.emp_no
JOIN department
	on dept_emp.dept_no = department.dept_no
WHERE department.dept_name = 'Development' or department.dept_name = 'Sales' ;


select last_name, count (*)
from Employees
group by last_name
order by count(*) DESC;

select emp_no, first_name, last_name from Employees where emp_no ='499942'

