class PersonalInfo {
  final int? backgroundId;
  final int? personalInfoId;
  final String personalTraits;
  final String ideals;
  final String bonds;
  final String flaws;
  final String about;

  PersonalInfo({
    this.backgroundId,
    this.personalInfoId,
    required this.personalTraits,
    required this.ideals,
    required this.bonds,
    required this.flaws,
    required this.about,
  });

  Map<String, dynamic> toMap() {
    return {
      'personal_traits': personalTraits,
      'ideals': ideals,
      'bonds': bonds,
      'flaws': flaws,
      'about': about,
    };
  }

  factory PersonalInfo.fromMap(Map<String, dynamic> map) {
    return PersonalInfo(
      backgroundId: map['background_id'],
      personalInfoId: map['personal_info_id'],
      personalTraits: map['personal_traits'],
      ideals: map['ideals'],
      bonds: map['bonds'],
      flaws: map['flaws'],
      about: map['about'],
    );
  }
}
