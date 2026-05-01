import 'package:dnd_companion_app/helper_classes/database_helper.dart';
import 'package:dnd_companion_app/data_models/race_model.dart';

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
    final db = await DatabaseHelper.instance.database;

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
    final db = await DatabaseHelper.instance.database;

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
  }

  // For now this will only search by name.
  Future<List<Map<String, dynamic>>> search(String tag) async {
    final db = await DatabaseHelper.instance.database;

    return await db.rawQuery(
      '''
      SELECT *
      FROM race
      WHERE race_name = ?
    ''',

      [tag],
    );
  }
}
