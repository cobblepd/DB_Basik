SELECT p.name AS person_name1, person.name AS person_name2, person.address AS common_address
FROM person
JOIN
(SELECT name, address, id FROM person AS name2) AS p
ON p.address = person.address AND person.id < p.id
ORDER BY person_name1, person_name2, common_address