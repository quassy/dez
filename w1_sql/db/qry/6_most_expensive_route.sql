-- What's the pickup-dropoff pair with the largest average price for a ride (calculated based on 
-- total_amount)? Enter two zone names separated by a slash
-- For example:"Jamaica Bay / Clinton East"
-- If any of the zone names are unknown (missing), write "Unknown". 
-- For example, "Unknown / Clinton East".
select
	concat(replace(z_pu."zone", 'NA','Unknown'), '/', replace(z_do."zone", 'NA', 'Unknown'))
from
	(
	select
		pulocationid,
		dolocationid,
		avg(total_amount::numeric) total_amount_avg
	from
		taxi.trip t
	group by
		pulocationid,
		dolocationid
	order by
		total_amount_avg desc
) s
left join "zone" z_pu on
	s.pulocationid = z_pu.locationid
left join "zone" z_do on
	s.dolocationid = z_do.locationid
;
