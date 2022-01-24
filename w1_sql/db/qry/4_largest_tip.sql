-- On which day it was the largest tip in January? (note: it's not a typo, it's "tip", not "trip")
SELECT t.tpep_pickup_datetime::date
FROM taxi.trip t
WHERE extract(month FROM tpep_pickup_datetime) = 1
ORDER BY tip_amount DESC
LIMIT 1
;
