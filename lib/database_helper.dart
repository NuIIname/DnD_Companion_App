// This file essentially serves as the bridge between the flutter app GUI code and the SQLite database engine. If you notice in the code
// it's sqflite and not sqlite. Sqflite is a flutter plugin and the so-called bridge between the flutter app and the SQLite database engine.
// Here, the flutter app will be able to link and retreive data directly from the database.
// If you're curious to learn more about this, go to www.pub.dev/packages/sqflite, there you will find the offical documentation

// To-do:
// Continue adding the rest of the tables to the database
//
// Current bugs:
// none

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/foundation.dart';

// The DatabaseHelper class serves as a data layer for the flutter UI. This prevents multiple and messy connections and instead
// makes it to where requests are all made through the class.
class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper.init();
  static Database? _database;

  DatabaseHelper.init();

  // Checks if database exists
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB('DnD_app.db');
    }

    return _database!;
  }
}

// Joins the file and flutter path, this is what links the together
Future<Database> _initDB(String fileName) async {
  final dataBasePath = await getDatabasesPath();
  final path = join(dataBasePath, fileName);

  await deleteDatabase(
    path,
  ); // Remove this line in the final product, used for debugging purposes only

  return await openDatabase(path, version: 1, onCreate: _onCreate);
}

// This is where all the tables for the database live, this function only runs ONCE.
// To add new tables during the app running, we need a function that creates it and updates the version.
// Version needs to be updated as the app runs, this ensures that the entire system is on the same page
Future<void> _onCreate(Database db, int version) async {
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
  feat_id INTEGER PRIMARY KEY,
  repeatable BOOL,
  feat_name TEXT NOT NULL,
  feat_description TEXT,
  feat_race_req TEXT,
  feat_class_req TEXT,
  feat_lvl_req INTEGER CHECK(feat_lvl_req >= 1 AND feat_lvl_req <= 20),
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

  debugPrint("background table loaded");

  // Background weapon proficiencies table
  await db.execute('''CREATE TABLE background_weapon_proficiencies(
  background_id INTEGER,
  background_weapon_prof TEXT PRIMARY KEY,
  FOREIGN KEY (background_id) REFERENCES background(background_id)
  )''');

  debugPrint("background table 2 loaded");

  // Background armor proficiencies table
  await db.execute('''CREATE TABLE background_armor_proficiencies(
  background_id INTEGER,
  background_weapon_prof TEXT PRIMARY KEY,
  FOREIGN KEY (background_id) REFERENCES background(background_id)
  )''');

  debugPrint("background table 3 loaded");

  // Background lang proficiencies table
}
