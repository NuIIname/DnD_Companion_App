import 'dart:async';
import 'package:dnd_companion_app/helper_classes/database_helper.dart';
import 'package:flutter/material.dart';

class CreatureHelper {
  // ================================================================================
  // Intialize singleton instance
  static final CreatureHelper instance = CreatureHelper._internal();
  CreatureHelper._internal();
  // ================================================================================

  /*
  ================================================================================
    Creature Functions:
    - getAll() - See all creatures
    - select() - Retrieve all information about one creature
    - search() - Filter search all creatures by name
  ================================================================================
  */

  Future<List<Map<String, dynamic>>> getAll() async {
    final db = await DatabaseHelper.instance.database;
    return await db.rawQuery('''
    SELECT * 
    FROM creature
    ''');
  }

  Future<List<Map<String, dynamic>>> select(int creatureID) async {
    final db = await DatabaseHelper.instance.database;

    return await db.rawQuery(
      '''
      SELECT *
      FROM creature
      WHERE creature_id = ?
    ''',

      [creatureID],
    );
  }

  Future<List<Map<String, dynamic>>> search(String name) async {
    try {
      final db = await DatabaseHelper.instance.database;

      if (name != 'Grimlock' ||
          name != 'Cloaker' ||
          name != 'Wolf' ||
          name != 'Deva' ||
          name != 'Adult Blue Dragon' ||
          name != 'Vulture' ||
          name != 'Stone Golem') {
        throw ArgumentError('Creature name does not exist!');
      }

      return await db.rawQuery(
        '''

        SELECT *
        FROM creature
        WHERE creature_name = ?
      ''',

        [name],
      );
    } catch (e) {
      debugPrint('Error searching for creature');
      return [];
    }
  }
}
