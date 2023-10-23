with themes_of_set(name, total_set) as(
	select themes.name, count(sets.name)
	from sets, themes
	where themes.id = sets.theme_id
	group by themes.name
)
select name, total_set as max_set
from themes_of_set
where
total_set = (
	select max(total_set)
	from themes_of_set
 );