# Write your MySQL query statement below
SELECT P.product_name,SUM(O.unit) AS unit
FROM Products P
         INNER JOIN ORDERS O ON O.product_id = P.product_id
WHERE O.order_date >= '2020-02-01' AND  O.order_date <= '2020-02-29'
GROUP BY P.product_name
HAVING SUM(O.unit) > 99
