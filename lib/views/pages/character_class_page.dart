import 'package:flutter/material.dart';
import 'package:dnd_companion_app/views/pages/character_race_background_page.dart';

class CharacterClassPage extends StatefulWidget {
  final bool intelligencePointsEnabled;

  const CharacterClassPage({
    super.key,
    required this.intelligencePointsEnabled,
  });

  @override
  State<CharacterClassPage> createState() => _CharacterClassPageState();
}

class _CharacterClassPageState extends State<CharacterClassPage> {
  final TextEditingController nameController = TextEditingController();

  String? selectedClass;
  String? selectedSubclass;
  String? selectedLevel;

  final List<String> classes = const [
    "Barbarian",
    "Bard",
    "Cleric",
    "Druid",
    "Fighter",
    "Monk",
    "Paladin",
    "Ranger",
    "Rogue",
    "Sorcerer",
    "Warlock",
    "Wizard",
  ];

  final List<String> levels = const [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
  ];

  final Map<String, int> subclassUnlockLevel = const {
    "Barbarian": 3,
    "Bard": 3,
    "Cleric": 1,
    "Druid": 2,
    "Fighter": 3,
    "Monk": 3,
    "Paladin": 3,
    "Ranger": 3,
    "Rogue": 3,
    "Sorcerer": 1,
    "Warlock": 1,
    "Wizard": 2,
  };

  final Map<String, List<String>> subclassOptions = const {
    "Barbarian": ["Berserker", "Totem Warrior", "Ancestral Guardian"],
    "Bard": ["Lore", "Valor", "Eloquence"],
    "Cleric": ["Life Domain", "Light Domain", "War Domain"],
    "Druid": ["Land", "Moon", "Spores"],
    "Fighter": ["Champion", "Battle Master", "Eldritch Knight"],
    "Monk": ["Open Hand", "Shadow", "Four Elements"],
    "Paladin": ["Devotion", "Vengeance", "Ancients"],
    "Ranger": ["Hunter", "Beast Master", "Gloom Stalker"],
    "Rogue": ["Thief", "Assassin", "Arcane Trickster"],
    "Sorcerer": ["Draconic Bloodline", "Wild Magic", "Divine Soul"],
    "Warlock": ["Fiend", "Great Old One", "Archfey"],
    "Wizard": ["Evocation", "Abjuration", "Necromancy"],
  };

  final Map<String, String> hitDice = const {
    "Barbarian": "12",
    "Bard": "8",
    "Cleric": "8",
    "Druid": "8",
    "Fighter": "10",
    "Monk": "8",
    "Paladin": "10",
    "Ranger": "10",
    "Rogue": "8",
    "Sorcerer": "6",
    "Warlock": "8",
    "Wizard": "6",
  };

  final Map<String, String> classFeatureDescriptions = const {
    "Barbarian": "Rage, Unarmored Defense, Reckless Attack, Danger Sense...",
    "Bard": "Bardic Inspiration, Spellcasting, Jack of All Trades...",
    "Cleric": "Spellcasting, Divine Domain, Channel Divinity...",
    "Druid": "Spellcasting, Wild Shape, Druid Circle...",
    "Fighter": "Fighting Style, Second Wind, Action Surge, Extra Attack...",
    "Monk": "Martial Arts, Ki, Unarmored Movement...",
    "Paladin": "Divine Sense, Lay on Hands, Divine Smite...",
    "Ranger": "Favored Enemy, Natural Explorer, Fighting Style...",
    "Rogue": "Expertise, Sneak Attack, Thieves' Cant, Cunning Action...",
    "Sorcerer": "Spellcasting, Sorcerous Origin, Metamagic...",
    "Warlock": "Otherworldly Patron, Pact Magic, Eldritch Invocations...",
    "Wizard": "Spellcasting, Arcane Recovery, Arcane Tradition...",
  };

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  void showClassFeatures() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("$selectedClass Features"),
          content: Text(
            classFeatureDescriptions[selectedClass] ??
                "Class feature information will go here.",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> availableSubclasses =
        subclassOptions[selectedClass] ?? [];

    final int currentLevel = int.tryParse(selectedLevel ?? "0") ?? 0;
    final int requiredSubclassLevel = subclassUnlockLevel[selectedClass] ?? 99;

    final bool canChooseSubclass =
        selectedClass != null && currentLevel >= requiredSubclassLevel;

    final String hitDieDisplay = selectedClass == null || selectedLevel == null
        ? "—"
        : "${selectedLevel}xD${hitDice[selectedClass] ?? "—"}";

    final String maxHp = selectedClass == null ? "—" : "TBD";

    if (selectedSubclass != null &&
        !availableSubclasses.contains(selectedSubclass)) {
      selectedSubclass = null;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Character Class"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CharacterRaceBackgroundPage(
                      intelligencePointsEnabled:
                          widget.intelligencePointsEnabled,
                    );
                  },
                ),
              );
            },
            icon: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Max HP: $maxHp"),
                          const SizedBox(height: 8),
                          Text("Hit Die: $hitDieDisplay"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: "Class",
                            border: OutlineInputBorder(),
                          ),
                          value: selectedClass,
                          items: classes.map((className) {
                            return DropdownMenuItem(
                              value: className,
                              child: Text(className),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedClass = value;
                              selectedSubclass = null;
                            });
                          },
                        ),

                        const SizedBox(height: 16),

                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: "Level",
                            border: OutlineInputBorder(),
                          ),
                          value: selectedLevel,
                          items: levels.map((level) {
                            return DropdownMenuItem(
                              value: level,
                              child: Text("Level $level"),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedLevel = value;

                              final int newLevel =
                                  int.tryParse(value ?? "0") ?? 0;
                              final int requiredLevel =
                                  subclassUnlockLevel[selectedClass] ?? 99;

                              if (newLevel < requiredLevel) {
                                selectedSubclass = null;
                              }
                            });
                          },
                        ),

                        const SizedBox(height: 16),

                        if (selectedClass == null)
                          const Text("Select a class to see subclass options."),

                        if (selectedClass != null && !canChooseSubclass)
                          Text(
                            "Subclass unlocks at level "
                            "$requiredSubclassLevel for $selectedClass.",
                          ),

                        if (canChooseSubclass)
                          DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              labelText: "Subclass",
                              border: OutlineInputBorder(),
                            ),
                            value: selectedSubclass,
                            items: availableSubclasses.map((subclassName) {
                              return DropdownMenuItem(
                                value: subclassName,
                                child: Text(subclassName),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedSubclass = value;
                              });
                            },
                          ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 24),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        OutlinedButton.icon(
                          onPressed: selectedClass == null
                              ? null
                              : showClassFeatures,
                          icon: const Icon(Icons.menu_book),
                          label: const Text("View Class Features"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const Divider(height: 40),

              Card(
                child: ListTile(
                  leading: const Icon(Icons.add),
                  title: const Text("Add another class"),
                  subtitle: const Text("Multiclass placeholder"),
                  onTap: () {
                    print("Add another class");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
