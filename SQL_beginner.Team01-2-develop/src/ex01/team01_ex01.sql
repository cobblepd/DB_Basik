--insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
--insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH temp_balance AS 
(
    SELECT balance.user_id, currency.id, currency.name, balance.money,
	(SELECT currency.rate_to_usd 
	 FROM currency
		WHERE currency.id = balance.currency_id AND currency.updated < balance.updated
		ORDER BY rate_to_usd
		LIMIT 1
	) AS minimal,
	(SELECT currency.rate_to_usd 
	 FROM currency
		WHERE currency.id = balance.currency_id AND currency.updated > balance.updated
		ORDER BY rate_to_usd
		LIMIT 1
	) AS maximal
    FROM currency
    JOIN balance ON currency.id = balance.currency_id
    GROUP BY balance.money, currency.name, currency.id, balance.updated, balance.currency_id, balance.user_id
    ORDER BY minimal DESC, maximal, balance.updated
)
SELECT 
COALESCE("user".name, 'not defined') AS name, 
COALESCE("user".lastname, 'not defined') AS lastname,
temp_balance.name AS currency_name, 
temp_balance.money * COALESCE(minimal, maximal) AS currency_in_usd
FROM "user"
RIGHT JOIN temp_balance ON temp_balance.user_id = "user".id
ORDER BY name DESC, lastname, currency_name