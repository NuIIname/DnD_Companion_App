-- =================================================================
-- Tables:
-- Race
-- Race character movement
-- Race weapon
-- Race trait
-- Race proficiency tables
-- Subrace
-- =================================================================



-- Race table
CREATE TABLE race(
  race_id INTEGER PRIMARY KEY,
  creature_size TEXT NOT NULL,
  str INTEGER CHECK(str >= 1 AND str <= 30),
  dex INTEGER CHECK(dex >= 1 AND dex <= 30),
  con INTEGER CHECK(con >= 1 AND con <= 30),
  int INTEGER CHECK(int >= 1 AND int <= 30),
  wis INTEGER CHECK(wis >= 1 AND wis <= 30),
  cha INTEGER CHECK(cha >= 1 AND cha <= 30),
  natural_armor INTEGER CHECK(natural_armor >= 0),
  race_name TEXT NOT NULL
);

-- Race character movement table
CREATE TABLE race_character_movement(
  race_id INTEGER PRIMARY KEY,
  walking INTEGER CHECK(walking >= 0),
  swim INTEGER CHECK(swim >= 0),
  climb INTEGER CHECK(climb >= 0),
  fly INTEGER CHECK(fly >= 0),
  burrow INTEGER CHECK(burrow >= 0),
  FOREIGN KEY (race_id) REFERENCES race(race_id)
);

-- Race weapon table
CREATE TABLE race_weapon(
  race_id INTEGER,
  race_weapon_id INTEGER,
  damage_dice TEXT,
  modifier INTEGER NOT NULL,
  damage_type TEXT NOT NULL,
  PRIMARY KEY (race_id, race_weapon_id)
  FOREIGN KEY (race_id) REFERENCES race(race_id)
);

-- Race trait table
CREATE TABLE race_trait(
  race_id INTEGER,
  trait_id INTEGER,
  trait_name TEXT NOT NULL,
  trait_description TEXT,
  PRIMARY KEY (race_id, trait_id )
  FOREIGN KEY (race_id) REFERENCES race(race_id)
);

-- Race weapon proficiencies table
CREATE TABLE race_weapon_proficiencies(
  race_id INTEGER,
  race_weapon_prof INTEGER,
  PRIMARY KEY (race_id, race_weapon_prof)
  FOREIGN KEY (race_id) REFERENCES race(race_id)
);

-- Race armor proficiencies table
CREATE TABLE race_armor_proficiencies(
  race_id INTEGER,
  race_armor_prof INTEGER,
  PRIMARY KEY (race_id, race_armor_prof)
  FOREIGN KEY (race_id) REFERENCES race(race_id)
);

-- Race lang proficiencies table
CREATE TABLE race_lang_proficiencies(
  race_id INTEGER,
  race_lang_prof INTEGER,
  PRIMARY KEY (race_id, race_lang_prof)
  FOREIGN KEY (race_id) REFERENCES race(race_id)
);

-- Race skill proficiencies table
CREATE TABLE race_skill_proficiencies(
  race_id INTEGER,
  race_skill_prof INTEGER,
  race_skill_expertise BOOL,
  PRIMARY KEY (race_id, race_skill_prof)
  FOREIGN KEY (race_id) REFERENCES race(race_id)
);

-- Race tool proficiencies table
CREATE TABLE race_tool_proficiencies(
  race_id INTEGER,
  race_tool_prof INTEGER,
  race_tool_expertise BOOL,
  PRIMARY KEY (race_id, race_tool_prof)
  FOREIGN KEY (race_id) REFERENCES race(race_id)
);

-- Race saving throw proficiencies table
CREATE TABLE race_saving_throw_proficiencies(
  race_id INTEGER,
  race_saving_throw_prof TEXT,
  PRIMARY KEY (race_id, race_saving_throw_prof)
  FOREIGN KEY (race_id) REFERENCES race(race_id)
);

-- Subrace table
CREATE TABLE subrace(
  race_id INTEGER,
  subrace_id INTEGER,
  subrace_name TEXT NOT NULL,
  PRIMARY KEY (race_id, subrace_id)
  FOREIGN KEY (race_id) REFERENCES race(race_id)
);