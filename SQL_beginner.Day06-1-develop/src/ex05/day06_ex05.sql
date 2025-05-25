COMMENT ON TABLE person_discounts IS 'Таблица содержащая персональную скидку';
COMMENT ON COLUMN person_discounts.id IS 'Идентификатор первичного ключа';
COMMENT ON COLUMN person_discounts.person_id IS 'Идентификатор человека';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Идентификатор пиццерии';
COMMENT ON COLUMN person_discounts.discount IS 'Значение скидки в процентах';