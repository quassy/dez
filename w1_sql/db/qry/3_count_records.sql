-- How many taxi trips were there on January 15?
SELECT count(t.*)
FROM taxi.trip t
WHERE tpep_pickup_datetime::date = '2021-01-15'
;
