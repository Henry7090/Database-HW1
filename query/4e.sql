select colors.name, count(distinct inventory_parts.part_num) as unique_parts
from inventory_parts, colors
where colors.id = inventory_parts.color_id
group by colors.id
order by unique_parts desc
limit 10