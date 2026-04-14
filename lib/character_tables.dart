import 'package:sqflite/sqflite.dart';
import 'package:flutter/foundation.dart';

Future<void> createCharacterTables(Database db, int version) async {
  // each tables gets an await db.execute function

  // Character table
  await db.execute('''CREATE TABLE characters(
  character_id INTEGER PRIMARY KEY,
  rID INTEGER,
  conditions TEXT,
  xp INTEGER CHECK(xp >= 0),
  resurrection_dc INTEGER CHECK(resurrection_dc >= 10),
  alignment TEXT,
  death_saves INTEGER CHECK(death_saves >= 0 AND death_saves <= 3),
  FOREIGN KEY (rID) REFERENCES race(race_id) 
  )''');

  debugPrint("Character table loaded");

  // Character feats table
  await db.execute('''CREATE TABLE character_feats(
  character_id INTEGER,
  feat_id INTEGER,
  repeatable BOOL,
  feat_name TEXT NOT NULL,
  feat_description TEXT,
  feat_race_req TEXT,
  feat_class_req TEXT,
  feat_lvl_req INTEGER CHECK(feat_lvl_req >= 1 AND feat_lvl_req <= 20),
  PRIMARY KEY (character_id, feat_id),
  FOREIGN KEY (character_id) REFERENCES characters(character_id)
  )''');

  debugPrint("Character feats table loaded");

  // Background table
  await db.execute('''CREATE TABLE background(
  background_id INTEGER PRIMARY KEY,
  background_name TEXT NOT NULL,
  background_equipment TEXT,
  starting_gold INTEGER CHECK(starting_gold >= 0),
  background_feature_name TEXT NOT NULL,
  background_feature_description TEXT NOT NULL
  )''');

  debugPrint("background table 1/7 loaded");

  // Background weapon proficiencies table
  await db.execute('''CREATE TABLE background_weapon_proficiencies(
  background_id INTEGER,
  background_weapon_prof TEXT,
  PRIMARY KEY (background_id, background_weapon_prof),
  FOREIGN KEY (background_id) REFERENCES background(background_id)
  )''');

  debugPrint("background table 2/7 loaded");

  // Background armor proficiencies table
  await db.execute('''CREATE TABLE background_armor_proficiencies(
  background_id INTEGER,
  background_armor_prof TEXT,
  PRIMARY KEY (background_id, background_armor_prof),
  FOREIGN KEY (background_id) REFERENCES background(background_id)
  )''');

  debugPrint("background table 3/7 loaded");

  // Background lang proficiencies table
  await db.execute('''CREATE TABLE background_lang_proficiencies(
  background_id INTEGER,
  background_lang_prof TEXT,
  PRIMARY KEY (background_id, background_lang_prof),
  FOREIGN KEY (background_id) REFERENCES background(background_id)
  )''');

  debugPrint("background table 4/7 loaded");

  // Background skill proficiencies table
  await db.execute('''CREATE TABLE background_skill_proficiencies(
  background_id INTEGER,
  background_skill_prof TEXT,
  PRIMARY KEY (background_id, background_skill_prof),
  FOREIGN KEY (background_id) REFERENCES background(background_id)
  )''');

  debugPrint("background table 5/7 loaded");

  // Background tool proficiencies table
  await db.execute('''CREATE TABLE background_tool_proficiencies(
  background_id INTEGER,
  background_tool_prof TEXT,
  PRIMARY KEY (background_id, background_tool_prof),
  FOREIGN KEY (background_id) REFERENCES background(background_id)
  )''');

  debugPrint("background table 6/7 loaded");

  // Background saving throw proficiencies table
  await db.execute('''CREATE TABLE background_saving_throw_proficiencies(
  background_id INTEGER,
  background_saving_throw_prof TEXT,
  PRIMARY KEY (background_id, background_saving_throw_prof),
  FOREIGN KEY (background_id) REFERENCES background(background_id)
  )''');

  debugPrint("background table 7/7 loaded");

  // Personal info table
  await db.execute('''CREATE TABLE personal_info(
  background_id INTEGER,
  personal_info_id INTEGER PRIMARY KEY,
  personal_traits TEXT,
  ideals TEXT,
  bonds TEXT,
  flaws TEXT,
  about TEXT,
  FOREIGN KEY (background_id) REFERENCES background(background_id)
  )''');

  debugPrint("personal info table loaded");

  // Inspiration table
  await db.execute('''CREATE TABLE inspiration(
  inspirationID INTEGER PRIMARY KEY
  )''');

  debugPrint("inspiration table loaded");

  // Card system table
  await db.execute('''CREATE TABLE card_system(
  inspirationID INTEGER PRIMARY KEY,
  green INTEGER CHECK(green >= 2 AND green <= 10),
  red INTEGER CHECK(red >= 2 AND red <= 10),
  blue INTEGER CHECK(blue >= 2 AND blue <= 10),
  FOREIGN KEY (inspirationID) REFERENCES inspiration(inspirationID)
  )''');

  debugPrint("card system table loaded");

  // Dice system table
  await db.execute('''CREATE TABLE dice_system(
  inspirationID INTEGER PRIMARY KEY,
  dice_type TEXT,
  FOREIGN KEY (inspirationID) REFERENCES inspiration(inspirationID)
  )''');

  debugPrint("dice system table loaded");

  // Advantage system table
  await db.execute('''CREATE TABLE advantage_system(
  inspirationID INTEGER PRIMARY KEY,
  FOREIGN KEY (inspirationID) REFERENCES inspiration(inspirationID)
  )''');

  debugPrint("advantage system table loaded");

  // Race table
  await db.execute('''CREATE TABLE race(
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
  )''');

  debugPrint("race table loaded");

  // Race character movement table
  await db.execute('''CREATE TABLE race_character_movement(
  race_id INTEGER PRIMARY KEY,
  walking INTEGER CHECK(walking >= 0),
  swim INTEGER CHECK(swim >= 0),
  climb INTEGER CHECK(climb >= 0),
  fly INTEGER CHECK(fly >= 0),
  burrow INTEGER CHECK(burrow >= 0),
  FOREIGN KEY (race_id) REFERENCES race(race_id)
  )''');

  debugPrint("race character movement table loaded");
}
