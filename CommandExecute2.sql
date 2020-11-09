set ansi_nulls = on,
go
set quoted_identifier on,
go

if not exists 
(
    select * from sys.objects
    where object_id = object_id
    (
        N'[dbo].[CommandExecute]'

    )

    and type in
    (
        N'P',N'PC'
    ) 
)
BEGIN
EXEC dbo.sp_executesql statement = N'CREATE PROCEDURE [dbo].[CommandExecute] AS'
END
GO
ALTER PROCEDURE [dbo].[CommandExecute]
(
    DatabaseContext  nvarchar(max),
    Command          nvarchar(max),
    CommandType      nvarchar(max),
    Command2         smallint(max)

)





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
