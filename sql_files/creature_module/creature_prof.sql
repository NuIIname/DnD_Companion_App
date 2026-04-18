-- =================================================================
-- Tables:
-- Creature weapon proficiencies
-- Creature lang proficiencies
-- Creature skill proficiencies
-- Creature tool proficiencies
-- Creature saving throw proficiencies
-- =================================================================



-- Creature weapon proficiencies table
CREATE TABLE creature_weapon_proficiencies(
  creature_ID INTEGER,
  creature_weapon_prof TEXT,
  PRIMARY KEY (creature_ID, creature_weapon_prof),
  FOREIGN KEY (creature_ID) REFERENCES creature(creature_ID)
);

-- Creature lang proficiencies table
CREATE TABLE creature_lang_proficiencies(
  creature_ID INTEGER,
  creature_lang_prof TEXT,
  PRIMARY KEY (creature_ID, creature_lang_prof),
  FOREIGN KEY (creature_ID) REFERENCES creature(creature_ID)
);

-- Creature skill proficiencies table
CREATE TABLE creature_skill_proficiencies(
  creature_ID INTEGER,
  creature_skill_prof TEXT,
  PRIMARY KEY (creature_ID, creature_skill_prof),
  FOREIGN KEY (creature_ID) REFERENCES creature(creature_ID)
);

-- Creature tool proficiencies table
CREATE TABLE creature_tool_proficiencies(
  creature_ID INTEGER,
  creature_tool_prof TEXT,
  expertise BOOL,
  PRIMARY KEY (creature_ID, creature_tool_prof),
  FOREIGN KEY (creature_ID) REFERENCES creature(creature_ID)
);

-- Creature saving throw proficiencies table
CREATE TABLE creature_saving_throw_proficiencies(
  creature_ID INTEGER PRIMARY KEY,
  abs TEXT NOT NULL,
  FOREIGN KEY (creature_ID) REFERENCES creature(creature_ID)
);
