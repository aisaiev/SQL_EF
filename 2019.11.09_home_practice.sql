-- Task_57
SELECT e.first_name,
	e.last_name,
	d.department_id,
	d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id

-- Task_58
SELECT e.first_name,
	e.last_name,
	d.department_id,
	d.department_name,
	l.city,
	l.state_province
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
INNER JOIN locations l ON d.location_id = l.location_id

-- Task_59
SELECT e.first_name,
	e.last_name,
	e.salary,
	j.grade_level
FROM employees e
INNER JOIN job_grades j ON e.salary BETWEEN j.lowest_sal
		AND j.highest_sal
-- Task_60
INNER JOIN departments d ON e.department_id = d.department_id
	AND d.department_id IN (80, 40)

-- Task_61
SELECT e.first_name,
	e.last_name,
	d.department_name,
	l.city,
	l.state_province
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
	AND e.first_name LIKE '%z%'
INNER JOIN locations l ON d.location_id = l.location_id

-- Task_62
SELECT employees.first_name,
	employees.last_name,
	employees.department_id,
	departments.department_name
FROM employees
RIGHT JOIN departments ON employees.department_id = departments.department_id

-- Task_63
SELECT e1.first_name,
	e1.last_name,
	e1.salary,
	e2.salary
FROM employees e1
JOIN employees e2 ON e2.emplyee_id = 182
WHERE e1.salary < e2.salary

-- Task_64
SELECT empl1.first_name,
	empl2.first_name
FROM employees empl1
INNER JOIN employees empl2 ON empl1.manager_id = empl2.emplyee_id

-- Task_65
SELECT d.department_name,
	l.city,
	l.state_province
FROM departments d
INNER JOIN locations l ON d.location_id = l.location_id

-- Task_66
SELECT e.first_name,
	e.last_name,
	d.department_id,
	d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id

-- Task_67
SELECT empl1.first_name,
	empl2.first_name
FROM employees empl1
LEFT JOIN employees empl2 ON empl1.manager_id = empl2.emplyee_id
