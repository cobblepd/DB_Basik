SELECT person.name, menu.pizza_name, menu.price, price-((discount*menu.price)/100) AS discount_price, pizzeria.name AS pizzeria_name
FROM person_order
    JOIN person
        ON person_order.person_id = person.id
    JOIN menu
        ON person_order.menu_id = menu.id
JOIN person_discounts
    ON person_discounts.person_id = person.id and person_discounts.pizzeria_id = menu.pizzeria_id
JOIN pizzeria
    ON menu.pizzeria_id = pizzeria.id
ORDER BY person.name, menu.pizza_name;