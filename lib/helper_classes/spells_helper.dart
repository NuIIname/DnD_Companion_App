import 'dart:async';
import 'package:dnd_companion_app/helper_classes/database_helper.dart';
import 'package:dnd_companion_app/data_models/spells_model.dart';

class SpellsHelper {
  // ================================================================================
  // Intialize singleton instance
  static final SpellsHelper instance = SpellsHelper._internal();
  SpellsHelper._internal();
  // ================================================================================

  /*
  ================================================================================
    Spells Functions:
    - addNew() - Add a new spell
    - getAll() - See all spells
    - delete() - Remove a spell
    - updateInfo() - Change a the data stored in a spell's tuple
    - select() - Retrieve all information about one spell
    - search() - Filter search all spells by name
  ================================================================================
  */
  Future<int> addNew(Spells spell) async {
    final db = await DatabaseHelper.instance.database;

    // The '?' in VALUES are placeholders, they get replaced when the function is called and the user enters the info
    return await db.rawInsert(
      '''
    INSERT INTO spells(ritual, spell_name, spell_desc, spell_level, spell_school, cast_time, range_, components, duration)
    VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''',
      [
        spell.ritual,
        spell.spellName,
        spell.spellDesc,
        spell.spellLevel,
        spell.spellSchool,
        spell.castTime,
        spell.range_,
        spell.components,
        spell.duration,
      ],
    );
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    final db = await DatabaseHelper.instance.database;
    return await db.rawQuery('''
    SELECT * 
    FROM spells
    ''');
  }

  Future<int> delete(int spellID) async {
    final db = await DatabaseHelper.instance.database;
    return await db.rawDelete(
      '''
      DELETE FROM spells 
      WHERE spell_id = ?
      ''',
      [spellID],
    );
  }

  Future<int> updateInfo(Spells spell, int spellID) async {
    final db = await DatabaseHelper.instance.database;

    return await db.rawUpdate(
      '''
    UPDATE spells
    SET
      ritual = ?, 
      spell_name = ?, 
      spell_desc = ?, 
      spell_level = ?, 
      spell_school = ?, 
      cast_time = ?, 
      range_ = ?, 
      components = ?, 
      duration = ?
    WHERE spell_id = ?
    ''',
      [
        spell.ritual,
        spell.spellName,
        spell.spellDesc,
        spell.spellLevel,
        spell.spellSchool,
        spell.castTime,
        spell.range_,
        spell.components,
        spell.duration,
        spellID,
      ],
    );
  }

  Future<List<Map<String, dynamic>>> select(int spellID) async {
    final db = await DatabaseHelper.instance.database;

    return await db.rawQuery(
      '''
      SELECT *
      FROM spells
      WHERE spell_id = ?
    ''',

      [spellID],
    );
  }

  Future<List<Map<String, dynamic>>> search(String name) async {
    final db = await DatabaseHelper.instance.database;

    return await db.rawQuery(
      '''

      SELECT *
      FROM spells
      WHERE spell_name = ?



    ''',

      [name],
    );
  }
}
