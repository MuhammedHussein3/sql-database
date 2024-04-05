Input:
Seat table:
+----+---------+
| id | student |
+----+---------+
| 1  | Abbot   |
| 2  | Doris   |
| 3  | Emerson |
| 4  | Green   |
| 5  | Jeames  |
+----+---------+
Output:
+----+---------+
| id | student |
+----+---------+
| 1  | Doris   |
| 2  | Abbot   |
| 3  | Green   |
| 4  | Emerson |
| 5  | Jeames  |
+----+---------+
Explanation:
Note that if the number of students is odd, there is no need to change the last one's seat.


# solution Write your MySQL query statement below
SELECT * FROM (
    select s1.id as id,s2.student as student from seat s1,seat s2 where s1.id%2=1 and s1.id+1=s2.id
    union
    select s1.id as id,s2.student from seat s1,seat s2 where s1.id%2=0 and s1.id-1=s2.id
    union
    select s1.id as id,s1.student from seat s1 where s1.id%2=1 and s1.id=(select count(*) from seat)
    ) as solve
    order by id:
SELECT * FROM (
    select s1.id as id,s2.student as student from seat s1,seat s2 where s1.id%2=1 and s1.id+1=s2.id
    union
    select s1.id as id,s2.student from seat s1,seat s2 where s1.id%2=0 and s1.id-1=s2.id
    union
    select s1.id as id,s1.student from seat s1 where s1.id%2=1 and s1.id=(select count(*) from seat)
    ) as solve
    order by id