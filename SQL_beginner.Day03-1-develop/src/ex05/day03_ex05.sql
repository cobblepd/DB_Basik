SELECT DISTINCT pizzeria.name AS pizzeria_name
FROM person
         JOIN person_visits
              ON person_visits.person_id = person.id
         JOIN person_order
              ON person_order.person_id = person.id
         JOIN pizzeria
              ON pizzeria.id = person_visits.pizzeria_id
WHERE person.name = 'Andrey' AND visit_date <> order_date
ORDER BY pizzeria_name;
