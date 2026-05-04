-- =================================================================
-- Tables:
-- Has action
-- Creature action
-- =================================================================

-- Has action table
CREATE TABLE has_action(
  creature_ID INTEGER,
  creature_action_id INTEGER,
  PRIMARY KEY(creature_ID, creature_action_id),
  FOREIGN KEY (creature_action_id) REFERENCES creature_action(creature_action_id),
  FOREIGN KEY (creature_ID) REFERENCES creature(creature_id)
);

-- Creature action table
CREATE TABLE creature_action(
  creature_ID INTEGER,
  creature_action_id INTEGER,
  creature_action_description TEXT,
  creature_action_name TEXT NOT NULL,
  creature_action_type TEXT NOT NULL,
  PRIMARY KEY(creature_ID, creature_action_id),
  FOREIGN KEY (creature_ID) REFERENCES creature(creature_id)
);


