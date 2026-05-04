-- =================================================================
-- Tables:
-- Creature feature
-- Has creature feature
-- Creature feature uses
-- =================================================================


-- Creature feature table
CREATE TABLE creature_feature(
  creatureID INTEGER,
  creature_feature_id INTEGER,
  creature_feature_name TEXT,
  creature_feature_description TEXT,
  PRIMARY KEY (creatureID, creature_feature_id),
  FOREIGN KEY (creatureID) REFERENCES creature(creature_id)
);

-- Has creature feature table
CREATE TABLE has_creature_feature(
  creatureID INTEGER,
  creature_feature_id INTEGER,
  PRIMARY KEY (creatureID, creature_feature_id),
  FOREIGN KEY (creatureID) REFERENCES creature(creature_id)
);

-- Creature feature uses table
CREATE TABLE creature_feature_uses(
  creature_feature_id INTEGER,
  use_type TEXT,
  PRIMARY KEY (creature_feature_id, use_type),
  FOREIGN KEY (creature_feature_id) REFERENCES creature_feature(creature_feature_id)
);