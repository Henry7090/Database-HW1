SELECT COUNT(set_num) AS set_num_by_year, year
FROM sets
WHERE year <= 2017 AND year >= 1950
GROUP BY year
ORDER BY set_num_by_year DESC