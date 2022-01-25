/* Write an SQL query to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.
+----+---------+
| id | student |
+----+---------+
| 1  | Abbot   |
| 2  | Doris   |
| 3  | Emerson |
| 4  | Green   |
| 5  | Jeames  |
+----+---------+
+----+---------+
| id | student |
+----+---------+
| 1  | Doris   |
| 2  | Abbot   |
| 3  | Green   |
| 4  | Emerson |
| 5  | Jeames  |
+----+---------+.  */




select s.id as id, 
case
when mod(s.id,2) = 0 then (select s2.student from seat s2 where s2.id = s.id-1)
when mod(s.id,2) = 1 and exists( select * from seat s3 where s3.id = s.id+1) then (select s1.student from seat s1 where s1.id= s.id+1)
else s.student
end as student
from seat s;
