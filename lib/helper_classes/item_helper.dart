import 'package:dnd_companion_app/helper_classes/database_helper.dart';
import 'package:dnd_companion_app/data_models/item_model.dart';
import 'package:flutter/material.dart';

class CharacterHelper {
  static final CharacterHelper instance = CharacterHelper._internal();

  CharacterHelper._internal();

  /*
  ================================================================================
    Item Functions:
    - getAll() - See all items
    - delete() - Remove an item
    - select() - Retrieve all information about one item
    - updateInfo() - Change data within an item
    - search() - Filter search all items by name
  ================================================================================
  */

  Future<List<Map<String, dynamic>>> getAll() async {
    final db = await DatabaseHelper.instance.database;
    return await db.rawQuery('''
    SELECT * 
    FROM item
    ''');
  }

  Future<int> delete(int itemID) async {
    final db = await DatabaseHelper.instance.database;
    return await db.rawDelete(
      '''
      DELETE FROM item 
      WHERE item_id = ?
      ''',
      [itemID],
    );
  }

  Future<int> updateInfo(Item item, int itemID) async {
    try {
      if (item.itemName.isEmpty) {
        throw ArgumentError('Name cant be empty!');
      }

      final db = await DatabaseHelper.instance.database;

      return await db.rawUpdate(
        '''
      UPDATE item
      SET
        item_name = ?
      WHERE item_id = ?
      ''',
        [itemID],
      );
    } catch (e) {
      debugPrint('Error updating item');
      return 0;
    }
  }

  // For now this will only search by name.
  Future<List<Map<String, dynamic>>> search(String tag) async {
    try {
      if (tag.isEmpty) {
        throw ArgumentError('Name cant be empty!');
      }
      final db = await DatabaseHelper.instance.database;

      return await db.rawQuery(
        '''
      SELECT *
      FROM item
      WHERE item_name = ?
    ''',

        [tag],
      );
    } catch (e) {
      debugPrint('Error updating item');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> select(int itemID) async {
    final db = await DatabaseHelper.instance.database;

    return await db.rawQuery(
      '''
      SELECT *
      FROM item
      WHERE item_id = ?
    ''',

      [itemID],
    );
  }
}
