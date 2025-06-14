WITH po AS (SELECT pizzeria.name, COUNT(*) AS count, 'order' AS action_type FROM person_order
    JOIN menu ON menu.id = person_order.menu_id
    JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
    GROUP BY pizzeria.name
    ORDER BY count DESC, name),
     pv AS
(SELECT pizzeria.name, COUNT(*) AS count, 'visit' AS action_type
FROM person_visits
    JOIN pizzeria
        ON person_visits.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY count DESC, name)
(SELECT * FROM po LIMIT 3)
UNION ALL
(SELECT * FROM pv LIMIT 3)
ORDER BY action_type, count DESC;