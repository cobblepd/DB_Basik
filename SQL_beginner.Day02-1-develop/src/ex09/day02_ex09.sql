SELECT name
FROM person
JOIN person_order
ON person.id = person_order.person_id
JOIN menu
ON menu.id = person_order.menu_id
WHERE person.gender = 'female' AND menu.pizza_name = 'cheese pizza'
INTERSECT
SELECT name
FROM person
JOIN person_order
ON person.id = person_order.person_id
JOIN menu
ON menu.id = person_order.menu_id
WHERE person.gender = 'female' AND menu.pizza_name = 'pepperoni pizza'
ORDER BY name;