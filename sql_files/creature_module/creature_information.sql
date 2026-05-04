-- =================================================================
-- Tables:
-- Creature
-- Creature movement
-- Creature type
-- =================================================================


-- Creature table
CREATE TABLE creature(
  creature_id INTEGER PRIMARY KEY,
  creature_name TEXT NOT NULL,
  creature_armor_class INTEGER CHECK(creature_armor_class >= 0),
  str INTEGER CHECK(str >= 0 AND str <= 30),
  dex INTEGER CHECK(dex >= 0 AND dex <= 30),
  con INTEGER CHECK(con >= 0 AND con <= 30),
  inte INTEGER CHECK(inte >= 0 AND inte <= 30),
  wis INTEGER CHECK(wis >= 0 AND wis <= 30),
  cha INTEGER CHECK(cha >= 0 AND cha <= 30),
  cr INTEGER CHECK(str >= 0 AND str <= 30),
  damage_resistance TEXT,
  creature_conditions TEXT,
  creature_hit_die INTEGER,
  creature_static_hp INTEGER,
  creature_size TEXT NOT NULL,
  alignment TEXT
);

-- Creature movement table
CREATE TABLE creature_movement(
  creatureID INTEGER,
  creature_moveID INTEGER,
  walking INTEGER,
  swim INTEGER,
  burrow INTEGER,
  climb INTEGER,
  fly INTEGER,
  PRIMARY KEY(creatureID, creature_moveID),
  FOREIGN KEY (creatureID) REFERENCES creature(creature_id)
);

-- Creature type table
CREATE TABLE creature_type(
  creatureID INTEGER PRIMARY KEY,
  FOREIGN KEY (creatureID) REFERENCES creature(creature_id)
);