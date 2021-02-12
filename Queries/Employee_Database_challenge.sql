

--Module_7 
--Challange Deliverable 1
SELECT e.emp_no,
e.first_name,
e.last_name,
t.title, 
t.from_date,
t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON(e.emp_no= t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.birth_date;

--Employees by most recent title
SELECT DISTINCT ON (emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY emp_no, to_date DESC;

--count number of titles from unique_titles table
SELECT COUNT (ut.title)
INTO retiring_titles
FROM unique_titles as ut
GROUP BY (ut.title)
ORDER BY ut.title DESC;

--Deliverable 2: The Employees Eligible for the Mentorship Program
SELECT DISTINCT ON (emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON(e.emp_no = de.emp_no)
INNER JOIN titles as t
ON(e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
GROUP BY (e.emp_no, de.to_date, de.from_date, t.title)
ORDER BY emp_no;

Deliverable 3
--count number of titles from unique_titles table
SELECT SUM (count)
FROM retiring_titles;

--count number of employees that are mentorship ready
SELECT COUNT (emp_no)
FROM mentorship_eligibility;