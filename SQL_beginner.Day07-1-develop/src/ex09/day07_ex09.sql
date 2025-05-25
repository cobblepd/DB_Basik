SELECT person.address, ROUND(MAX(age) - (MIN(age)) / MAX(age::NUMERIC), 2) AS formula, ROUND(AVG(age)::DECIMAL, 2) AS average,
    CASE WHEN MAX(age) - MIN(age) / MAX(age::NUMERIC) > AVG(age)::DECIMAL
        THEN TRUE
        ELSE FALSE
    END AS comparison
FROM person
GROUP BY person.address
ORDER BY 1;





