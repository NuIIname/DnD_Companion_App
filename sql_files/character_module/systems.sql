-- =================================================================
-- Tables:
-- Inspiration
-- Card system
-- Dice system
-- Advantage system
-- =================================================================


-- Inspiration table
CREATE TABLE inspiration(
  inspirationID INTEGER PRIMARY KEY
);

-- Card system table
CREATE TABLE card_system(
  inspirationID INTEGER PRIMARY KEY,
  green INTEGER CHECK(green >= 2 AND green <= 10),
  red INTEGER CHECK(red >= 2 AND red <= 10),
  blue INTEGER CHECK(blue >= 2 AND blue <= 10),
  FOREIGN KEY (inspirationID) REFERENCES inspiration(inspirationID)
);

-- Dice system table
CREATE TABLE dice_system(
  inspirationID INTEGER PRIMARY KEY,
  dice_type TEXT,
  FOREIGN KEY (inspirationID) REFERENCES inspiration(inspirationID)
);

-- Advantage system table
CREATE TABLE advantage_system(
  inspirationID INTEGER PRIMARY KEY,
  FOREIGN KEY (inspirationID) REFERENCES inspiration(inspirationID)
);