SELECT gs.date AS data
FROM (
  SELECT visit_date
  FROM person_visits
  WHERE person_id BETWEEN 1 AND 2
) AS pv
RIGHT JOIN
(SELECT DATE(generate_series('2022-01-01','2022-01-10', interval '1 day')) AS date) AS gs
ON pv.visit_date = gs.date
WHERE pv.visit_date IS NULL
ORDER BY data