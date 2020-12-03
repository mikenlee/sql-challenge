DROP TABLE IF EXISTS Managers;
DROP TABLE IF EXISTS Dept_Emp;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Titles;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Salaries;

CREATE TABLE Salaries (
	emp_no INT PRIMARY KEY,
	salary INT NOT NULL
);

CREATE TABLE Department (
	dept_no VARCHAR(30) PRIMARY KEY,
	dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE Titles (
	title_id VARCHAR(30) PRIMARY KEY,
	title VARCHAR(30) NOT NULL
);

CREATE TABLE Employees (
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR(30) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(30) NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id),
	FOREIGN KEY (emp_no) REFERENCES Salaries(emp_no)
);

CREATE TABLE Dept_Emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(30) NOT NULL,
	PRIMARY KEY(emp_no, dept_no),
	FOREIGN KEY (dept_no) REFERENCES Department(dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

CREATE TABLE Managers (
	dept_no VARCHAR(30) NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no, dept_no) REFERENCES Dept_Emp(emp_no, dept_no)
);



--List the following details of each employee: employee number, last name, first name, sex, and salary.
select e.emp_no, last_name, first_name, sex, salary 
from employees e
left join salaries s
on e.emp_no = s.emp_no

--List first name, last name, and hire date for employees who were hired in 1986
select first_name, last_name, hire_date 
from employees
where date_part('year', hire_date) = '1986'

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
select
m.dept_no, dept_name, m.emp_no, last_name, first_name
from managers m
left join department d
on m.dept_no = d.dept_no
left join employees e
on m.emp_no = e.emp_no

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
select d.emp_no, last_name, first_name, dept_name
from dept_emp d
left join employees e
on d.emp_no = e.emp_no
left join department dn
on d.dept_no = dn.dept_no

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex
from employees
where first_name = 'Hercules' AND last_name LIKE 'B%'

--List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
select d.emp_no, last_name, first_name, dept_name
from dept_emp d
left join employees e
on d.emp_no = e.emp_no
left join department dn
on d.dept_no = dn.dept_no
where dept_name = 'Sales'

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
select d.emp_no, last_name, first_name, dept_name
from dept_emp d
left join employees e
on d.emp_no = e.emp_no
left join department dn
on d.dept_no = dn.dept_no
where dept_name = 'Sales' OR dept_name = 'Development'

--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
select last_name, count(last_name)
from employees
group by last_name


