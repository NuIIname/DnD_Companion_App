-- =================================================================
-- Tables:
-- Character
-- Character Feats
-- Background tables
-- Personal info
-- Inventory
-- Subinventory
-- =================================================================


-- Character table
CREATE TABLE characters(
  character_id INTEGER PRIMARY KEY,
  rID INTEGER,
  conditions TEXT,
  xp INTEGER CHECK(xp >= 0),
  resurrection_dc INTEGER CHECK(resurrection_dc >= 10),
  alignment TEXT,
  death_saves INTEGER CHECK(death_saves >= 0 AND death_saves <= 3),
  FOREIGN KEY (rID) REFERENCES race(race_id) 
  );


-- Character Feats table
CREATE TABLE character_feats(
  character_id INTEGER,
  feat_id INTEGER,
  repeatable INTEGER CHECK(repeatable == 1 OR repeatable == 0), -- Safer to use an int rather than a bool in sql
  feat_name TEXT NOT NULL,
  feat_description TEXT,
  feat_race_req TEXT,
  feat_class_req TEXT,
  feat_lvl_req INTEGER CHECK(feat_lvl_req >= 1 AND feat_lvl_req <= 20),
  PRIMARY KEY (character_id, feat_id),
  FOREIGN KEY (character_id) REFERENCES characters(character_id)
);

-- Background table
CREATE TABLE background(
  background_id INTEGER PRIMARY KEY,
  background_name TEXT NOT NULL,
  background_equipment TEXT,
  starting_gold INTEGER CHECK(starting_gold >= 0),
  background_feature_name TEXT NOT NULL,
  background_feature_description TEXT NOT NULL
);

-- Background weapon proficiencies table
CREATE TABLE background_weapon_proficiencies(
  background_id INTEGER,
  background_weapon_prof TEXT,
  PRIMARY KEY (background_id, background_weapon_prof),
  FOREIGN KEY (background_id) REFERENCES background(background_id)
);

-- Background armor proficiencies table
CREATE TABLE background_armor_proficiencies(
  background_id INTEGER,
  background_armor_prof TEXT,
  PRIMARY KEY (background_id, background_armor_prof),
  FOREIGN KEY (background_id) REFERENCES background(background_id)
);

-- Background lang proficiencies table
CREATE TABLE background_lang_proficiencies(
  background_id INTEGER,
  background_lang_prof TEXT,
  PRIMARY KEY (background_id, background_lang_prof),
  FOREIGN KEY (background_id) REFERENCES background(background_id)
);

-- Background skill proficiencies table
CREATE TABLE background_skill_proficiencies(
  background_id INTEGER,
  background_skill_prof TEXT,
  PRIMARY KEY (background_id, background_skill_prof),
  FOREIGN KEY (background_id) REFERENCES background(background_id)
);

-- Background tool proficiencies table
CREATE TABLE background_tool_proficiencies(
  background_id INTEGER,
  background_tool_prof TEXT,
  PRIMARY KEY (background_id, background_tool_prof),
  FOREIGN KEY (background_id) REFERENCES background(background_id)
);

-- Background saving throw proficiencies table
CREATE TABLE background_saving_throw_proficiencies(
  background_id INTEGER,
  background_saving_throw_prof TEXT,
  PRIMARY KEY (background_id, background_saving_throw_prof),
  FOREIGN KEY (background_id) REFERENCES background(background_id)
);



-- Personal info table
CREATE TABLE personal_info(
  background_id INTEGER,
  personal_info_id INTEGER PRIMARY KEY,
  personal_traits TEXT,
  ideals TEXT,
  bonds TEXT,
  flaws TEXT,
  about TEXT,
  FOREIGN KEY (background_id) REFERENCES background(background_id)
);



-- Inventory table
CREATE TABLE inventory(
  inventory_id INTEGER,
  character_id INTEGER,
  copper INTEGER,
  silver INTEGER,
  electrum INTEGER,
  gold INTEGER,
  platinum INTEGER,
  PRIMARY KEY (inventory_id, character_id),
  FOREIGN KEY (character_id) REFERENCES character(character_id)
);

-- Sub_inventory table
CREATE TABLE sub_inventory(
  subinventory_id INTEGER,
  item_id INTEGER,
  PRIMARY KEY (subinventory_id, item_id),
  FOREIGN KEY (item_id) REFERENCES item(item_id)
);

