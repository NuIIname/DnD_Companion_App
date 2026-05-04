-- =================================================================
-- Tables:
-- Item
-- Weapon 
-- Weapon range
-- Weapon properties
-- Weapon damage
-- Armor
-- Gear table
-- Tool table
-- Consumables table
-- Effects table
-- =================================================================



-- Item table
CREATE TABLE item(
  item_id INTEGER,
  item_name TEXT,
  subinventory_id INTEGER,
  inventory_id INTEGER,
  character_id INTEGER,
  PRIMARY KEY (subinventory_id, item_id, inventory_id, character_id),
  FOREIGN KEY (subinventory_id) REFERENCES sub_inventory(subinventory_id),
  FOREIGN KEY (character_id) REFERENCES characters(character_id),
  FOREIGN KEY (inventory_id) REFERENCES inventory(inventory_id)
);

-- Weapon table
CREATE TABLE weapon(
  item_id INTEGER PRIAMRY KEY,
  FOREIGN KEY (item_id) REFERENCES item(item_id)
);

-- Weapon range table
CREATE TABLE weapon_range(
  item_id INTEGER,
  range_id INTEGER,
  melee_range INTEGER,
  deadly_range INTEGER,
  max_range INTEGER,
  PRIMARY KEY (item_id, range_id),
  FOREIGN KEY (item_id) REFERENCES item(item_id)
);

-- Weapon properties table
CREATE TABLE weapon_properties(
  item_id INTEGER,
  weapon_property_name TEXT,
  weapon_property_description TEXT,
  PRIMARY KEY (item_id, weapon_property_name),
  FOREIGN KEY (item_id) REFERENCES item(item_id)
);

-- Weapon damage table
CREATE TABLE weapon_damage(
  item_id INTEGER,
  damage_type TEXT,
  damage_die INTEGER,
  dice_count INTEGER,
  damage_modifier INTEGER,
  PRIMARY KEY (item_id, damage_type),
  FOREIGN KEY (item_id) REFERENCES item(item_id)
);

-- Armor table
CREATE TABLE armor(
  item_id INTEGER PRIMARY KEY,
  armor_type TEXT NOT NULL,
  str_req INTEGER,
  dex_ac_plus_cap INTEGER,
  stealth_disadvantage INTEGER,
  base_ac_armor INTEGER NOT NULL,
  FOREIGN KEY (item_id) REFERENCES item(item_id)
);

-- Gear table
CREATE TABLE gear(
  item_id INTEGER PRIMARY KEY,
  FOREIGN KEY (item_id) REFERENCES item(item_id)
);

-- Tool table
CREATE TABLE tool(
  item_id INTEGER PRIMARY KEY,
  tool_type TEXT,
  FOREIGN KEY (item_id) REFERENCES item(item_id)
);

-- Consumables table
CREATE TABLE consumables(
  item_id INTEGER PRIMARY KEY,
  charges INTEGER NOT NULL,
  duration INTEGER NOT NULL,
  FOREIGN KEY (item_id) REFERENCES item(item_id)
);

-- Effects table
CREATE TABLE effects(
  item_id INTEGER PRIMARY KEY,
  effect_name TEXT NOT NULL,
  effect_description TEXT,
  FOREIGN KEY (item_id) REFERENCES item(item_id)
);