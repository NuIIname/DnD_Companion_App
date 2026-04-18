-- =================================================================
-- Tables:
-- Subclass table
-- Subclass feature table
-- Subclass proficienciy tables
-- Has subclass spell
-- =================================================================




-- Subclass table
CREATE TABLE subclass(
  class_id INTEGER,
  subclass_id INTEGER,
  subclass_name TEXT NOT NULL,
  PRIMARY KEY (class_id, subclass_id),
  FOREIGN KEY (class_id) REFERENCES class(class_id)
);

-- Subclass feature table
CREATE TABLE subclass_feature(
  class_id INTEGER,
  subclass_id INTEGER,
  subclass_name TEXT NOT NULL,
  PRIMARY KEY (class_id, subclass_id),
  FOREIGN KEY (class_id, subclass_id) REFERENCES subclass(class_id, subclass_id)
);

-- Subclass weapon proficiencies table
CREATE TABLE subclass_weapon_proficiencies(
  class_id INTEGER,
  subclass_id INTEGER,
  subclass_weapon_prof TEXT,
  PRIMARY KEY (class_id, subclass_id, subclass_weapon_prof),
  FOREIGN KEY (class_id, subclass_id) REFERENCES subclass(class_id, subclass_id)
);

-- Subclass armor proficiencies table
CREATE TABLE subclass_armor_proficiencies(
  class_id INTEGER,
  subclass_id INTEGER,
  subclass_armor_prof INTEGER,
  PRIMARY KEY (class_id, subclass_id, subclass_armor_prof),
  FOREIGN KEY (class_id, subclass_id) REFERENCES subclass(class_id, subclass_id)
);

-- Subclass lang proficiencies table
CREATE TABLE subclass_lang_proficiencies(
  class_id INTEGER,
  subclass_id INTEGER,
  subclass_lang_prof TEXT,
  PRIMARY KEY (class_id, subclass_id, subclass_lang_prof),
  FOREIGN KEY (class_id, subclass_id) REFERENCES subclass(class_id, subclass_id)
);

-- Subclass skill proficiencies table
CREATE TABLE subclass_skill_proficiencies(
  class_id INTEGER,
  subclass_id INTEGER,
  subclass_skill_prof TEXT,
  PRIMARY KEY (class_id, subclass_id, subclass_skill_prof),
  FOREIGN KEY (class_id, subclass_id) REFERENCES subclass(class_id, subclass_id)
);

-- Subclass tool proficiencies table
CREATE TABLE subclass_tool_proficiencies(
  class_id INTEGER,
  subclass_id INTEGER,
  subclass_tool_prof TEXT,
  PRIMARY KEY (class_id, subclass_id, subclass_tool_prof),
  FOREIGN KEY (class_id, subclass_id) REFERENCES subclass(class_id, subclass_id)
);

-- Subclass saving throw proficiencies table
CREATE TABLE subclass_saving_throw_proficiencies(
  class_id INTEGER,
  subclass_id INTEGER,
  subclass_saving_throw_prof TEXT,
  PRIMARY KEY (class_id, subclass_id, subclass_saving_throw_prof),
  FOREIGN KEY (class_id, subclass_id) REFERENCES subclass(class_id, subclass_id)
);


-- Has subclass spell table
CREATE TABLE has_subclass_spell(
  spell_id INTEGER,
  class_id INTEGER,
  subclass_id INTEGER,
  PRIMARY KEY (spell_id, subclass_id, class_id),
  FOREIGN KEY (spell_id) REFERENCES spells(spell_id),
  FOREIGN KEY (class_id, subclass_id) REFERENCES subclass(class_id, subclass_id)
);