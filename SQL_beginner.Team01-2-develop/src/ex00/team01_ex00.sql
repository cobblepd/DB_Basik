WITH temp_currency AS (
    SELECT DISTINCT ON (id) id, name, rate_to_usd
    FROM currency
    ORDER BY id, updated DESC
)
SELECT 
COALESCE("user".name, '<not defined>') AS name,
COALESCE("user".lastname, '<not defined>') AS lastname,
balance.type, 
SUM(balance.money) AS volume,
COALESCE(temp_currency.name, '<not defined>') AS currency_name,
COALESCE(temp_currency.rate_to_usd, 1) AS last_rate_to_usd,
COALESCE(temp_currency.rate_to_usd, 1) * SUM(balance.money) AS total_volume_in_usd
FROM "user"
FULL JOIN balance ON "user".id = balance.user_id
FULL JOIN temp_currency ON temp_currency.id = balance.currency_id
GROUP BY "user".name, "user".lastname, balance.type, temp_currency.name, temp_currency.rate_to_usd
ORDER BY name DESC, lastname, type