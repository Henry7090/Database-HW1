WITH
    -- to count the number of parts in each color and inventory
    quantity(color_name, inventory_id, quantity_sum, part_num) AS(

        SELECT 
            colors.name,
            inventory_id,
            SUM(inventory_parts.quantity),
            inventory_parts.part_num
        FROM 
            inventory_parts JOIN colors ON colors.id = inventory_parts.color_id
        GROUP BY 
            colors.id, inventory_id, inventory_parts.part_num
    ),
    total_quantity(theme_id, color_name, total_quantity, rnk) AS(
        SELECT 
            sets.theme_id,
            quantity.color_name,
            SUM(quantity.quantity_sum),
			RANK() OVER (PARTITION BY sets.theme_id ORDER BY SUM(quantity.quantity_sum) DESC) AS rank
        FROM 
            (sets JOIN inventories ON sets.set_num = inventories.set_num) 
            JOIN quantity ON inventories.id = quantity.inventory_id
        GROUP BY
            sets.theme_id, quantity.color_name
    )
SELECT themes.name, total_quantity.color_name
from themes, total_quantity
where themes.id = total_quantity.theme_id AND total_quantity.rnk = 1
order by themes.name

