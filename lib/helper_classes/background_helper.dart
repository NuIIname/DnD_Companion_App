import 'package:dnd_companion_app/data_models/background_model.dart';
import 'package:dnd_companion_app/helper_classes/database_helper.dart';
import 'package:flutter/foundation.dart';

class BackgroundHelper {
  static final BackgroundHelper instance = BackgroundHelper._internal();
  BackgroundHelper._internal();

  Future<int> addNew(Background background) async {
    try {
      final db = await DatabaseHelper.instance.database;

      if (background.backgroundName == null ||
          background.startingGold < 0 ||
          background.backgroundFeatureDescription == null ||
          background.backgroundFeatureName == null) {
        throw ArgumentError('Invalid background data');
      }

      return await db.rawInsert(
        '''
      INSERT INTO background(background_name, background_equipment, starting_gold, background_feature_name, background_feature_description)
      VALUES(?, ?, ?, ?, ?)

      ''',
        [
          background.backgroundName,
          background.backgroundEquipment,
          background.startingGold,
          background.backgroundFeatureName,
          background.backgroundFeatureDescription,
        ],
      );
    } catch (e) {
      debugPrint('Error making new background');
      return 0;
    }
  }
}
