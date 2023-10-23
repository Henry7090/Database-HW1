select themes.name, avg(sets.num_parts) as theme_sets_avg
from themes, sets
where themes.id = sets.theme_id
group by themes.name
order by theme_sets_avg

