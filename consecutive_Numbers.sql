#Write an SQL query to find all numbers that appear at least three times consecutively.
#id int, primary key
#num Varchar
#id. num
#1.   1
#2.   1
#3.   1
#4.   2
#Ans: 1



SELECT DISTINCT
       t1.num         AS ConsecutiveNums
  FROM logs t1
       INNER JOIN
       logs t2
        ON t1.num= t2.num
       AND t1.id = t2.id + 1
       INNER JOIN
       logs t3
        ON t1.num= t3.num
       AND t1.id = t3.id + 2;
