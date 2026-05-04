class Character {
  final int? characterId;
  final String? characterName;
  final int? raceId;
  final int? backgroundId;
  final int? inspirationId;
  final String conditions;
  final int xp;
  final int resurrectionDC;
  final String alignment;
  final int deathSaves;

  Character({
    this.characterId,
    required this.characterName,
    this.raceId,
    this.backgroundId,
    this.inspirationId,
    required this.conditions,
    required this.xp,
    required this.resurrectionDC,
    required this.alignment,
    required this.deathSaves,
  });

  Map<String, dynamic> toMap() {
    return {
      'character_name': characterName,
      'conditions': conditions,
      'xp': xp,
      'resurrection_dc': resurrectionDC,
      'alignment': alignment,
      'death_saves': deathSaves,
    };
  }

  factory Character.fromMap(Map<String, dynamic> map) {
    return Character(
      characterId: map['character_id'],
      characterName: map['character_name'],
      raceId: map['race_id'],
      backgroundId: map['background_id'],
      inspirationId: map['inspiration_id'],
      conditions: map['conditions'],
      xp: map['xp'],
      resurrectionDC: map['resurrection_dc'],
      alignment: map['alignment'],
      deathSaves: map['death_saves'],
    );
  }
}
