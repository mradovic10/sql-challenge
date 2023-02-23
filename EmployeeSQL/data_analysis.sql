-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT em.emp_no, em.last_name, em.first_name, em.sex, sa.salary
FROM employees em
JOIN salaries sa
ON em.emp_no = sa.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' 
AND hire_date <= '1986-12-31';

-- List the manager of each department along with their department number, department name, 
-- employee number, last name, and first name.
SELECT dept_emp.dept_no, de.dept_name, em.emp_no, em.last_name, em.first_name
FROM dept_emp
JOIN departments de
ON dept_emp.dept_no = de.dept_no
JOIN employees em
ON dept_emp.emp_no = em.emp_no
JOIN dept_manager ma
ON em.emp_no = ma.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, 
-- first name, and department name.
SELECT dept_emp.dept_no, em.emp_no, em.last_name, em.first_name, de.dept_name
FROM dept_emp
JOIN employees em
ON dept_emp.emp_no = em.emp_no
JOIN departments de
ON dept_emp.dept_no = de.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name 
-- begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT em.emp_no, em.last_name, em.first_name
FROM employees em
JOIN dept_emp
ON em.emp_no = dept_emp.emp_no
WHERE dept_emp.dept_no IN
(
	SELECT dept_no
	FROM departments
	WHERE dept_name = 'Sales'
);

-- List each employee in the Sales and Development departments, including their employee number, last name, 
-- first name, and department name.
SELECT em.emp_no, em.last_name, em.first_name, de.dept_name
FROM employees em
JOIN dept_emp
ON em.emp_no = dept_emp.emp_no
JOIN departments de
ON dept_emp.dept_no = de.dept_no
WHERE de.dept_name = 'Sales'
OR de.dept_name = 'Development';

-- List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;