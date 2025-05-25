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
-- вывод туров с минимальной ценой и с максимальной ценой
select
    total_cost,
    track as tour
FROM 
    all_tours
where 
    total_cost = (select min(total_cost) from all_tours)
        or total_cost = (select max(total_cost) from all_tours)
order by 1, 2;

DROP table IF EXISTS graph;