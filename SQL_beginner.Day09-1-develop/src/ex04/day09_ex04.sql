CREATE OR REPLACE FUNCTION fnc_persons_male()
RETURNS TABLE(id BIGINT, name VARCHAR, age INT, gender VARCHAR, address VARCHAR) AS $$
SELECT * FROM person WHERE gender = 'male';
$$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION fnc_persons_female()
RETURNS TABLE(id BIGINT, name VARCHAR, age INT, gender VARCHAR, address VARCHAR) AS $$
SELECT * FROM person WHERE gender = 'female';
$$ LANGUAGE SQL;

SELECT * FROM fnc_persons_male();
SELECT * FROM fnc_persons_female();
