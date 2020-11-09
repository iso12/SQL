
SELECT e1.employee_id, e1.first_name, e2.first_name, e2.salary 
FROM 
employees e1 JOIN employees e2 ON(e1.employee_id = e2.manager_id) 
WHERE 
e2.salary = 
(
    SELECT max(e3.salary) 
    FROM employees e3 
    WHERE e3.manager_id = e1.employee_id
);





SELECT e.first_name, j.job_title, e.salary
FROM 
employees e 
JOIN jobs j       ON(e.job_id = j.job_id)
JOIN employees e1 ON(e1.department_id = e.department_id) 
WHERE 
e.salary > (SELECT AVG(e2.salary) FROM employees e2) AND 
e1.first_name LIKE '%T%' AND 
e1.first_name NOT LIKE e.first_name;

----------------------------------------------------------------------------------------------------------------

select 
