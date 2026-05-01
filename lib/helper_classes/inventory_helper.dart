import 'dart:async';
import 'package:dnd_companion_app/helper_classes/database_helper.dart';
import 'package:dnd_companion_app/data_models/inventory_model.dart';

class InventoryHelper {
  // ================================================================================
  // Intialize singleton instance
  static final InventoryHelper instance = InventoryHelper._internal();
  InventoryHelper._internal();
  // ================================================================================

  /*
  ================================================================================
    Inventory Functions:
    - addNew() - Add a new inventory
    - getAll() - See all Inventorys
    - delete() - Remove a Inventory
    - updateInfo() - Change data stored in an inventory
    - select() - Retrieve all information about one inventory
  ================================================================================
  */
  Future<int> addNew(Inventory inventory, int characterID) async {
    final db = await DatabaseHelper.instance.database;

    return await db.rawInsert(
      '''
    INSERT INTO inventory(character_id, copper, silver, electrum, gold, platinum)
    VALUES(?, ?, ?, ?, ?, ?)
    ''',
      [
        characterID,
        inventory.copper,
        inventory.silver,
        inventory.electrum,
        inventory.gold,
        inventory.platinum,
      ],
    );
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    final db = await DatabaseHelper.instance.database;
    return await db.rawQuery('''
    SELECT * 
    FROM inventory
    ''');
  }

  Future<int> delete(int inventoryID) async {
    final db = await DatabaseHelper.instance.database;
    return await db.rawDelete(
      '''
      DELETE FROM inventory
      WHERE inventory_id = ?
      ''',
      [inventoryID],
    );
  }

  Future<int> updateInfo(
    Inventory inventory,
    int inventoryID,
    int characterID,
  ) async {
    final db = await DatabaseHelper.instance.database;

    return await db.rawUpdate(
      '''
    UPDATE inventory
    SET
      copper = ?,
      silver = ?,
      electrum = ?,
      gold = ?,
      platinum = ?
    WHERE inventory_id = ? and character_id = ?
    ''',
      [
        inventory.copper,
        inventory.silver,
        inventory.electrum,
        inventory.gold,
        inventory.platinum,
        inventoryID,
        characterID,
      ],
    );
  }

  Future<List<Map<String, dynamic>>> select(
    int inventoryID,
    int characterID,
  ) async {
    final db = await DatabaseHelper.instance.database;

    return await db.rawQuery(
      '''
      SELECT *
      FROM inventory
      WHERE inventory_id = ? and character_id = ?
    ''',

      [inventoryID, characterID],
    );
  }
}
