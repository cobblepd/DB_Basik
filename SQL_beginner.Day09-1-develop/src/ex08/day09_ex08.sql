CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE(num BIGINT) AS $$
WITH RECURSIVE fibonacci(a,b) AS (
SELECT 0 AS a, 1 AS b
UNION ALL
SELECT b, a + b AS a FROM fibonacci
WHERE pstop > b
)
SELECT a FROM fibonacci;
$$ LANGUAGE sql;

SELECT * FROM fnc_fibonacci(100);

SELECT * FROM fnc_fibonacci();