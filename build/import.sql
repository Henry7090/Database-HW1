COPY colors(id, name, rgb, is_trans)
FROM 'C:\Program Files\PostgreSQL\16\bin\Database_HW1\colors.csv'
DELIMITER ',' 
CSV HEADER;

COPY themes(id,name,parent_id)
FROM 'C:\Program Files\PostgreSQL\16\bin\Database_HW1\themes.csv'
DELIMITER ',' 
CSV HEADER;

COPY sets(set_num,name,year,theme_id,num_parts)
FROM 'C:\Program Files\PostgreSQL\16\bin\Database_HW1\sets.csv'
DELIMITER ',' 
CSV HEADER;

COPY inventories(id,version,set_num)
FROM 'C:\Program Files\PostgreSQL\16\bin\Database_HW1\inventories.csv'
DELIMITER ',' 
CSV HEADER;

COPY inventory_sets(inventory_id,set_num,quantity)
FROM 'C:\Program Files\PostgreSQL\16\bin\Database_HW1\inventory_sets.csv'
DELIMITER ',' 
CSV HEADER;

COPY public.part_categories(id,name)
FROM 'C:\Program Files\PostgreSQL\16\bin\Database_HW1\part_categories.csv'
DELIMITER ',' 
CSV HEADER;

COPY parts(part_num,name,part_cat_id)
FROM 'C:\Program Files\PostgreSQL\16\bin\Database_HW1\parts.csv'
DELIMITER ',' 
CSV HEADER;

COPY inventory_parts(inventory_id,part_num,color_id,quantity,is_spare)
FROM 'C:\Program Files\PostgreSQL\16\bin\Database_HW1\inventory_parts.csv'
DELIMITER ',' 
CSV HEADER;

