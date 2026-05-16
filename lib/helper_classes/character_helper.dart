import 'dart:async';
import 'package:dnd_companion_app/helper_classes/database_helper.dart';
import 'package:dnd_companion_app/data_models/character_model.dart';
import 'package:flutter/foundation.dart';

class CharacterHelper {
  // ================================================================================
  // Intialize singleton instance
  static final CharacterHelper instance = CharacterHelper._internal();
  CharacterHelper._internal();
  // ================================================================================

  /*
  ================================================================================
    Character Functions:
    - addNew() - Add a new character
    - getAll() - See all characters
    - delete() - Remove a character
    - updateInfo() - Change data stored in a character's tuple
    - absLookup() - See all the ABS stats for a specifc character
    - select() - Retrieve all information about one character
    - search() - Filter search all characters by name
    - armorClassTotal() - Calculates the base_ac of a character

    syntax example: CharacterHelper.instance.addNew(character_object)

  ================================================================================
  */
  Future<int> addNew(Character character) async {
    try {
      final db = await DatabaseHelper.instance.database;

      if (character.characterName == null) {
        throw ArgumentError('Character name cant be null!');
      }

      if (character.xp < 0) {
        throw ArgumentError('Character xp cant be negative!');
      }

      if (character.resurrectionDC < 10) {
        throw ArgumentError('Character resurrectionDC cant be less than 10!');
      }

      if (character.deathSaves < 0 || character.deathSaves > 3) {
        throw ArgumentError(
          'Character death saves value is out of bounds! Must be anywhere from 0 to 3.',
        );
      }

      return await db.rawInsert(
        '''
        INSERT INTO characters(character_name, conditions, xp, resurrection_dc, alignment, death_saves)
        VALUES(?, ?, ?, ?, ?, ?)
        ''',
        [
          character.characterName,
          character.conditions,
          character.xp,
          character.resurrectionDC,
          character.alignment,
          character.deathSaves,
        ],
      );
    } catch (e) {
      debugPrint('Error adding character $e');
      return 0;
    }
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    final db = await DatabaseHelper.instance.database;

    return await db.rawQuery('''
    SELECT 
      characters.character_id,
      characters.character_name,
      characters.xp,
      characters.alignment,
      has_class.level,
      class.class_name,
      race.race_name
    FROM characters
    LEFT JOIN has_class 
      ON characters.character_id = has_class.character_id
    LEFT JOIN class 
      ON has_class.class_id = class.class_id
    LEFT JOIN race
      ON characters.race_id = race.race_id
    ORDER BY characters.character_id DESC
  ''');
  }

  Future<int> delete(int characterID) async {
    final db = await DatabaseHelper.instance.database;

    return await db.rawDelete(
      '''
    DELETE FROM characters
    WHERE character_id = ?
    ''',
      [characterID],
    );
  }

  Future<int> updateInfo(Character character, int characterID) async {
    try {
      final db = await DatabaseHelper.instance.database;

      if (character.characterName == null ||
          character.xp < 0 ||
          character.resurrectionDC < 10 ||
          character.deathSaves < 0 ||
          character.deathSaves > 3) {
        throw ArgumentError('Error Invalid information');
      }

      return await db.rawUpdate(
        '''
      UPDATE characters
      SET
        character_name = ?,
        conditions = ?, 
        xp = ?, 
        resurrection_dc = ?, 
        alignment = ?, 
        death_saves = ?
      WHERE character_id = ?
      ''',
        [
          character.characterName,
          character.conditions,
          character.xp,
          character.resurrectionDC,
          character.alignment,
          character.deathSaves,
          characterID,
        ],
      );
    } catch (e) {
      debugPrint('Error adding character $e');
      return 0;
    }
  }

  Future<List<Map<String, dynamic>>> absLookup(int characterID) async {
    final db = await DatabaseHelper.instance.database;

    return await db.rawQuery(
      '''
    SELECT characters.character_name, race.str, race.dex, race.con, race.inte, race.wis, race.cha
    FROM characters INNER JOIN race ON characters.rID = race.race_id
    WHERE characters.character_name = ?
  ''',
      [characterID],
    );
  }

  Future<List<Map<String, dynamic>>> select(String characterName) async {
    final db = await DatabaseHelper.instance.database;

    return await db.rawQuery(
      '''
      SELECT *
      FROM ((characters INNER JOIN race ON characters.race_id = race.race_id) INNER JOIN has_class ON has_class.character_id = character.character_id) INNER JOIN class ON class.class_id = has_class.class_id) INNER JOIN personal_info ON personal_info.background_id = background.background_id)
      WHERE characterName = ?
    ''',
      [characterName],
    );
  }

  Future<List<Map<String, dynamic>>> search(String name) async {
    try {
      final db = await DatabaseHelper.instance.database;

      if (name.isEmpty) {
        throw ArgumentError('Name cant be empty!');
      }

      return await db.rawQuery(
        '''
        SELECT *
        FROM characters
        WHERE character_name = ?
      ''',
        [name],
      );
    } catch (e) {
      debugPrint('Error searching for character');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> armorClassTotal(int characterID) async {
    final db = await DatabaseHelper.instance.database;

    return await db.rawQuery(
      '''
      SELECT CASE
                WHEN armor.armor_type = 'none' OR 'armor.armor_type = NULL THEN 10 + race.dex
                WHEN armor.armor_type = 'light' THEN race.dex + 11
                WHEN armor.armor_type = 'medium' THEN CASE
                                                        WHEN race.dex >= 2 THEN 2 + 12
                                                        WHEN race.dex <= 1 THEN race.dex + 12
                                                      END
                WHEN armor.armor_type = 'heavy' THEN 14
              END as base_ac
      FROM characters INNER JOIN inventory ON characters.character_id = inventory.character_id INNER JOIN item ON (characters.character_id = item.character_id AND item.inventory_id = inventory.inventory_id) INNER JOIN armor ON armor.item_id = item.item_id INNER JOIN race ON race.race_id = characters.rID
      WHERE characters.character_id = ?
    ''',
      [characterID],
    );
  }

  /*
  ================================================================================
    Setter Functions:
    - setCharacterBackground() - Attach a background and personal info to a character
    - setCharacterClass() - Attach a preloaded class to the character
    - setCharacterRace() - Attach a preloaded race to the character
  ================================================================================
  */

  Future<int> setCharacterBackground(
    int characterID,
    int backgroundID,
    int personalInfoID,
  ) async {
    final db = await DatabaseHelper.instance.database;

    await db.rawUpdate(
      '''
    UPDATE personal_info
    SET background_id = ?
    WHERE personal_info.personal_info_id = ?
    ''',
      [backgroundID, personalInfoID],
    );

    return await db.rawUpdate(
      '''
    UPDATE characters
    SET background_id = ?
    WHERE character_id = ?
    ''',
      [backgroundID, characterID],
    );
  }

  Future<int> setCharacterClass(
    int characterID,
    String className,
    int level,
  ) async {
    try {
      final db = await DatabaseHelper.instance.database;

      if (level < 1 || level > 20) {
        throw ArgumentError('Level must be between 1 and 20.');
      }

      final selectedClass = await db.rawQuery(
        '''
        SELECT class_id
        FROM class
        WHERE class_name = ?
        ''',
        [className],
      );

      if (selectedClass.isEmpty) {
        throw ArgumentError('Class name does not exist: $className');
      }

      final int selectedClassId = selectedClass.first['class_id'] as int;

      return await db.rawInsert(
        '''
        INSERT INTO has_class(character_id, class_id, level)
        VALUES (?, ?, ?)
        ''',
        [characterID, selectedClassId, level],
      );
    } catch (e) {
      debugPrint('Error setting character class: $e');
      return 0;
    }
  }

  Future<int> setCharacterRace(int characterID, String raceName) async {
    try {
      final db = await DatabaseHelper.instance.database;

      final selectedRace = await db.rawQuery(
        '''
      SELECT race_id
      FROM race
      WHERE race_name = ?
      ''',
        [raceName],
      );

      if (selectedRace.isEmpty) {
        throw ArgumentError('Race name does not exist: $raceName');
      }

      final int selectedRaceId = selectedRace.first['race_id'] as int;

      return await db.rawUpdate(
        '''
      UPDATE characters
      SET race_id = ?
      WHERE character_id = ?
      ''',
        [selectedRaceId, characterID],
      );
    } catch (e) {
      debugPrint('Error setting character race: $e');
      return 0;
    }
  }

  /*
  ================================================================================
    Getter Functions:
    - getCharacterBackground() - Retrieve a character's background and personal information
    - getCharacterClass() - Retrieve a character's class information
    - getCharacterRace() - Retrieve a characater's race information
    - getCharacterInventory() - Retrieve a character's inventory
  ================================================================================
  */

  Future<List<Map<String, dynamic>>> getCharacterBackground(
    int characterID,
  ) async {
    final db = await DatabaseHelper.instance.database;

    return await db.rawQuery(
      '''
    SELECT background.*, personal_info.*
    FROM ((background INNER JOIN characters ON background.background_id = characters.character_id) INNER JOIN personal_info ON personal_info.background_id = background.background_id)
    WHERE characters.character_id = ?
    ''',
      [characterID],
    );
  }

  Future<List<Map<String, dynamic>>> getCharacterClass(int characterID) async {
    final db = await DatabaseHelper.instance.database;

    return await db.rawQuery(
      '''
      SELECT class.*
      FROM ((characters INNER JOIN has_class ON characters.character_id = has_class.character_id) INNER JOIN class ON class.class_id = has_class.class_id)
      WHERE characters.character_id = ?
      ''',
      [characterID],
    );
  }

  Future<List<Map<String, dynamic>>> getCharacterRace(
    int characterID,
    int inventoryID,
  ) async {
    final db = await DatabaseHelper.instance.database;

    return await db.rawQuery(
      '''
      SELECT race.*
      FROM (characters INNER JOIN race ON characters.race_id = race.race_id)
      WHERE characters.character_id = ?
      ''',
      [characterID],
    );
  }

  Future<List<Map<String, dynamic>>> getCharacterInventory(
    int characterID,
  ) async {
    final db = await DatabaseHelper.instance.database;

    return await db.rawQuery(
      '''
    SELECT inventory.copper, inventory.silver, inventory.electrum, inventory.gold, inventory.platinum, item.item_name
    FROM (characters INNER JOIN inventory ON inventory.character_id = characters.character_id) INNER JOIN item ON item.inventory_id = inventory.inventory_id
    WHERE characters.character_id = ?
    ''',
      [characterID],
    );
  }

  /*
  ================================================================================
    Character aggregation functions
  
    - characterHealthTotal() - Calculates the total hp of a player
    - minCharacterXP() - Calculates the character with the least amount of XP
    - totalCoinCount() - Calculates the total number of coins in a character's inventory
    - averageSpellCastTime() - Calculates the average spell cast time
  ================================================================================
  */

  Future<List<Map<String, dynamic>>> characterHealthTotal(
    int characterID,
  ) async {
    final db = await DatabaseHelper.instance.database;

    return await db.rawQuery(
      '''
      SELECT MAX(6, race.con)
      FROM characters INNER JOIN race ON characters.race_id = race.race_id
      WHERE characters.character_id = ?
      ''',
      [characterID],
    );
  }

  Future<List<Map<String, dynamic>>> minCharacterXP() async {
    final db = await DatabaseHelper.instance.database;

    return await db.rawQuery('''
      SELECT character_name, MIN(xp)
      FROM characters
    ''');
  }

  Future<List<Map<String, dynamic>>> totalGoldCount() async {
    final db = await DatabaseHelper.instance.database;

    return await db.rawQuery('''
    SELECT SUM(inventory.gold)
    FROM characters INNER JOIN inventory ON characters.character_id = inventory.character_id
    ''');
  }

  Future<List<Map<String, dynamic>>> averageSpellCastTime() async {
    final db = await DatabaseHelper.instance.database;

    return await db.rawQuery('''
    SELECT AVG(spells.cast_time)
    FROM spells
    ''');
  }
}
