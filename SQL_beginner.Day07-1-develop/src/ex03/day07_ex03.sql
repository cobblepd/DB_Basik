WITH po AS (SELECT pizzeria.name, COUNT(*) AS count FROM person_order
    JOIN menu ON menu.id = person_order.menu_id
    JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
    GROUP BY pizzeria.name),
     pv AS
(SELECT pizzeria.name, COUNT(*) AS count
FROM person_visits
    JOIN pizzeria
        ON person_visits.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name)

SELECT pv.name, CASE WHEN (pv.count+po.count) IS NOT NULL THEN pv.count+po.count ELSE pv.count END as total_count
FROM po
FULL JOIN pv
ON pv.name = po.name
ORDER BY 2 DESC, 1;

