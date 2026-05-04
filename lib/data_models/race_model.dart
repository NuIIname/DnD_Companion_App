class Race {
  final int? raceId;
  final String? creatureSize;
  final int str;
  final int dex;
  final int con;
  final int inte;
  final int wis;
  final int cha;
  final int naturalArmor;
  final String? raceName;

  Race({
    this.raceId,
    required this.creatureSize,
    required this.str,
    required this.dex,
    required this.con,
    required this.inte,
    required this.wis,
    required this.cha,
    required this.naturalArmor,
    required this.raceName,
  });

  Map<String, dynamic> toMap() {
    return {
      'creature_size': creatureSize,
      'str': str,
      'dex': dex,
      'con': con,
      'inte': inte,
      'wis': wis,
      'cha': cha,
      'natural_armor': naturalArmor,
      'race_name': raceName,
    };
  }

  factory Race.fromMap(Map<String, dynamic> map) {
    return Race(
      raceId: map['race_id'],
      creatureSize: map['creature_size'],
      str: map['str'],
      dex: map['dex'],
      con: map['con'],
      inte: map['inte'],
      wis: map['wis'],
      cha: map['cha'],
      naturalArmor: map['natural_armor'],
      raceName: map['race_name'],
    );
  }
}
