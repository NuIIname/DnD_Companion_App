import 'package:sqflite/sqflite.dart';
import 'package:flutter/foundation.dart';

Future<void> createCreatureTables(Database db, int version) async {
  // Creature table
  await db.execute('''CREATE TABLE creature(
  creature_id INTEGER PRIMARY KEY,
  creature_name TEXT NOT NULL,
  creature_armor_class TEXT CHECK(creature_armor_class >= 0),
  str INTEGER CHECK(str >= 0 AND str <= 30),
  dex INTEGER CHECK(dex >= 0 AND dex <= 30),
  con INTEGER CHECK(con >= 0 AND con <= 30),
  int INTEGER CHECK(int >= 0 AND int <= 30),
  wis INTEGER CHECK(wis >= 0 AND wis <= 30),
  cha INTEGER CHECK(cha >= 0 AND cha <= 30),
  cr INTEGER CHECK(str >= 0 AND str <= 30),
  damage_resistance TEXT,
  creature_conditions TEXT,
  creature_hit_die INTEGER,
  creature_static_hp INTEGER,
  creature_size INTEGER NOT NULL,
  alignment TEXT
  )''');

  // Creature movement table
  await db.execute('''CREATE TABLE creature_movement(
  creatureID INTEGER,
  creature_moveID INTEGER,
  walking INTEGER,
  swim INTEGER,
  burrow INTEGER,
  climb INTEGER,
  fly INTEGER,
  PRIMARY KEY(creatureID, creature_moveID),
  FOREIGN KEY (creatureID) REFERENCES creature(creature_id)
  )''');

  // Creature type table
  await db.execute('''CREATE TABLE creature_type(
  creatureID INTEGER PRIMARY KEY,
  FOREIGN KEY (creatureID) REFERENCES creature(creature_id)
  )''');

  // Creature feature table
  await db.execute('''CREATE TABLE creature_feature(
  creatureID INTEGER,
  creature_feature_id INTEGER,
  creature_feature_name TEXT,
  creature_feature_description TEXT,
  PRIMARY KEY (creatureID, creature_feature_id),
  FOREIGN KEY (creatureID) REFERENCES creature(creature_id)
  )''');

  // Has creature feature table
  await db.execute('''CREATE TABLE has_creature_feature(
  creatureID INTEGER,
  creature_feature_id INTEGER,
  PRIMARY KEY (creatureID, creature_feature_id),
  FOREIGN KEY (creatureID) REFERENCES creature(creature_id)
  )''');

  // Creature feature uses table
  await db.execute('''CREATE TABLE creature_feature_uses(
  creature_feature_id INTEGER,
  use_type TEXT,
  PRIMARY KEY (creature_feature_id, use_type),
  FOREIGN KEY (creature_feature_id) REFERENCES creature_feature(creature_feature_id)
  )''');

  // Creature weapon proficiencies table
  await db.execute('''CREATE TABLE creature_weapon_proficiencies(
  creature_ID INTEGER,
  creature_weapon_prof TEXT,
  PRIMARY KEY (creature_ID, creature_weapon_prof),
  FOREIGN KEY (creature_ID) REFERENCES creature(creature_ID)
  )''');

  // Creature lang proficiencies table
  await db.execute('''CREATE TABLE creature_lang_proficiencies(
  creature_ID INTEGER,
  creature_lang_prof TEXT,
  PRIMARY KEY (creature_ID, creature_lang_prof),
  FOREIGN KEY (creature_ID) REFERENCES creature(creature_ID)
  )''');

  // Creature skill proficiencies table
  await db.execute('''CREATE TABLE creature_skill_proficiencies(
  creature_ID INTEGER,
  creature_skill_prof TEXT,
  PRIMARY KEY (creature_ID, creature_skill_prof),
  FOREIGN KEY (creature_ID) REFERENCES creature(creature_ID)
  )''');

  // Creature tool proficiencies table
  await db.execute('''CREATE TABLE creature_tool_proficiencies(
  creature_ID INTEGER,
  creature_tool_prof TEXT,
  expertise BOOL,
  PRIMARY KEY (creature_ID, creature_tool_prof),
  FOREIGN KEY (creature_ID) REFERENCES creature(creature_ID)
  )''');

  // Creature saving throw proficiencies table
  await db.execute('''CREATE TABLE creature_saving_throw_proficiencies(
  creature_ID INTEGER PRIMARY KEY,
  abs TEXT NOT NULL,
  FOREIGN KEY (creature_ID) REFERENCES creature(creature_ID)
  )''');

  // Creature spells table
  await db.execute('''CREATE TABLE creature_spells(
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
  )''');

  // Creature has spells table
  await db.execute('''CREATE TABLE creature_has_spells(
  creature_spell_ID INTEGER,
  creatureID INTEGER,
  PRIMARY KEY(creature_spell_ID, creatureID),
  FOREIGN KEY (creature_spell_ID) REFERENCES creature_spells(creature_spell_id),
  FOREIGN KEY (creatureID) REFERENCES creature(creature_id)
  )''');

  // Has action table
  await db.execute('''CREATE TABLE has_action(
  creature_ID INTEGER,
  creature_action_id INTEGER,
  PRIMARY KEY(creature_ID, creature_action_id),
  FOREIGN KEY (creature_action_id) REFERENCES creature_action(creature_action_id),
  FOREIGN KEY (creature_ID) REFERENCES creature(creature_id)
  )''');

  // Creature action table
  await db.execute('''CREATE TABLE creature_action(
  creature_ID INTEGER,
  creature_action_id INTEGER,
  creature_action_description TEXT,
  creature_action_name TEXT NOT NULL,
  creature_action_type TEXT NOT NULL,
  PRIMARY KEY(creature_ID, creature_action_id),
  FOREIGN KEY (creature_ID) REFERENCES creature(creature_id)
  )''');

  debugPrint("CREATURE TABLES LOADED");
}
