class Spells {
  final int? spellId;
  final String ritual;
  final String? spellName;
  final String? spellDesc;
  final int? spellLevel;
  final String? spellSchool;
  final String? castTime;
  final int? range_;
  final String components;
  final String duration;

  Spells({
    this.spellId,
    required this.ritual,
    required this.spellName,
    required this.spellDesc,
    required this.spellLevel,
    required this.spellSchool,
    required this.castTime,
    required this.range_,
    required this.components,
    required this.duration,
  });

  Map<String, dynamic> toMap() {
    return {
      'ritual': ritual,
      'spell_name': spellName,
      'spell_desc': spellDesc,
      'spell_level': spellLevel,
      'spell_school': spellSchool,
      'cast_time': castTime,
      'range_': range_,
      'components': components,
      'duration': duration,
    };
  }

  factory Spells.fromMap(Map<String, dynamic> map) {
    return Spells(
      spellId: map['spell_id'],
      ritual: map['ritual'],
      spellName: map['spell_name'],
      spellDesc: map['spell_desc'],
      spellLevel: map['spell_level'],
      spellSchool: map['spell_school'],
      castTime: map['cast_time'],
      range_: map['range_'],
      components: map['components'],
      duration: map['duration'],
    );
  }
}
