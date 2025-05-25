INSERT INTO person_order (ID, person_id, menu_id, order_date)
VALUES ((generate_series((SELECT Max(ID)+1 froM person_order), (SELECT Max(ID)+(SELECT max(ID) froM PERSON) froM person_order))),(generate_series((SELECT MIN(id) FROM person), (SELECT MAX(id) FROm person))), (SELECT id FROM menu WHERE pizza_name = 'greek pizza'), '2022-02-25');
