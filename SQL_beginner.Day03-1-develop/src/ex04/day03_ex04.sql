(SELECT pizzeria.name AS pizzeria_name
 FROM pizzeria
          JOIN menu
               ON menu.pizzeria_id = pizzeria.id
          JOIN person_order
               ON menu.id = person_order.menu_id
          JOIN person
               ON person_order.person_id = person.id
 WHERE person.gender = 'female'
 EXCEPT
 SELECT pizzeria.name
 FROM pizzeria
          JOIN menu
               ON menu.pizzeria_id = pizzeria.id
          JOIN person_order
               ON menu.id = person_order.menu_id
          JOIN person
               ON person_order.person_id = person.id
WHERE person.gender = 'male')
UNION ALL
(SELECT pizzeria.name
 FROM pizzeria
          JOIN menu
               ON menu.pizzeria_id = pizzeria.id
          JOIN person_order
               ON menu.id = person_order.menu_id
          JOIN person
               ON person_order.person_id = person.id
 WHERE person.gender = 'male'
 EXCEPT
 SELECT pizzeria.name
 FROM pizzeria
          JOIN menu
               ON menu.pizzeria_id = pizzeria.id
          JOIN person_order
               ON menu.id = person_order.menu_id
          JOIN person
               ON person_order.person_id = person.id
WHERE person.gender = 'female')
ORDER BY pizzeria_name;