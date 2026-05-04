

-- race
INSERT INTO race(creature_size, str, dex, con, inte, wis, cha, natural_armor, race_name)
VALUES ('Small', 11, 6, 3, 9, 1, 3, 10, 'Aasimar');

INSERT INTO race(creature_size, str, dex, con, inte, wis, cha, natural_armor, race_name)
VALUES ('Medium', 28, 4, 5, 1, 4, 12, 12, 'Dragonborn');

INSERT INTO race(creature_size, str, dex, con, inte, wis, cha, natural_armor, race_name)
VALUES ('Small', 13, 14, 15, 3, 8, 21, 7, 'Dwarf');

INSERT INTO race(creature_size, str, dex, con, inte, wis, cha, natural_armor, race_name)
VALUES ('Medium', 7, 14, 15, 3, 8, 21, 7, 'Elf');

INSERT INTO race(creature_size, str, dex, con, inte, wis, cha, natural_armor, race_name)
VALUES ('Small', 5, 21, 6, 30, 7, 13, 19, 'Gnome');

INSERT INTO race(creature_size, str, dex, con, inte, wis, cha, natural_armor, race_name)
VALUES ('Large', 30, 1, 24, 18, 7, 2, 6, 'Goliath');

INSERT INTO race(creature_size, str, dex, con, inte, wis, cha, natural_armor, race_name)
VALUES ('Small', 1, 5, 27, 3, 4, 23, 17, 'Halfling');

INSERT INTO race(creature_size, str, dex, con, inte, wis, cha, natural_armor, race_name)
VALUES ('Medium', 14, 15, 28, 30, 12, 3, 5, 'Human');

INSERT INTO race(creature_size, str, dex, con, inte, wis, cha, natural_armor, race_name)
VALUES ('Large', 30, 21, 8, 3, 11, 7, 15, 'Orc');

INSERT INTO race(creature_size, str, dex, con, inte, wis, cha, natural_armor, race_name)
VALUES ('Large', 26, 1, 11, 18, 13, 17, 6, 'Tiefling');


-- items
INSERT INTO item(item_name)
VALUES ('Great Axe');

INSERT INTO item(item_name)
VALUES ('Great Sword');

INSERT INTO item(item_name)
VALUES ('Warhammer');

INSERT INTO item(item_name)
VALUES ('Club');

INSERT INTO item(item_name)
VALUES ('Dagger');

-- spells
INSERT INTO spells(ritual, spell_name, spell_desc, spell_level, spell_school, cast_time, range_, components, duration)
VALUES ('Ritual', 'Abi-Dalzims Horrid Witling', 'You draw the moisture from every creature in a 30-foot cube centered on a point you choose within range. Each creature in that area must make a Constitution saving throw. Constructs and undead arent affected, and plants and water elementals make this saving throw with disadvantage. A creature takes 12d8 necrotic damage on a failed save, or half as much damage on a successful one.', 8, 'Necromancy', '1 Action', 150, 'V, S, M', 'Instaneous');

INSERT INTO spells(ritual, spell_name, spell_desc, spell_level, spell_school, cast_time, range_, components, duration)
VALUES ('Ritual', 'Acid Splash', 'You hurl a bubble of acid. Choose one or two creatures you can see within range. If you choose two, they must be within 5 feet of each other. A target must succeed on a Dexterity saving throw or take 1d6 acid damage.', 2, 'Conjuration', '1 Action', 60, 'V,S', 'Instaneous');


INSERT INTO spells(ritual, spell_name, spell_desc, spell_level, spell_school, cast_time, range_, components, duration)
VALUES ('Ritual', 'Bless', 'You bless up to three creatures of your choice within range. Whenever a target makes an attack roll or a saving throw before the spell ends, the target can roll a d4 and add the number rolled to the attack roll or saving throw.', 1, 'Enchantment', '1 Action', 30, 'V,S,M', '1 Minute');


INSERT INTO spells(ritual, spell_name, spell_desc, spell_level, spell_school, cast_time, range_, components, duration)
VALUES ('Ritual', 'Arcane Eye', 'You create an invisible, magical eye within range that hovers in the air for the duration.', 4, 'Divination', '1 Action', 30, 'V,S,M', '1 Hour');


INSERT INTO spells(ritual, spell_name, spell_desc, spell_level, spell_school, cast_time, range_, components, duration)
VALUES ('Ritual', 'Wall of Water', 'You create a wall of water on the ground at a point you can see within range. You can make the wall up to 30 feet long, 10 feet high, and 1 foot thick, or you can make a ringed wall up to 20 feet in diameter, 20 feet high, and 1 foot thick. The wall vanishes when the spell ends. The wall’s space is difficult terrain.', 3, 'Evocation', '1 Action', 60, 'V,S,M', '10 Minutes');

INSERT INTO spells(ritual, spell_name, spell_desc, spell_level, spell_school, cast_time, range_, components, duration)
VALUES ('Ritual', 'Levitate', 'One creature or loose object of your choice that you can see within range rises vertically, up to 20 feet, and remains suspended there for the duration. The spell can levitate a target that weighs up to 500 pounds. An unwilling creature that succeeds on a Constitution saving throw is unaffected.', 2, 'Transmutation', '1 Action', 60, 'V,S,M', '10 Minutes');


INSERT INTO spells(ritual, spell_name, spell_desc, spell_level, spell_school, cast_time, range_, components, duration)
VALUES ('Ritual', 'Prismatic Wall', 'A shimmering, multicolored plane of light forms a vertical opaque wall--up to 90 feet long, 30 feet high, and 1 inch thick--centered on a point you can see within range. Alternatively, you can shape the wall into a sphere up to 30 feet in diameter centered on a point you choose within range. The wall remains in place for the duration. If you position the wall so that it passes through a space occupied by a creature, the spell fails, and your action and the spell slot are wasted.', 9, 'Abjuration', '1 Action', 60, 'V,S', '10 Minutes');

INSERT INTO spells(ritual, spell_name, spell_desc, spell_level, spell_school, cast_time, range_, components, duration)
VALUES ('Ritual', 'Invisibility', 'A creature you touch becomes invisible until the spell ends. Anything the target is wearing or carrying is invisible as long as it is on the targets person. The spell ends for a target that attacks or casts a spell.', 2, 'Illusion', '1 Action', 0, 'V,S,M', '1 Hour');


-- classes
INSERT INTO class(class_name, class_equip, base_ac, dex_ac, unarmored_defense)
VALUES ('Barbarian', 'Axe', 10, 6, 12);

INSERT INTO class(class_name, class_equip, base_ac, dex_ac, unarmored_defense)
VALUES ('Bard', 'Violin', 9, 10, 1);

INSERT INTO class(class_name, class_equip, base_ac, dex_ac, unarmored_defense)
VALUES ('Cleric', 'Mace', 12, 5, 7);

INSERT INTO class(class_name, class_equip, base_ac, dex_ac, unarmored_defense)
VALUES ('Druid', 'Bow and Arrow', 9, -3, 2);

INSERT INTO class(class_name, class_equip, base_ac, dex_ac, unarmored_defense)
VALUES ('Fighter', 'Sword', 10, 5, 5);

INSERT INTO class(class_name, class_equip, base_ac, dex_ac, unarmored_defense)
VALUES ('Monk', 'Spear', 2, 9, 7);


INSERT INTO class(class_name, class_equip, base_ac, dex_ac, unarmored_defense)
VALUES ('Paladin', 'Heavy Sword', 15, 3, 2);


INSERT INTO class(class_name, class_equip, base_ac, dex_ac, unarmored_defense)
VALUES ('Ranger', 'Crossbow', 10, -1, 5);

INSERT INTO class(class_name, class_equip, base_ac, dex_ac, unarmored_defense)
VALUES ('Rogue', 'Dagger', 9, 2, 8);

INSERT INTO class(class_name, class_equip, base_ac, dex_ac, unarmored_defense)
VALUES ('Sorcerer', 'Potions', 4, 8, 18);


INSERT INTO class(class_name, class_equip, base_ac, dex_ac, unarmored_defense)
VALUES ('Warlock', 'Staff', 3, 10, 15);


INSERT INTO class(class_name, class_equip, base_ac, dex_ac, unarmored_defense)
VALUES ('Wizard', 'Wand', 2, 9, 13);


-- creatures
INSERT INTO creature(creature_name, creature_armor_class, str, dex, con, inte, wis, cha, cr, damage_resistance, creature_conditions, creature_hit_die, creature_static_hp, creature_size, alignment)
VALUES ('Grimlock', 11, 16, 12, 12, 9, 8, 6, 1, 'None', 'None', 3, 11, 'Large', 'Netural Evil');


INSERT INTO creature(creature_name, creature_armor_class, str, dex, con, inte, wis, cha, cr, damage_resistance, creature_conditions, creature_hit_die, creature_static_hp, creature_size, alignment)
VALUES ('Cloaker', 14, 17, 15, 12, 13, 14, 7, 8, 'Frightened', 'None', 8, 91, 'Large', 'Chaotic Neutral');

INSERT INTO creature(creature_name, creature_armor_class, str, dex, con, inte, wis, cha, cr, damage_resistance, creature_conditions, creature_hit_die, creature_static_hp, creature_size, alignment)
VALUES ('Wolf', 12, 14, 15, 12, 3, 12, 6, 1, 'None', 'None', 2, 11, 'Medium', 'Evil');

INSERT INTO creature(creature_name, creature_armor_class, str, dex, con, inte, wis, cha, cr, damage_resistance, creature_conditions, creature_hit_die, creature_static_hp, creature_size, alignment)
VALUES ('Deva', 17, 18, 18, 18, 17, 20, 20, 2, 'Radiant, Bludgeoning, Piercing, Slashing', 'None', 5, 136, 'Medium', 'Lawful Good');

INSERT INTO creature(creature_name, creature_armor_class, str, dex, con, inte, wis, cha, cr, damage_resistance, creature_conditions, creature_hit_die, creature_static_hp, creature_size, alignment)
VALUES ('Adult Blue Dragon', 19, 25, 10, 23, 16, 15, 19, 7, 'None', 'None', 4, 225, 'Huge', 'Lawful Evil');

INSERT INTO creature(creature_name, creature_armor_class, str, dex, con, inte, wis, cha, cr, damage_resistance, creature_conditions, creature_hit_die, creature_static_hp, creature_size, alignment)
VALUES ('Vulture', 10, 7, 10, 13, 2, 12, 4, 6, 'None', 'None', 0, 5, 'Medium', 'Unaligned');


INSERT INTO creature(creature_name, creature_armor_class, str, dex, con, inte, wis, cha, cr, damage_resistance, creature_conditions, creature_hit_die, creature_static_hp, creature_size, alignment)
VALUES ('Stone Golem', 17, 22, 9, 20, 3, 11, 1, 4, 'None', 'None', 7, 178, 'Large', 'Unaligned');
