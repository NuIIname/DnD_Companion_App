-- =================================================================
-- Tables:
-- Spells
-- =================================================================


-- Spells table
CREATE TABLE spells(
  spell_id INTEGER PRIMARY KEY,
  ritual TEXT,
  spell_name TEXT NOT NULL,
  spell_desc TEXT NOT NULL,
  spell_level INTEGER NOT NULL,
  spell_school TEXT NOT NULL,
  cast_time TEXT NOT NULL,
  range INTEGER NOT NULL,
  components TEXT,
  duration TEXT
);