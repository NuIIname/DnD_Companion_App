class Creature {
  final int? creatureId;
  final String creatureName;
  final int creatureArmorClass;
  final int str;
  final int dex;
  final int con;
  final int inte;
  final int wis;
  final int cha;
  final int cr;
  final String damageResistance;
  final String creatureConditions;
  final int creatureHitDie;
  final int creatureStaticHp;
  final String creatureSize;
  final String alignment;

  Creature({
    this.creatureId,
    required this.creatureName,
    required this.creatureArmorClass,
    required this.str,
    required this.dex,
    required this.con,
    required this.inte,
    required this.wis,
    required this.cha,
    required this.cr,
    required this.damageResistance,
    required this.creatureConditions,
    required this.creatureHitDie,
    required this.creatureStaticHp,
    required this.creatureSize,
    required this.alignment,
  });

  Map<String, dynamic> toMap() {
    return {
      'creature_name': creatureName,
      'creature_armor_class': creatureArmorClass,
      'str': str,
      'dex': dex,
      'con': con,
      'inte': inte,
      'wis': wis,
      'cha': cha,
      'cr': cr,
      'damage_resistance': damageResistance,
      'creature_conditions': creatureConditions,
      'creature_hit_die': creatureHitDie,
      'creature_static_hp': creatureStaticHp,
      'creature_size': creatureSize,
      'alignment': alignment,
    };
  }

  factory Creature.fromMap(Map<String, dynamic> map) {
    return Creature(
      creatureId: map['creature_id'],
      creatureName: map['creature_name'],
      creatureArmorClass: map['creature_armor_class'],
      str: map['str'],
      dex: map[' dex'],
      con: map['con'],
      inte: map['inte'],
      wis: map['wis'],
      cha: map['cha'],
      cr: map['cr'],
      damageResistance: map['damage_resistance'],
      creatureConditions: map['creature_conditions'],
      creatureHitDie: map['creature_hit_die'],
      creatureStaticHp: map['creature_static_hp'],
      creatureSize: map['creature_size'],
      alignment: map['alignment'],
    );
  }
}
