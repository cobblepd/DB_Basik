SELECT m1.pizza_name, pz1.name AS pizzeria_name_1, pz2.name AS pizzeria_name_2, m1.price
FROM menu m1
         JOIN menu m2
              ON m1.price = m2.price AND m1.pizza_name = m2.pizza_name AND m1.id<> m2.id
         JOIN pizzeria pz1
              ON pz1.id = m1.pizzeria_id
         JOIN pizzeria pz2
              ON pz2.id = m2.pizzeria_id
WHERE pz1.id > pz2.id
ORDER BY m1.pizza_name;