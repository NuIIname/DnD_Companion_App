-- =================================================================
-- Tables:
-- Has class
-- Class
-- Optional features
-- Gain class
-- Class feature
-- Class proficienciy tables
-- Has class spell
-- =================================================================




-- Has class table
CREATE TABLE has_class(
  character_id INTEGER,
  class_id INTEGER,
  level INTEGER CHECK(level >= 1 AND level <= 20),
  PRIMARY KEY (character_id, class_id)
  FOREIGN KEY (character_id, class_id) REFERENCES race(character, class)
);

-- Class table
CREATE TABLE class(
  class_id INTEGER PRIMARY KEY,
  class_name TEXT NOT NULL,
  class_equip TEXT,
  base_ac INTEGER CHECK(base_ac >= 0),
  dex_ac INTEGER CHECK (dex_ac >= -5 AND dex_ac <= 10),
  unarmored_defense INTEGER
  );

-- Optional features table
CREATE TABLE optional_features(
  class_id INTEGER,
  optional_feature_name TEXT,
  optional_feature_description TEXT,
  PRIMARY KEY (class_id, optional_feature_name)
  FOREIGN KEY (class_id) REFERENCES race(class)

);

-- Gain class table
CREATE TABLE gain_class(
  class_id INTEGER,
  class_feature_id INTEGER,
  PRIMARY KEY (class_id, class_feature_id)
  FOREIGN KEY (class_id, class_feature_id) REFERENCES race(class, class_feature)
);

-- Class feature table
CREATE TABLE class_feature(
  class_featrue_id INTEGER PRIMARY KEY,
  class_feature_name TEXT,
  class_feature_description TEXT
);

-- Class weapon proficiencies table
CREATE TABLE class_weapon_proficiencies(
  class_id INTEGER,
  class_weapon_prof TEXT,
  PRIMARY KEY (class_id, class_weapon_prof),
  FOREIGN KEY (class_id) REFERENCES class(class_id)
);

-- Class armor proficiencies table
CREATE TABLE class_armor_proficiencies(
  class_id INTEGER,
  class_armor_prof TEXT,
  PRIMARY KEY (class_id, class_armor_prof),
  FOREIGN KEY (class_id) REFERENCES class(class_id)
);

-- Class lang proficiencies table
CREATE TABLE class_lang_proficiencies(
  class_id INTEGER,
  class_lang_prof TEXT,
  PRIMARY KEY (class_id, class_lang_prof),
  FOREIGN KEY (class_id) REFERENCES class(class_id)
);

-- Class skill proficiencies table
CREATE TABLE class_skill_proficiencies(
  class_id INTEGER,
  class_skill_prof TEXT,
  PRIMARY KEY (class_id, class_skill_prof),
  FOREIGN KEY (class_id) REFERENCES class(class_id)
);

-- Class tool proficiencies table
CREATE TABLE class_tool_proficiencies(
  class_id INTEGER,
  class_tool_prof TEXT,
  PRIMARY KEY (class_id, class_tool_prof),
  FOREIGN KEY (class_id) REFERENCES class(class_id)
);

-- Class saving throw proficiencies table
CREATE TABLE class_saving_throw_proficiencies(
  class_id INTEGER,
  class_saving_throw_prof TEXT,
  PRIMARY KEY (class_id, class_saving_throw_prof),
  FOREIGN KEY (class_id) REFERENCES class(class_id)
  );


-- Has class spell table
CREATE TABLE has_class_spell(
  spell_id INTEGER,
  class_id INTEGER,
  PRIMARY KEY (spell_id, class_id),
  FOREIGN KEY (class_id) REFERENCES class(class_id)
);



