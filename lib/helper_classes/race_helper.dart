import 'package:dnd_companion_app/helper_classes/database_helper.dart';
import 'package:dnd_companion_app/data_models/race_model.dart';
import 'package:flutter/material.dart';

class RaceHelper {
  static final RaceHelper instance = RaceHelper._internal();

  RaceHelper._internal();

  /*
  ================================================================================
    Race Functions:
    - addNew() - Add a new race
    - getAll() - See all races
    - delete() - Remove a race
    - updateInfo() - Change data within a race
    - search() - Filter search all items by name
  ================================================================================
  */

  Future<int> addNew(Race race) async {
    try {
      final db = await DatabaseHelper.instance.database;

      if (race.creatureSize == null) {
        throw ArgumentError('Creature size cant be null!');
      }

      if (race.str < 1 || race.str > 30) {
        throw ArgumentError('Race str value is out of bounds!');
      }

      if (race.dex < 1 || race.dex > 30) {
        throw ArgumentError('Race dex value is out of bounds!');
      }

      if (race.con < 1 || race.con > 30) {
        throw ArgumentError('Race con value is out of bounds!');
      }

      if (race.inte < 1 || race.inte > 30) {
        throw ArgumentError('Race inte value is out of bounds!');
      }

      if (race.wis < 1 || race.wis > 30) {
        throw ArgumentError('Race wis value is out of bounds!');
      }

      if (race.cha < 1 || race.cha > 30) {
        throw ArgumentError('Race cha value is out of bounds!');
      }

      if (race.naturalArmor < 0) {
        throw ArgumentError('Race natural armor cant be negative!');
      }

      if (race.raceName == null) {
        throw ArgumentError('Race name cant be null!');
      }

      // The '?' in VALUES are placeholders, they get replaced when the function is called and the user enters the info
      return await db.rawInsert(
        '''
        INSERT INTO race(creature_size, str, dex, con, inte, wis, cha, natural_armor, race_name)
        VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)
        ''',
        [
          race.creatureSize,
          race.str,
          race.dex,
          race.con,
          race.inte,
          race.wis,
          race.cha,
          race.naturalArmor,
          race.raceName,
        ],
      );
    } catch (e) {
      debugPrint('Error adding new race');
      return 0;
    }
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    final db = await DatabaseHelper.instance.database;
    return await db.rawQuery('''
    SELECT * 
    FROM race
    ''');
  }

  Future<int> delete(int raceID) async {
    final db = await DatabaseHelper.instance.database;
    return await db.rawDelete(
      '''
      DELETE FROM race 
      WHERE race_id = ?
      ''',
      [raceID],
    );
  }

  Future<int> updateInfo(Race race, int raceID) async {
    try {
      final db = await DatabaseHelper.instance.database;

      if (race.creatureSize == null) {
        throw ArgumentError('Creature size cant be null!');
      }

      if (race.str < 1 || race.str > 30) {
        throw ArgumentError('Race str value is out of bounds!');
      }

      if (race.dex < 1 || race.dex > 30) {
        throw ArgumentError('Race dex value is out of bounds!');
      }

      if (race.con < 1 || race.con > 30) {
        throw ArgumentError('Race con value is out of bounds!');
      }

      if (race.inte < 1 || race.inte > 30) {
        throw ArgumentError('Race inte value is out of bounds!');
      }

      if (race.wis < 1 || race.wis > 30) {
        throw ArgumentError('Race wis value is out of bounds!');
      }

      if (race.cha < 1 || race.cha > 30) {
        throw ArgumentError('Race cha value is out of bounds!');
      }

      if (race.naturalArmor < 0) {
        throw ArgumentError('Race natural armor cant be negative!');
      }

      if (race.raceName == null) {
        throw ArgumentError('Race name cant be null!');
      }

      return await db.rawUpdate(
        '''
      UPDATE race
      SET
        creature_size = ?,
        str = ?,
        dex = ?,
        con = ?,
        inte = ?,
        wis = ?,
        cha = ?,
        natural_armor = ?,
        race_name = ?,
      WHERE race_id = ?
      ''',
        [
          race.creatureSize,
          race.str,
          race.dex,
          race.con,
          race.inte,
          race.wis,
          race.cha,
          race.naturalArmor,
          race.raceName,
          raceID,
        ],
      );
    } catch (e) {
      debugPrint('Error updating race');
      return 0;
    }
  }

  // For now this will only search by name.
  Future<List<Map<String, dynamic>>> search(String tag) async {
    try {
      final db = await DatabaseHelper.instance.database;

      if (tag.isEmpty) {
        throw ArgumentError('Tag cant be empty!');
      }

      return await db.rawQuery(
        '''
        SELECT *
        FROM race
        WHERE race_name = ?
      ''',

        [tag],
      );
    } catch (e) {
      debugPrint('Error searching for race');
      return [];
    }
  }
}
