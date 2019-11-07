-- Task_1
SELECT CONCAT (
		first_name,
		' ',
		last_name
		),
	hire_date,
	salary,
	department_id
FROM employees
WHERE first_name NOT LIKE '%M%'
ORDER BY department_id ASC

-- Task_2
SELECT *
FROM employees
WHERE salary BETWEEN 8000
		AND 12000
	AND commission_pct IS NOT NULL
	OR department_id NOT IN (40, 120, 70)
	AND hire_date < '1987-06-05'

-- Task_3
SELECT CONCAT (
		first_name,
		' ',
		last_name
		) AS 'Full_Name',
	CONCAT (
		phone_number,
		' - ',
		email
		) AS 'Contact_Details',
	salary AS 'Remuneration'
FROM employees
WHERE salary BETWEEN 9000
		AND 17000

-- Task_4
SELECT CONCAT (
		first_name,
		' ',
		last_name
		) AS 'Full_Name',
	salary
FROM employees
WHERE salary NOT BETWEEN 7000
		AND 15000
ORDER BY Full_Name

-- Task_5
SELECT CONCAT (
		first_name,
		' ',
		last_name
		) AS 'Full_Name',
	job_id,
	hire_date
FROM employees
WHERE hire_date BETWEEN '2007-11-05'
		AND '2009-07-05'

-- Task_6
SELECT CONCAT (
		first_name,
		' ',
		last_name
		) AS 'Full_Name',
	hire_date,
	commission_pct,
	CONCAT (
		email,
		' - ',
		phone_number
		),
	salary
FROM employees
WHERE salary > 11000
	OR SUBSTRING(REPLACE(phone_number, '.', ''), 7, 1) = 3
ORDER BY first_name DESC

-- Task_7
SELECT emplyee_id,
	first_name,
	job_id,
	department_id
FROM employees
WHERE department_id NOT IN (50, 30, 80)

-- Task_8
SELECT employee_id
FROM job_history
GROUP BY employee_id
HAVING COUNT(*) >= 2

-- Task_9
SELECT first_name,
	last_name
FROM employees
WHERE salary > (
		SELECT salary
		FROM employees
		WHERE emplyee_id = 163
		)

-- Task_10
SELECT first_name,
	last_name,
	salary,
	department_id,
	job_id
FROM employees
WHERE job_id = (
		SELECT job_id
		FROM employees
		WHERE emplyee_id = 169
		)

-- Task_11
SELECT first_name,
	last_name,
	salary,
	department_id
FROM employees
WHERE salary = (
		SELECT MIN(salary)
		FROM employees
		)

-- Task_12
SELECT emplyee_id,
	first_name,
	last_name
FROM employees
WHERE salary > (
		SELECT AVG(salary)
		FROM employees
		)

-- Task_13
SELECT first_name,
	last_name,
	emplyee_id,
	salary
FROM employees
WHERE manager_id = (
		SELECT emplyee_id
		FROM employees
		WHERE first_name = 'Payam'
		)
