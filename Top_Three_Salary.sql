/* A company's executives are interested in seeing who earns the most money in each of the company's departments. A high earner in a department is an employee who has a salary in the top three unique salaries for that department.

Write an SQL query to find the employees who are high earners in each of the departments.
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+.   */


select d.Name as Department, a. Name as Employee, a. Salary 
from (
select e.*, dense_rank() over (partition by DepartmentId order by Salary desc) as DeptPayRank 
from Employee e 
) a 
join Department d
on a. DepartmentId = d. Id 
where DeptPayRank <=3;     
