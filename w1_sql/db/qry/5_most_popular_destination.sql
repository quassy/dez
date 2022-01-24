-- What was the most popular destination for passengers picked up in central park on January 14? 
-- Enter the zone name (not id). If the zone name is unknown (missing), write "Unknown"
SELECT "zone" FROM (
    SELECT t.dolocationid, z."zone", count(t.row_id) AS row_count
    FROM taxi.trip t
    LEFT JOIN taxi."zone" z ON t.dolocationid = z.locationid
    WHERE tpep_pickup_datetime::date = '2021-01-14' AND pulocationid = 43
    GROUP BY t.dolocationid, z."zone"
    ORDER BY row_count desc
) subquery LIMIT 1;
