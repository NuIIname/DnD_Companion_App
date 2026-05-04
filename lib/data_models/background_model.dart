class Background {
  final int? backgroundId;
  final String? backgroundName;
  final String backgroundEquipment;
  final int startingGold;
  final String? backgroundFeatureName;
  final String? backgroundFeatureDescription;

  Background({
    this.backgroundId,
    required this.backgroundName,
    required this.backgroundEquipment,
    required this.startingGold,
    required this.backgroundFeatureName,
    required this.backgroundFeatureDescription,
  });

  Map<String, dynamic> toMap() {
    return {
      'background_name': backgroundName,
      'background_equipment': backgroundEquipment,
      'startingGold': startingGold,
      'background_feature_name': backgroundFeatureName,
      'background_feature_description': backgroundFeatureDescription,
    };
  }

  factory Background.fromMap(Map<String, dynamic> map) {
    return Background(
      backgroundId: map['background_id'],
      backgroundName: map['background_name'],
      backgroundEquipment: map['background_equipment'],
      startingGold: map['startingGold'],
      backgroundFeatureName: map['background_feature_name'],
      backgroundFeatureDescription: map['background_feature_description'],
    );
  }
}
