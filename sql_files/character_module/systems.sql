-- =================================================================
-- Tables:
-- Inspiration
-- Card system
-- Dice system
-- Advantage system
-- =================================================================


-- Inspiration table
CREATE TABLE inspiration(
  inspiration_id INTEGER PRIMARY KEY
);

-- Card system table
CREATE TABLE card_system(
  inspiration_id INTEGER PRIMARY KEY,
  green INTEGER CHECK(green >= 2 AND green <= 10),
  red INTEGER CHECK(red >= 2 AND red <= 10),
  blue INTEGER CHECK(blue >= 2 AND blue <= 10),
  FOREIGN KEY (inspiration_id) REFERENCES inspiration(inspiration_id)
);

-- Dice system table
CREATE TABLE dice_system(
  inspiration_id INTEGER PRIMARY KEY,
  dice_type TEXT,
  FOREIGN KEY (inspiration_id) REFERENCES inspiration(inspiration_id)
);

-- Advantage system table
CREATE TABLE advantage_system(
  inspiration_id INTEGER PRIMARY KEY,
  FOREIGN KEY (inspiration_id) REFERENCES inspiration(inspiration_id)
);