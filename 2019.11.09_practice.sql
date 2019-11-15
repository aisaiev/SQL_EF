-- Task_22
SELECT emplyee_id,
	first_name,
	last_name
FROM employees
WHERE department_id IN (
		SELECT department_id
		FROM employees
		WHERE first_name LIKE '%t%'
		)

-- Task_23
SELECT emplyee_id,
	first_name,
	last_name,
	salary
FROM employees
WHERE salary > (
		SELECT AVG(salary)
		FROM employees
		)
	AND department_id IN (
		SELECT department_id
		FROM employees
		WHERE first_name LIKE '%j%'
		)

-- Task_24
SELECT first_name,
	last_name,
	emplyee_id,
	j.job_title
FROM employees e,
	jobs j
WHERE e.department_id = (
		SELECT department_id
		FROM departments
		WHERE location_id = (
				SELECT location_id
				FROM locations
				WHERE city = 'Toronto'
				)
		)
	AND e.job_id = j.job_id

-- Task_25
SELECT emplyee_id,
	first_name,
	last_name,
	j.job_title
FROM employees e,
	jobs j
WHERE e.job_id = j.job_id
	AND e.salary < (
		SELECT salary
		FROM employees
		WHERE job_id = (
				SELECT job_id
				FROM jobs
				WHERE job_id = 'MK_MAN'
				)
		)

-- Task_26
SELECT emplyee_id,
	first_name,
	last_name,
	j.job_id
FROM employees e,
	jobs j
WHERE e.job_id = j.job_id
	AND e.salary < (
		SELECT salary
		FROM employees
		WHERE job_id = (
				SELECT job_id
				FROM jobs
				WHERE job_id = 'MK_MAN'
				)
		)
	AND j.job_id != 'MK_MAN'

-- Task_27
SELECT emplyee_id,
	first_name,
	last_name,
	j.job_id
FROM employees e,
	jobs j
WHERE e.job_id = j.job_id
	AND e.salary > (
		SELECT salary
		FROM employees
		WHERE job_id = (
				SELECT job_id
				FROM jobs
				WHERE job_id = 'PU_MAN'
				)
		)
	AND j.job_id != 'PU_MAN'

-- Task_28
SELECT emplyee_id,
	first_name,
	last_name,
	job_id
FROM employees
WHERE salary > ALL (
		SELECT AVG(salary)
		FROM employees
		GROUP BY department_id
		)

-- Task_29
SELECT first_name,
	last_name,
	department_id
FROM employees
WHERE EXISTS (
		SELECT *
		FROM employees e
		WHERE e.salary > 3700
		)

-- Task_30
SELECT d.department_id,
	sum_sal_per_dep.salary
FROM (
		SELECT SUM(salary) AS salary,
			department_id AS dep_id
		FROM employees
		GROUP BY department_id
		) AS sum_sal_per_dep, departments d
WHERE d.department_id = sum_sal_per_dep.dep_id

-- Task_31
SELECT emplyee_id,
	first_name,
	last_name,
	CASE job_id
		WHEN 'ST_MAN'
			THEN 'SALESMAN'
		WHEN 'IT_PROG'
			THEN 'DEVELOPER'
		ELSE job_id
		END job_id
FROM employees

-- Task_32
SELECT emplyee_id,
	first_name,
	last_name,
	salary,
	SalaryStatus = CASE 
		WHEN salary > (
				SELECT AVG(salary)
				FROM employees
				)
			THEN 'HIGH'
		ELSE 'LOW'
		END
FROM employees

-- Task_33
SELECT emplyee_id,
	first_name,
	last_name,
	salary AS SalaryDrawn,
	(
		salary - (
			SELECT AVG(salary)
			FROM employees
			)
		) AS AvgCompare,
	SalaryStatus = CASE 
		WHEN salary > (
				SELECT AVG(salary)
				FROM employees
				)
			THEN 'HIGH'
		ELSE 'LOW'
		END
FROM employees

-- Task_34
SELECT department_name
FROM departments
WHERE department_id IN (
		SELECT department_id
		FROM employees
		);

-- Task_35
SELECT first_name
FROM employees
WHERE department_id IN (
		SELECT department_id
		FROM departments
		WHERE location_id IN (
				SELECT location_id
				FROM locations
				WHERE country_id IN (
						SELECT country_id
						FROM countries
						WHERE country_name = 'United Kingdom'
						)
				)
		)

-- Task_36
SELECT first_name,
	last_name,
	salary
FROM employees
WHERE salary > (
		SELECT salary
		FROM employees
		WHERE last_name = 'Ozer'
		)

-- Task_37
SELECT first_name,
	last_name
FROM employees
WHERE manager_id IN (
		SELECT emplyee_id
		FROM employees
		WHERE department_id IN (
				SELECT department_id
				FROM departments
				WHERE location_id IN (
						SELECT location_id
						FROM locations
						WHERE country_id = 'US'
						)
				)
		)

-- Task_38
SELECT first_name,
	last_name
FROM employees empl1
WHERE salary > (
		SELECT SUM(salary) * 0.5
		FROM employees empl2
		WHERE empl1.department_id = empl2.department_id
		)

-- Task_39
SELECT *
FROM employees
WHERE emplyee_id IN (
		SELECT manager_id
		FROM employees
		)

-- Task_40
SELECT *
FROM employees
WHERE emplyee_id IN (
		SELECT manager_id
		FROM departments
		)

-- Task_41
SELECT emplyee_id,
	first_name,
	last_name,
	salary,
	d.department_name,
	l.city
FROM employees e,
	departments d,
	locations l
WHERE e.salary = (
		SELECT MAX(salary)
		FROM employees
		WHERE hire_date BETWEEN '2002-01-01'
				AND '2003-12-31'
		)
	AND e.department_id = d.department_id
	AND d.location_id = l.location_id

-- Task_42
SELECT department_id,
	department_name
FROM departments
WHERE location_id = (
		SELECT location_id
		FROM locations
		WHERE city = 'London'
		)

-- Task_43
SELECT first_name,
	last_name,
	department_id,
	salary
FROM employees
WHERE salary > (
		SELECT AVG(salary)
		FROM employees
		)
ORDER BY salary DESC

-- Task_44
SELECT first_name,
	last_name,
	department_id,
	salary
FROM employees
WHERE salary > (
		SELECT MAX(salary)
		FROM employees
		WHERE department_id = 40
		)

-- Task_45
SELECT department_id,
	department_name
FROM departments
WHERE location_id = (
		SELECT location_id
		FROM departments
		WHERE department_id = 30
		)

-- Task_46
SELECT first_name,
	last_name,
	salary,
	department_id
FROM employees
WHERE department_id = (
		SELECT department_id
		FROM employees
		WHERE emplyee_id = 201
		)

-- Task_47
SELECT first_name,
	last_name,
	salary,
	department_id
FROM employees
WHERE salary = (
		SELECT salary
		FROM employees
		WHERE department_id = 40
		)

-- Task_48
SELECT first_name,
	last_name,
	department_id
FROM employees
WHERE department_id = (
		SELECT department_id
		FROM departments
		WHERE department_name = 'Marketing'
		)

-- Task_49
SELECT first_name,
	last_name,
	salary,
	department_id
FROM employees
WHERE salary > (
		SELECT MIN(salary)
		FROM employees
		WHERE department_id = 40
		)

-- Task_50
SELECT CONCAT (
		first_name,
		' ',
		last_name
		),
	email,
	hire_date
FROM employees
WHERE hire_date > (
		SELECT hire_date
		FROM employees
		WHERE emplyee_id = 165
		)
