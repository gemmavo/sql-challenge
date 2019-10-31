-- Data Analysis

-- employee number, last name, first name, gender, and salary
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees LEFT JOIN salaries ON employees.emp_no = salaries.emp_no;

-- employees who were hired in 1986
SELECT *
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';

-- manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name, dept_manager.from_date, dept_manager.to_date
FROM dept_manager LEFT JOIN employees ON dept_manager.emp_no = employees.emp_no LEFT JOIN departments ON dept_manager.dept_no = departments.dept_no;

-- department of each employee with the following information: employee number, last name, first name, and department name
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp JOIN employees ON dept_emp.emp_no = employees.emp_no JOIN departments ON dept_emp.dept_no = departments.dept_no;

-- List all employees whose first name is "Hercules" and last names begin with "B."
SELECT *
FROM employees
WHERE first_name LIKE 'Hercules' AND last_name LIKE 'B%';

-- all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees LEFT JOIN dept_emp ON employees.emp_no = dept_emp.emp_no LEFT JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_name LIKE 'Sales';

-- all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees LEFT JOIN dept_emp ON employees.emp_no = dept_emp.emp_no LEFT JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_name LIKE 'Sales' OR dept_name LIKE 'Development';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name
SELECT last_name, COUNT(*) AS frequency_count
FROM employees
GROUP BY last_name
ORDER BY frequency_count DESC;
