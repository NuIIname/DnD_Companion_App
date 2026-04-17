import 'package:sqflite/sqflite.dart';
import 'package:flutter/foundation.dart';

Future<void> createCharacterTables(Database db, int version) async {
  // each tables gets an await db.execute function

  // Character table
  await db.execute('''CREATE TABLE characters(
  character_id INTEGER PRIMARY KEY,
  rID INTEGER,
  conditions TEXT,
  xp INTEGER CHECK(xp >= 0),
  resurrection_dc INTEGER CHECK(resurrection_dc >= 10),
  alignment TEXT,
  death_saves INTEGER CHECK(death_saves >= 0 AND death_saves <= 3),
  FOREIGN KEY (rID) REFERENCES race(race_id) 
  )''');

  // Character feats table
  await db.execute('''CREATE TABLE character_feats(
  character_id INTEGER,
  feat_id INTEGER,
  repeatable BOOL,
  feat_name TEXT NOT NULL,
  feat_description TEXT,
  feat_race_req TEXT,
  feat_class_req TEXT,
  feat_lvl_req INTEGER CHECK(feat_lvl_req >= 1 AND feat_lvl_req <= 20),
  PRIMARY KEY (character_id, feat_id),
  FOREIGN KEY (character_id) REFERENCES characters(character_id)
  )''');

  // Background table
  await db.execute('''CREATE TABLE background(
  background_id INTEGER PRIMARY KEY,
  background_name TEXT NOT NULL,
  background_equipment TEXT,
  starting_gold INTEGER CHECK(starting_gold >= 0),
  background_feature_name TEXT NOT NULL,
  background_feature_description TEXT NOT NULL
  )''');

  // Background weapon proficiencies table
  await db.execute('''CREATE TABLE background_weapon_proficiencies(
  background_id INTEGER,
  background_weapon_prof TEXT,
  PRIMARY KEY (background_id, background_weapon_prof),
  FOREIGN KEY (background_id) REFERENCES background(background_id)
  )''');

  // Background armor proficiencies table
  await db.execute('''CREATE TABLE background_armor_proficiencies(
  background_id INTEGER,
  background_armor_prof TEXT,
  PRIMARY KEY (background_id, background_armor_prof),
  FOREIGN KEY (background_id) REFERENCES background(background_id)
  )''');

  // Background lang proficiencies table
  await db.execute('''CREATE TABLE background_lang_proficiencies(
  background_id INTEGER,
  background_lang_prof TEXT,
  PRIMARY KEY (background_id, background_lang_prof),
  FOREIGN KEY (background_id) REFERENCES background(background_id)
  )''');

  // Background skill proficiencies table
  await db.execute('''CREATE TABLE background_skill_proficiencies(
  background_id INTEGER,
  background_skill_prof TEXT,
  PRIMARY KEY (background_id, background_skill_prof),
  FOREIGN KEY (background_id) REFERENCES background(background_id)
  )''');

  // Background tool proficiencies table
  await db.execute('''CREATE TABLE background_tool_proficiencies(
  background_id INTEGER,
  background_tool_prof TEXT,
  PRIMARY KEY (background_id, background_tool_prof),
  FOREIGN KEY (background_id) REFERENCES background(background_id)
  )''');

  // Background saving throw proficiencies table
  await db.execute('''CREATE TABLE background_saving_throw_proficiencies(
  background_id INTEGER,
  background_saving_throw_prof TEXT,
  PRIMARY KEY (background_id, background_saving_throw_prof),
  FOREIGN KEY (background_id) REFERENCES background(background_id)
  )''');

  // Personal info table
  await db.execute('''CREATE TABLE personal_info(
  background_id INTEGER,
  personal_info_id INTEGER PRIMARY KEY,
  personal_traits TEXT,
  ideals TEXT,
  bonds TEXT,
  flaws TEXT,
  about TEXT,
  FOREIGN KEY (background_id) REFERENCES background(background_id)
  )''');

  // Inspiration table
  await db.execute('''CREATE TABLE inspiration(
  inspirationID INTEGER PRIMARY KEY
  )''');

  // Card system table
  await db.execute('''CREATE TABLE card_system(
  inspirationID INTEGER PRIMARY KEY,
  green INTEGER CHECK(green >= 2 AND green <= 10),
  red INTEGER CHECK(red >= 2 AND red <= 10),
  blue INTEGER CHECK(blue >= 2 AND blue <= 10),
  FOREIGN KEY (inspirationID) REFERENCES inspiration(inspirationID)
  )''');

  // Dice system table
  await db.execute('''CREATE TABLE dice_system(
  inspirationID INTEGER PRIMARY KEY,
  dice_type TEXT,
  FOREIGN KEY (inspirationID) REFERENCES inspiration(inspirationID)
  )''');

  // Advantage system table
  await db.execute('''CREATE TABLE advantage_system(
  inspirationID INTEGER PRIMARY KEY,
  FOREIGN KEY (inspirationID) REFERENCES inspiration(inspirationID)
  )''');

  // Race table
  await db.execute('''CREATE TABLE race(
  race_id INTEGER PRIMARY KEY,
  creature_size TEXT NOT NULL,
  str INTEGER CHECK(str >= 1 AND str <= 30),
  dex INTEGER CHECK(dex >= 1 AND dex <= 30),
  con INTEGER CHECK(con >= 1 AND con <= 30),
  int INTEGER CHECK(int >= 1 AND int <= 30),
  wis INTEGER CHECK(wis >= 1 AND wis <= 30),
  cha INTEGER CHECK(cha >= 1 AND cha <= 30),
  natural_armor INTEGER CHECK(natural_armor >= 0),
  race_name TEXT NOT NULL
  )''');

  // Race character movement table
  await db.execute('''CREATE TABLE race_character_movement(
  race_id INTEGER PRIMARY KEY,
  walking INTEGER CHECK(walking >= 0),
  swim INTEGER CHECK(swim >= 0),
  climb INTEGER CHECK(climb >= 0),
  fly INTEGER CHECK(fly >= 0),
  burrow INTEGER CHECK(burrow >= 0),
  FOREIGN KEY (race_id) REFERENCES race(race_id)
  )''');

  // Race weapon table
  await db.execute('''CREATE TABLE race_weapon(
  race_id INTEGER,
  race_weapon_id INTEGER,
  damage_dice TEXT,
  modifier INTEGER NOT NULL,
  damage_type TEXT NOT NULL,
  PRIMARY KEY (race_id, race_weapon_id)
  FOREIGN KEY (race_id) REFERENCES race(race_id)
  )''');

  // Race trait table
  await db.execute('''CREATE TABLE race_trait(
  race_id INTEGER,
  trait_id INTEGER,
  trait_name TEXT NOT NULL,
  trait_description TEXT,
  PRIMARY KEY (race_id, trait_id )
  FOREIGN KEY (race_id) REFERENCES race(race_id)
  )''');

  // Race weapon proficiencies table
  await db.execute('''CREATE TABLE race_weapon_proficiencies(
  race_id INTEGER,
  race_weapon_prof INTEGER,
  PRIMARY KEY (race_id, race_weapon_prof)
  FOREIGN KEY (race_id) REFERENCES race(race_id)
  )''');

  // Race armor proficiencies table
  await db.execute('''CREATE TABLE race_armor_proficiencies(
  race_id INTEGER,
  race_armor_prof INTEGER,
  PRIMARY KEY (race_id, race_armor_prof)
  FOREIGN KEY (race_id) REFERENCES race(race_id)
  )''');

  // Race lang proficiencies table
  await db.execute('''CREATE TABLE race_lang_proficiencies(
  race_id INTEGER,
  race_lang_prof INTEGER,
  PRIMARY KEY (race_id, race_lang_prof)
  FOREIGN KEY (race_id) REFERENCES race(race_id)
  )''');

  // Race skill proficiencies table
  await db.execute('''CREATE TABLE race_skill_proficiencies(
  race_id INTEGER,
  race_skill_prof INTEGER,
  race_skill_expertise BOOL,
  PRIMARY KEY (race_id, race_skill_prof)
  FOREIGN KEY (race_id) REFERENCES race(race_id)
  )''');

  // Race tool proficiencies table
  await db.execute('''CREATE TABLE race_tool_proficiencies(
  race_id INTEGER,
  race_tool_prof INTEGER,
  race_tool_expertise BOOL,
  PRIMARY KEY (race_id, race_tool_prof)
  FOREIGN KEY (race_id) REFERENCES race(race_id)
  )''');

  // Race saving throw proficiencies table
  await db.execute('''CREATE TABLE race_saving_throw_proficiencies(
  race_id INTEGER,
  race_saving_throw_prof TEXT,
  PRIMARY KEY (race_id, race_saving_throw_prof)
  FOREIGN KEY (race_id) REFERENCES race(race_id)
  )''');

  // Subrace table
  await db.execute('''CREATE TABLE subrace(
  race_id INTEGER,
  subrace_id INTEGER,
  subrace_name TEXT NOT NULL,
  PRIMARY KEY (race_id, subrace_id)
  FOREIGN KEY (race_id) REFERENCES race(race_id)
  )''');

  // Has class table
  await db.execute('''CREATE TABLE has_class(
  character_id INTEGER,
  class_id INTEGER,
  level INTEGER CHECK(level >= 1 AND level <= 20),
  PRIMARY KEY (character_id, class_id)
  FOREIGN KEY (character_id, class_id) REFERENCES race(character, class)
  )''');

  // Class table
  await db.execute('''CREATE TABLE class(
  class_id INTEGER PRIMARY KEY,
  class_name TEXT NOT NULL,
  class_equip TEXT,
  base_ac INTEGER CHECK(base_ac >= 0),
  dex_ac INTEGER CHECK (dex_ac >= -5 AND dex_ac <= 10),
  unarmored_defense INTEGER
  )''');

  // Optional features table
  await db.execute('''CREATE TABLE optional_features(
  class_id INTEGER,
  optional_feature_name TEXT,
  optional_feature_description TEXT,
  PRIMARY KEY (class_id, optional_feature_name)
  FOREIGN KEY (class_id) REFERENCES race(class)

  )''');

  // Gain class table
  await db.execute('''CREATE TABLE gain_class(
  class_id INTEGER,
  class_feature_id INTEGER,
  PRIMARY KEY (class_id, class_feature_id)
  FOREIGN KEY (class_id, class_feature_id) REFERENCES race(class, class_feature)

  )''');

  // Class feature table
  await db.execute('''CREATE TABLE class_feature(
  class_featrue_id INTEGER PRIMARY KEY,
  class_feature_name TEXT,
  class_feature_description TEXT
  )''');

  // Class weapon proficiencies table
  await db.execute('''CREATE TABLE class_weapon_proficiencies(
  class_id INTEGER,
  class_weapon_prof TEXT,
  PRIMARY KEY (class_id, class_weapon_prof),
  FOREIGN KEY (class_id) REFERENCES class(class_id)
  )''');

  // Class armor proficiencies table
  await db.execute('''CREATE TABLE class_armor_proficiencies(
  class_id INTEGER,
  class_armor_prof TEXT,
  PRIMARY KEY (class_id, class_armor_prof),
  FOREIGN KEY (class_id) REFERENCES class(class_id)
  )''');

  // Class lang proficiencies table
  await db.execute('''CREATE TABLE class_lang_proficiencies(
  class_id INTEGER,
  class_lang_prof TEXT,
  PRIMARY KEY (class_id, class_lang_prof),
  FOREIGN KEY (class_id) REFERENCES class(class_id)
  )''');

  // Class skill proficiencies table
  await db.execute('''CREATE TABLE class_skill_proficiencies(
  class_id INTEGER,
  class_skill_prof TEXT,
  PRIMARY KEY (class_id, class_skill_prof),
  FOREIGN KEY (class_id) REFERENCES class(class_id)
  )''');

  // Class tool proficiencies table
  await db.execute('''CREATE TABLE class_tool_proficiencies(
  class_id INTEGER,
  class_tool_prof TEXT,
  PRIMARY KEY (class_id, class_tool_prof),
  FOREIGN KEY (class_id) REFERENCES class(class_id)
  )''');

  // Class saving throw proficiencies table
  await db.execute('''CREATE TABLE class_saving_throw_proficiencies(
  class_id INTEGER,
  class_saving_throw_prof TEXT,
  PRIMARY KEY (class_id, class_saving_throw_prof),
  FOREIGN KEY (class_id) REFERENCES class(class_id)
  )''');

  // Subclass table
  await db.execute('''CREATE TABLE subclass(
  class_id INTEGER,
  subclass_id INTEGER,
  subclass_name TEXT NOT NULL,
  PRIMARY KEY (class_id, subclass_id),
  FOREIGN KEY (class_id) REFERENCES class(class_id)
  )''');

  // Subclass feature table
  await db.execute('''CREATE TABLE subclass_feature(
  class_id INTEGER,
  subclass_id INTEGER,
  subclass_name TEXT NOT NULL,
  PRIMARY KEY (class_id, subclass_id),
  FOREIGN KEY (class_id, subclass_id) REFERENCES subclass(class_id, subclass_id)
  )''');

  // Subclass weapon proficiencies table
  await db.execute('''CREATE TABLE subclass_weapon_proficiencies(
  class_id INTEGER,
  subclass_id INTEGER,
  subclass_weapon_prof TEXT,
  PRIMARY KEY (class_id, subclass_id, subclass_weapon_prof),
  FOREIGN KEY (class_id, subclass_id) REFERENCES subclass(class_id, subclass_id)
  )''');

  // Subclass armor proficiencies table
  await db.execute('''CREATE TABLE subclass_armor_proficiencies(
  class_id INTEGER,
  subclass_id INTEGER,
  subclass_armor_prof INTEGER,
  PRIMARY KEY (class_id, subclass_id, subclass_armor_prof),
  FOREIGN KEY (class_id, subclass_id) REFERENCES subclass(class_id, subclass_id)
  )''');

  // Subclass lang proficiencies table
  await db.execute('''CREATE TABLE subclass_lang_proficiencies(
  class_id INTEGER,
  subclass_id INTEGER,
  subclass_lang_prof TEXT,
  PRIMARY KEY (class_id, subclass_id, subclass_lang_prof),
  FOREIGN KEY (class_id, subclass_id) REFERENCES subclass(class_id, subclass_id)
  )''');

  // Subclass skill proficiencies table
  await db.execute('''CREATE TABLE subclass_skill_proficiencies(
  class_id INTEGER,
  subclass_id INTEGER,
  subclass_skill_prof TEXT,
  PRIMARY KEY (class_id, subclass_id, subclass_skill_prof),
  FOREIGN KEY (class_id, subclass_id) REFERENCES subclass(class_id, subclass_id)
  )''');

  // Subclass tool proficiencies table
  await db.execute('''CREATE TABLE subrace_tool_proficiencies(
  class_id INTEGER,
  subclass_id INTEGER,
  subclass_tool_prof TEXT,
  PRIMARY KEY (class_id, subclass_id, subclass_tool_prof),
  FOREIGN KEY (class_id, subclass_id) REFERENCES subclass(class_id, subclass_id)
  )''');

  // Subclass saving throw proficiencies table
  await db.execute('''CREATE TABLE subclass_saving_throw_proficiencies(
  class_id INTEGER,
  subclass_id INTEGER,
  subclass_saving_throw_prof TEXT,
  PRIMARY KEY (class_id, subclass_id, subclass_saving_throw_prof),
  FOREIGN KEY (class_id, subclass_id) REFERENCES subclass(class_id, subclass_id)
  )''');

  // Spells table
  await db.execute('''CREATE TABLE spells(
  spell_id INTEGER PRIMARY KEY,
  ritual TEXT,
  spell_name TEXT NOT NULL,
  spell_desc TEXT NOT NULL,
  spell_level INTEGER NOT NULL,
  spell_school TEXT NOT NULL,
  cast_time TEXT NOT NULL,
  range INTEGER NOT NULL,
  components TEXT,
  duration TEXT
  )''');

  // Has class spell table
  await db.execute('''CREATE TABLE has_class_spell(
  spell_id INTEGER,
  class_id INTEGER,
  PRIMARY KEY (spell_id, class_id),
  FOREIGN KEY (class_id) REFERENCES class(class_id)
  )''');

  // Has subclass spell table
  await db.execute('''CREATE TABLE has_subclass_spell(
  spell_id INTEGER,
  class_id INTEGER,
  subclass_id INTEGER,
  PRIMARY KEY (spell_id, subclass_id, class_id),
  FOREIGN KEY (spell_id) REFERENCES spells(spell_id),
  FOREIGN KEY (class_id, subclass_id) REFERENCES subclass(class_id, subclass_id)
  )''');

  // Inventory table
  await db.execute('''CREATE TABLE inventory(
  inventory_id INTEGER,
  character_id INTEGER,
  copper INTEGER,
  silver INTEGER,
  electrum INTEGER,
  gold INTEGER,
  platinum INTEGER,
  PRIMARY KEY (inventory_id, character_id),
  FOREIGN KEY (character_id) REFERENCES character(character_id)
  )''');

  // Sub_inventory table
  await db.execute('''CREATE TABLE sub_inventory(
  subinventory_id INTEGER,
  item_id INTEGER,
  PRIMARY KEY (subinventory_id, item_id),
  FOREIGN KEY (item_id) REFERENCES item(item_id)
  )''');

  // Item table
  await db.execute('''CREATE TABLE item(
  item_id INTEGER,
  subinventory_id INTEGER,
  inventory_id INTEGER,
  character_id INTEGER,
  PRIMARY KEY (subinventory_id, item_id, inventory_id, character_id),
  FOREIGN KEY (subinventory_id) REFERENCES sub_inventory(subinventory_id)
  FOREIGN KEY (character_id) REFERENCES character(character_id)
  FOREIGN KEY (inventory_id) REFERENCES inventory(inventory_id)
  )''');

  // Weapon table
  await db.execute('''CREATE TABLE weapon(
  item_id INTEGER PRIAMRY KEY,
  FOREIGN KEY (item_id) REFERENCES item(item_id)
  )''');

  // Weapon range table
  await db.execute('''CREATE TABLE weapon_range(
  item_id INTEGER,
  range_id INTEGER,
  melee_range INTEGER,
  deadly_range INTEGER,
  max_range INTEGER,
  PRIMARY KEY (item_id, range_id),
  FOREIGN KEY (item_id) REFERENCES item(item_id)
  )''');

  // Weapon properties table
  await db.execute('''CREATE TABLE weapon_properties(
  item_id INTEGER,
  weapon_property_name TEXT,
  weapon_property_description TEXT,
  PRIMARY KEY (item_id, weapon_property_name),
  FOREIGN KEY (item_id) REFERENCES item(item_id)
  )''');

  // Weapon damage table
  await db.execute('''CREATE TABLE weapon_damage(
  item_id INTEGER,
  damage_type TEXT,
  damage_die INTEGER,
  dice_count INTEGER,
  damage_modifier INTEGER,
  PRIMARY KEY (item_id, damage_type),
  FOREIGN KEY (item_id) REFERENCES item(item_id)
  )''');

  // Armor table
  await db.execute('''CREATE TABLE armor(
  item_id INTEGER PRIMARY KEY,
  armor_type TEXT NOT NULL,
  str_req INTEGER,
  dex_ac_plus_cap INTEGER,
  stealth_disadvantage INTEGER,
  base_ac_armor INTEGER NOT NULL,
  FOREIGN KEY (item_id) REFERENCES item(item_id)
  )''');

  // Gear table
  await db.execute('''CREATE TABLE gear(
  item_id INTEGER PRIMARY KEY,
  FOREIGN KEY (item_id) REFERENCES item(item_id)
  )''');

  // Tool table
  await db.execute('''CREATE TABLE tool(
  item_id INTEGER PRIMARY KEY,
  tool_type TEXT,
  FOREIGN KEY (item_id) REFERENCES item(item_id)
  )''');

  // Consumables table
  await db.execute('''CREATE TABLE consumables(
  item_id INTEGER PRIMARY KEY,
  charges INTEGER NOT NULL,
  duration INTEGER NOT NULL,
  FOREIGN KEY (item_id) REFERENCES item(item_id)
  )''');

  // Effects table
  await db.execute('''CREATE TABLE effects(
  item_id INTEGER PRIMARY KEY,
  effect_name TEXT NOT NULL,
  effect_description TEXT,
  FOREIGN KEY (item_id) REFERENCES item(item_id)
  )''');

  debugPrint("CHARACTER TABLES LOADED");
}
