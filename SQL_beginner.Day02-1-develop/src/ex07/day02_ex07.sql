SELECT pizzeria.name
FROM menu
JOIN pizzeria
ON pizzeria.id = menu.pizzeria_id
JOIN person_visits
ON person_visits.pizzeria_id = menu.pizzeria_id
JOIN person
ON person_visits.person_id = person.id
WHERE person_visits.visit_date = '2022-01-08' AND person.name = 'Dmitriy' AND menu.price <  800