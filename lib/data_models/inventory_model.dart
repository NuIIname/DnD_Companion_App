class Inventory {
  final int? inventoryId;
  final int? characterId;
  final int copper;
  final int silver;
  final int electrum;
  final int gold;
  final int platinum;

  Inventory({
    this.inventoryId,
    this.characterId,
    required this.copper,
    required this.silver,
    required this.electrum,
    required this.gold,
    required this.platinum,
  });

  Map<String, dynamic> toMap() {
    return {
      'copper': copper,
      'silver': silver,
      'electrum': electrum,
      'gold': gold,
      'platinum': platinum,
    };
  }

  factory Inventory.fromMap(Map<String, dynamic> map) {
    return Inventory(
      inventoryId: map['creature_id'],
      characterId: map['creature_name'],
      copper: map['creature_armor_class'],
      silver: map['str'],
      electrum: map[' dex'],
      gold: map['con'],
      platinum: map['inte'],
    );
  }
}
