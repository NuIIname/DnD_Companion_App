

-- race

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


-- spells


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
