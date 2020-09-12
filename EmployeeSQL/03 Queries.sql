-----------------------------------------
---------- Data Analysis-----------------
-----------------------------------------

-- List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees As e
join salaries As s ON s.emp_no = e.emp_no;


-- List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
Where hire_date like '%1986';



-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.

Create View manager_info As
SELECT d.dept_no, d.dept_name, m.emp_no
from departments as d
join dept_manager as m on d.dept_no = m.dept_no;

SELECT m.dept_no, m.dept_name, m.emp_no, e.last_name, e.first_name
from manager_info as m
join employees as e on e.emp_no = m.emp_no;


-- List the department of each employee with the following information: employee number, last name, first name, and department name.

Create View dept_emp2 AS
SELECT d.emp_no, d.dept_no ,depts.dept_name
from dept_emp as d
JOIN departments as depts ON
depts.dept_no = d.dept_no;


SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees As e
JOIN dept_emp2 as d 
ON d.emp_no = e.emp_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT e.first_name, e.last_name, e.sex 
FROM employees As e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees As e

JOIN dept_emp2 as d 
ON d.emp_no = e.emp_no

Where d.dept_name like 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees As e

JOIN dept_emp2 as d 
ON d.emp_no = e.emp_no

Where d.dept_name like 'Sales' OR d.dept_name like 'Development';


--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

--- Sort by count
Select e.last_name, count(e.last_name) As count
from employees As e
group by e.last_name


--- Sort by name
Select e.last_name, count(e.last_name) As count
from employees As e
group by e.last_name
order by e.last_name desc;
