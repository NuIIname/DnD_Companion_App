class Item {
  final int? itemId;
  final String itemName;
  final int? subinventoryId;
  final int? inventoryId;
  final int? characterId;

  Item({
    this.itemId,
    required this.itemName,
    this.subinventoryId,
    this.inventoryId,
    this.characterId,
  });

  Map<String, dynamic> toMap() {
    return {'item_name': itemName};
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      itemId: map['item_id'],
      itemName: map['item_name'],
      subinventoryId: map['subinventory_id'],
      inventoryId: map['inventory_id'],
      characterId: map['character_id'],
    );
  }
}
