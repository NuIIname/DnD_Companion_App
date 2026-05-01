class Class {
  final int? classId;
  final String className;
  final String classEquip;
  final int baseAc;
  final int dexAc;
  final int unarmoredDefense;

  Class({
    this.classId,
    required this.className,
    required this.classEquip,
    required this.baseAc,
    required this.dexAc,
    required this.unarmoredDefense,
  });

  Map<String, dynamic> toMap() {
    return {
      'class_name': className,
      'class_equip': classEquip,
      'base_ac': baseAc,
      'dex_ac': dexAc,
      'unarmored_defense': unarmoredDefense,
    };
  }

  factory Class.fromMap(Map<String, dynamic> map) {
    return Class(
      classId: map['class_id'],
      className: map['class_name'],
      classEquip: map['class_equip'],
      baseAc: map['base_ac'],
      dexAc: map['dex_ac'],
      unarmoredDefense: map['unarmored_defense'],
    );
  }
}
