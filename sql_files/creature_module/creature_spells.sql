-- =================================================================
-- Tables:
-- Creature spells
-- Creature has spells
-- =================================================================




-- Creature spells table
CREATE TABLE creature_spells(
  creature_spell_id INTEGER PRIMARY KEY,
  ritual TEXT,
  spell_name TEXT NOT NULL,
  spell_desc TEXT NOT NULL,
  spell_level INTEGER NOT NULL,
  spell_school TEXT NOT NULL,
  cast_time TEXT NOT NULL,
  range INTEGER NOT NULL,
  components TEXT,
  concentration TEXT,
  duration TEXT,
  innate_bool BOOL
);

-- Creature has spells table
CREATE TABLE creature_has_spells(
  creature_spell_ID INTEGER,
  creatureID INTEGER,
  PRIMARY KEY(creature_spell_ID, creatureID),
  FOREIGN KEY (creature_spell_ID) REFERENCES creature_spells(creature_spell_id),
  FOREIGN KEY (creatureID) REFERENCES creature(creature_id)
);