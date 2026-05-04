// This file essentially serves as the bridge between the flutter app GUI code and the SQLite database engine. If you notice in the code
// it's sqflite and not sqlite. Sqflite is a flutter plugin and the so-called bridge between the flutter app and the SQLite database engine.
// Here, the flutter app will be able to link and retreive data directly from the database.
// If you're curious to learn more about this, go to www.pub.dev/packages/sqflite, there you will find the offical documentation

import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// The DatabaseHelper class serves as a data layer for the flutter UI. This prevents multiple and messy connections and instead
// makes it to where requests are all made through the class.
class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();
  static Database? _database;

  DatabaseHelper._internal();

  factory DatabaseHelper() {
    return instance;
  }

  // Checks if database exists
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await initializeDB('DnD_app.db');
    }

    return _database!;
  }

  // Joins the file and flutter path, this is what links them together
  Future<Database> initializeDB(String fileName) async {
    final dataBasePath = await getDatabasesPath();
    final path = join(dataBasePath, fileName);

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  // =============================================================================

  // This is where all the tables for the database live, this function only runs ONCE.
  // To add new tables while the app is running, we need a function that creates it and updates the version.
  // Version needs to be updated as the app runs, this ensures that the entire system stays on the same page

  // variable naming convention: (module)(category)
  // For example: characterRace - Race belongs to the character module

  Future<void> _onCreate(Database db, int version) async {
    //============================================================
    // Character tables
    final characterInformation = await rootBundle.loadString(
      'sql_files/character_module/character_information.sql',
    );

    final characterGameSystems = await rootBundle.loadString(
      'sql_files/character_module/systems.sql',
    );

    final characterRace = await rootBundle.loadString(
      'sql_files/character_module/race.sql',
    );

    final characterClass = await rootBundle.loadString(
      'sql_files/character_module/class_files/class.sql',
    );

    final characterSubclass = await rootBundle.loadString(
      'sql_files/character_module/class_files/subclass.sql',
    );

    final characterSpells = await rootBundle.loadString(
      'sql_files/character_module/spells.sql',
    );

    final characterItems = await rootBundle.loadString(
      'sql_files/character_module/items.sql',
    );

    //============================================================
    // Creature tables
    final creatureInformation = await rootBundle.loadString(
      'sql_files/creature_module/creature_information.sql',
    );

    final creatureFeatures = await rootBundle.loadString(
      'sql_files/creature_module/creature_features.sql',
    );

    final creatureProf = await rootBundle.loadString(
      'sql_files/creature_module/creature_prof.sql',
    );

    final creatureSpells = await rootBundle.loadString(
      'sql_files/creature_module/creature_spells.sql',
    );

    final creatureActions = await rootBundle.loadString(
      'sql_files/creature_module/creature_actions.sql',
    );

    //============================================================
    // The previous variables grab the tables through their file paths, these functions are what actually load them into flutter

    await _executeSQLFile(db, characterInformation);

    await _executeSQLFile(db, characterGameSystems);

    await _executeSQLFile(db, characterRace);

    await _executeSQLFile(db, characterClass);

    await _executeSQLFile(db, characterSubclass);

    await _executeSQLFile(db, characterSpells);

    await _executeSQLFile(db, characterItems);

    await _executeSQLFile(db, creatureInformation);

    await _executeSQLFile(db, creatureFeatures);

    await _executeSQLFile(db, creatureProf);

    await _executeSQLFile(db, creatureSpells);

    await _executeSQLFile(db, creatureActions);

    // ===================================================

    // Loads the initial data into the database
    final startingData = await rootBundle.loadString(
      'sql_files/initial_data/initial_data.sql',
    );

    await _executeSQLFile(db, startingData);
  }

  // Takes SQL statements and breaks them down tuple by tuple so that they can be executed in dart. This essentially serves as the translator between SQl and Dart code
  Future<void> _executeSQLFile(Database db, String sql) async {
    final tuples = sql
        .split(';')
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty);

    for (final tuple in tuples) {
      await db.execute(tuple);
    }
  }
}
