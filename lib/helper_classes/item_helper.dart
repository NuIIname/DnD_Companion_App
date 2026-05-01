import 'package:dnd_companion_app/helper_classes/database_helper.dart';
import 'package:dnd_companion_app/data_models/item_model.dart';

class CharacterHelper {
  static final CharacterHelper instance = CharacterHelper._internal();

  CharacterHelper._internal();

  /*
  ================================================================================
    Item Functions:
    - addNew() - Add a new item
    - getAll() - See all items
    - delete() - Remove an item
    - select() - Retrieve all information about one item
    - updateInfo() - Change data within an item
    - search() - Filter search all items by name
  ================================================================================
  */

  Future<int> addNew(Item item) async {
    final db = await DatabaseHelper.instance.database;

    // The '?' in VALUES are placeholders, they get replaced when the function is called and the user enters the info
    return await db.rawInsert(
      '''
    INSERT INTO item(item_id, item_name, subinventory_id, inventory_id, character_id)
    VALUES(?, ?, ?, ?, ?)
    ''',
      [
        item.itemId,
        item.itemName,
        item.subinventoryId,
        item.inventoryId,
        item.characterId,
      ],
    );
  }

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
  }

  // For now this will only search by name.
  Future<List<Map<String, dynamic>>> search(String tag) async {
    final db = await DatabaseHelper.instance.database;

    return await db.rawQuery(
      '''
      SELECT *
      FROM item
      WHERE item_name = ?
    ''',

      [tag],
    );
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
