class CharacterDraft {
  String name;
  String characterClass;
  String subclass;
  String level;

  String race;
  String background;
  String alignment;

  String strength;
  String dexterity;
  String constitution;
  String intelligence;
  String wisdom;
  String charisma;

  bool intelligencePoints;
  bool encumbrance;
  bool homebrewRules;

  CharacterDraft({
    this.name = "",
    this.characterClass = "",
    this.subclass = "",
    this.level = "",
    this.race = "",
    this.background = "",
    this.alignment = "True Neutral",
    this.strength = "",
    this.dexterity = "",
    this.constitution = "",
    this.intelligence = "",
    this.wisdom = "",
    this.charisma = "",
    this.intelligencePoints = false,
    this.encumbrance = false,
    this.homebrewRules = false,
  });
}
