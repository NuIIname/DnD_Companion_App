import 'package:dnd_companion_app/data_models/personal_info_model.dart';
import 'package:dnd_companion_app/helper_classes/database_helper.dart';

class PersonalInfoHelper {
  static final PersonalInfoHelper instance = PersonalInfoHelper._internal();
  PersonalInfoHelper._internal();

  Future<int> addNew(PersonalInfo personalInfo) async {
    final db = await DatabaseHelper.instance.database;

    return await db.rawInsert(
      '''
      INSERT INTO personal_info(ideals, bonds, flaws, about)
      VALUES(?, ?, ?, ?)

      ''',
      [
        personalInfo.ideals,
        personalInfo.bonds,
        personalInfo.flaws,
        personalInfo.about,
      ],
    );
  }
}
