SELECT 
	state, mean(duration)
FROM
	usa_ufo_df
GROUP BY
	state
