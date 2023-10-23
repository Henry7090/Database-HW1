CREATE TABLE public.colors(
	id VARCHAR(20),
    name VARCHAR(50),
    rgb CHAR(6),
    is_trans BOOLEAN,
    primary key (id)
);

CREATE TABLE public.themes
(
	id VARCHAR(20),
    name VARCHAR(100),
    parent_id VARCHAR(20),
    primary key (id)
);

CREATE TABLE public.sets
(
	set_num VARCHAR(20),
    name VARCHAR(100),
    year INT,
    theme_id VARCHAR(20),
    num_parts INT,
    primary key (set_num),
    foreign key (theme_id) references themes(id)
);

CREATE TABLE public.inventories
(
	id VARCHAR(20),
    version INT,
    set_num VARCHAR(20),
    primary key (id),
    foreign key (set_num) references sets(set_num)
);

CREATE TABLE public.inventory_sets
(
	inventory_id VARCHAR(15),
    set_num VARCHAR(20),
    quantity INT,
    primary key (inventory_id, set_num),
    foreign key (inventory_id) references inventories(id),
    foreign key (set_num) references sets(set_num)
);

CREATE TABLE public.part_categories
(
    id VARCHAR(20),
    name VARCHAR(100),
    primary key (id)
);

CREATE TABLE public.parts
(
    part_num VARCHAR(20),
    name VARCHAR(300),
    part_cat_id VARCHAR(15),
    primary key (part_num),
    foreign key (part_cat_id) references part_categories(id)
);

CREATE TABLE public.inventory_parts
(
    inventory_id VARCHAR(20),
    part_num VARCHAR(20),
    color_id VARCHAR(15),
    quantity INT,
    is_spare BOOLEAN,
    foreign key (inventory_id) references inventories(id),
    foreign key (color_id) references colors(id)
);





