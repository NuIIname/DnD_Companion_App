// This file essentially serves as the bridge between the flutter app GUI code and the SQLite database engine. If you notice in the code
// it's sqflite and not sqlite. Sqflite is a flutter plugin and the so-called bridge between the flutter app and the SQLite database engine.
// Here, the flutter app will be able to link and retreive data directly from the database.
// If you're curious to learn more about this, go to www.pub.dev/packages/sqflite, there you will find the offical documentation

// To-do:
// Continue adding the rest of the tables to the database
//
// Current bugs:
// none

import 'package:dnd_companion_app/character_tables.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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
  await createCharacterTables(db, version);
}
