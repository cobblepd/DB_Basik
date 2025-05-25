SELECT menu.pizza_name, pizzeria.name AS pizzeria_name, menu.price
FROM pizzeria
RIGHT JOIN menu
ON (pizza_name = 'pepperoni pizza' OR pizza_name = 'mushroom pizza') AND menu.pizzeria_id = pizzeria.id
WHERE pizzeria.name IS NOT NULL
ORDER BY menu.pizza_name, pizzeria.name