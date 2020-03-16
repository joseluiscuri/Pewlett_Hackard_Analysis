-- Retirement eligibility
SELECT first_name,last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');


-- Part 1 Challenge
SELECT 
emp.emp_no as EmployeeNumber,
emp.first_name ,
emp.last_name,
tt.title,
tt.from_date,
sl.salary
INTO p1_challenge
from employees as emp
INNER JOIN titles as tt ON tt.emp_no = emp.emp_no
INNER JOIN salaries as sl ON sl.emp_no = emp.emp_no;

-- Only the most recent titles
SELECT title, from_date, count(*)
INTO recent_titles
FROM p1_challenge
GROUP BY title, from_date
Order by from_date DESC;

-- Mentor Ready
SELECT 
emp.emp_no as EmployeeNumber,
emp.first_name ,
emp.last_name,
tt.title,
tt.from_date,
tt.to_date
INTO ready_for_mentor
from employees as emp
INNER JOIN titles as tt ON tt.emp_no = emp.emp_no
WHERE 1=1
AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND to_date = '9999-01-01'
ORDER by from_date;