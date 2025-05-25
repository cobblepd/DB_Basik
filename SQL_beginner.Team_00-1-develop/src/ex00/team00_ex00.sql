CREATE TABLE IF NOT EXISTS graph
(
    point1 VARCHAR  NOT NULL,
    point2 VARCHAR  NOT NULL,
    cost   INT      NOT NULL
);

INSERT INTO graph (point1, point2, cost)
VALUES ('a', 'b', 10),
       ('b', 'a', 10),
       ('a', 'c', 15),
       ('c', 'a', 15),
       ('a', 'd', 20),
       ('d', 'a', 20),
       ('b', 'd', 25),
       ('d', 'b', 25),
       ('c', 'd', 30),
       ('d', 'c', 30),
       ('b', 'c', 35),
       ('c', 'b', 35);

WITH
-- расчет туров
    RECURSIVE path AS (
-- стартовая ветка
        SELECT 
            point1 AS track, 
            point2 AS next_point, 
            cost AS result_cost,
            1 as point_counter
        FROM 
            graph
        WHERE point1 = 'a'
        
        UNION
-- рекурсивная ветка
        SELECT 
            path.track || ',' || path.next_point AS track, 
            graph.point1 AS next_point, 
            path.result_cost + graph.cost AS result_cost,
            path.point_counter + 1 as point_counter
        FROM 
            path 
            INNER JOIN graph 
                ON (path.next_point = graph.point2)
 -- условие выхода из цикла: повторное посещение точки
        WHERE track NOT LIKE '%' || graph.point2 || '%'
    ),
-- расчет количества точек в задаче
    amount_points as (
        select 
            count(unique_points.point1) as amount
        from
            (
                select distinct 
                    point1 
                from 
                    graph
            ) as unique_points
    ),
-- итоговый набор туров
    all_tours as (
        SELECT 
            '{' || track || ',' || 'a' || '}' AS track, 
            result_cost AS total_cost,
            point_counter
        FROM 
            path
        WHERE 
-- условия отбора: пройдены все точки + возврат точку а
            point_counter = (select * from amount_points)
                AND next_point = 'a'
    )
-- вывод туров с минимальной ценой
select
    total_cost,
    track as tour
FROM 
    all_tours
where 
    total_cost = (select min(total_cost) from all_tours)
order by 1, 2;