
-- Part 1 Challenge
SELECT 
emp.emp_no as EmployeeNumber,
emp.first_name ,
emp.last_name,
tt.title,
tt.from_date,
sl.salary
INTO ready_for_retirement
from employees as emp
INNER JOIN titles as tt ON tt.emp_no = emp.emp_no
INNER JOIN salaries as sl ON sl.emp_no = emp.emp_no
WHERE 1=1 
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND tt.to_date = '9999-01-01'
Order by tt.from_date DESC;

--Titles for retirement
select 
title, 
count(*) 
into titles_for_retirement
from ready_for_retirement
group by title;

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