SELECT
CASE WHEN (person.name IS NOT NULL) THEN person.name ELSE '-' END  AS person_name,
visit_date,
CASE WHEN (pizzeria.name IS NOT NULL) THEN pizzeria.name ELSE '-' END AS pizzeria_name
FROM ( SELECT * FROM person_visits
WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') AS vd
FULL JOIN person ON person.id = vd.person_id
FULL JOIN pizzeria ON pizzeria.id = vd.pizzeria_id
ORDER BY person_name, visit_date, pizzeria_name
