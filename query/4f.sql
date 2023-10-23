with 
	quantity(color_name, inventory_id, quantity_sum) as(
		select colors.name, inventory_id, sum(inventory_parts.quantity)
		from inventory_parts join colors on colors.id = inventory_parts.color_id
		group by colors.name, inventory_parts.inventory_id, inventory_parts.part_num
-- 		order by inventory_id
	),
	total_quantity(themes_name, color_name, total_quantity, rnk) as(
		SELECT 
			themes.name, quantity.color_name, SUM(quantity.quantity_sum),
			RANK() OVER (PARTITION BY themes.name ORDER BY SUM(quantity.quantity_sum) DESC) rnk
		FROM 
			((themes JOIN sets ON themes.id = sets.theme_id) JOIN inventories ON sets.set_num = inventories.set_num) 
    		JOIN quantity ON inventories.id = quantity.inventory_id
		GROUP BY themes.name, quantity.color_name
)
select themes_name, rnk
from total_quantity
where rnk = 1
order by themes_name
	

