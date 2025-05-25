SELECT person.name, COUNT(person_visits.visit_date) AS count_of_visits
FROM person_visits
JOIN person
ON person.id = person_visits.person_id
GROUP BY person_visits.person_id, person.id
HAVING COUNT(person_visits.visit_date) > 3
ORDER BY count_of_visits DESC, person_visits.person_id;