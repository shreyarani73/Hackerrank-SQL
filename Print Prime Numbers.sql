SELECT LISTAGG(a,'&') WITHIN GROUP (ORDER BY a) AS prime_numbers
FROM
(
SELECT a
FROM (SELECT LEVEL a FROM dual CONNECT BY LEVEL <= 1000)
   , (SELECT LEVEL n FROM dual CONNECT BY LEVEL <= 1000)
GROUP BY a
HAVING COUNT(CASE a/n WHEN trunc(a/n) THEN 1 END) = 2
ORDER BY a
);