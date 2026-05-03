import 'package:flutter/material.dart';
import 'package:dnd_companion_app/views/pages/character_equipment_page.dart';

class CharacterAbilitiesPage extends StatefulWidget {
  final bool intelligencePointsEnabled;

  const CharacterAbilitiesPage({
    super.key,
    required this.intelligencePointsEnabled,
  });

  @override
  State<CharacterAbilitiesPage> createState() => _CharacterAbilitiesPageState();
}

class _CharacterAbilitiesPageState extends State<CharacterAbilitiesPage> {
  String abilityMethod = "Manual";

  final List<String> abilityMethods = const ["Manual", "Standard Array"];

  final List<int> standardArrayValues = const [15, 14, 13, 12, 10, 8];

  final TextEditingController strController = TextEditingController();
  final TextEditingController dexController = TextEditingController();
  final TextEditingController conController = TextEditingController();
  final TextEditingController intController = TextEditingController();
  final TextEditingController wisController = TextEditingController();
  final TextEditingController chrController = TextEditingController();

  int? strValue;
  int? dexValue;
  int? conValue;
  int? intValue;
  int? wisValue;
  int? chrValue;

  @override
  void dispose() {
    strController.dispose();
    dexController.dispose();
    conController.dispose();
    intController.dispose();
    wisController.dispose();
    chrController.dispose();
    super.dispose();
  }

  int abilityModifier(int score) {
    return ((score - 10) / 2).floor();
  }

  int? getIntScore() {
    if (abilityMethod == "Manual") {
      return int.tryParse(intController.text);
    }

    if (abilityMethod == "Standard Array") {
      return intValue;
    }

    return null;
  }

  int getIntelligencePoints() {
    final int? score = getIntScore();

    if (score == null) {
      return 0;
    }

    final int modifier = abilityModifier(score);

    if (modifier < 0) {
      return 0;
    }

    return modifier;
  }

  List<int> availableValuesFor(int? currentValue) {
    final usedValues = [
      strValue,
      dexValue,
      conValue,
      intValue,
      wisValue,
      chrValue,
    ];

    return standardArrayValues.where((value) {
      return value == currentValue || !usedValues.contains(value);
    }).toList();
  }

  void clearScores() {
    strController.clear();
    dexController.clear();
    conController.clear();
    intController.clear();
    wisController.clear();
    chrController.clear();

    strValue = null;
    dexValue = null;
    conValue = null;
    intValue = null;
    wisValue = null;
    chrValue = null;
  }

  Widget manualAbilityField(String label, TextEditingController controller) {
    return Expanded(
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        onChanged: (value) {
          setState(() {});
        },
      ),
    );
  }

  Widget standardArrayDropdown({
    required String label,
    required int? value,
    required void Function(int?) onChanged,
  }) {
    return Expanded(
      child: DropdownButtonFormField<int>(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        value: value,
        items: availableValuesFor(value).map((score) {
          return DropdownMenuItem<int>(
            value: score,
            child: Text(score.toString()),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            onChanged(newValue);
          });
        },
      ),
    );
  }

  Widget manualScoresSection() {
    return Column(
      children: [
        Row(
          children: [
            manualAbilityField("STR", strController),
            const SizedBox(width: 12),
            manualAbilityField("DEX", dexController),
            const SizedBox(width: 12),
            manualAbilityField("CON", conController),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            manualAbilityField("INT", intController),
            const SizedBox(width: 12),
            manualAbilityField("WIS", wisController),
            const SizedBox(width: 12),
            manualAbilityField("CHR", chrController),
          ],
        ),
      ],
    );
  }

  Widget standardArraySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Standard Array: 15, 14, 13, 12, 10, 8",
          style: TextStyle(fontSize: 18),
        ),

        const SizedBox(height: 16),

        Row(
          children: [
            standardArrayDropdown(
              label: "STR",
              value: strValue,
              onChanged: (value) {
                strValue = value;
              },
            ),
            const SizedBox(width: 12),
            standardArrayDropdown(
              label: "DEX",
              value: dexValue,
              onChanged: (value) {
                dexValue = value;
              },
            ),
            const SizedBox(width: 12),
            standardArrayDropdown(
              label: "CON",
              value: conValue,
              onChanged: (value) {
                conValue = value;
              },
            ),
          ],
        ),

        const SizedBox(height: 16),

        Row(
          children: [
            standardArrayDropdown(
              label: "INT",
              value: intValue,
              onChanged: (value) {
                intValue = value;
              },
            ),
            const SizedBox(width: 12),
            standardArrayDropdown(
              label: "WIS",
              value: wisValue,
              onChanged: (value) {
                wisValue = value;
              },
            ),
            const SizedBox(width: 12),
            standardArrayDropdown(
              label: "CHR",
              value: chrValue,
              onChanged: (value) {
                chrValue = value;
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget proficienciesPlaceholderSection() {
    final int? intScore = getIntScore();
    final int intelligencePoints = getIntelligencePoints();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 40),

        const Text(
          "Proficiencies",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 8),

        const Text(
          "Class, race, and background proficiencies will be loaded from the SQLite backend.",
        ),

        const SizedBox(height: 16),

        Card(
          child: Column(
            children: const [
              ListTile(
                title: Text("Languages"),
                subtitle: Text("Placeholder: Common, Elvish, etc."),
              ),
              Divider(height: 1),
              ListTile(
                title: Text("Weapons"),
                subtitle: Text(
                  "Placeholder: Simple weapons, martial weapons, etc.",
                ),
              ),
              Divider(height: 1),
              ListTile(
                title: Text("Armor"),
                subtitle: Text("Placeholder: Light armor, shields, etc."),
              ),
              Divider(height: 1),
              ListTile(
                title: Text("Skills"),
                subtitle: Text(
                  "Placeholder: Perception, Stealth, Arcana, etc.",
                ),
              ),
              Divider(height: 1),
              ListTile(
                title: Text("Tools"),
                subtitle: Text(
                  "Placeholder: Thieves' tools, artisan tools, etc.",
                ),
              ),
              Divider(height: 1),
              ListTile(
                title: Text("Saving Throws"),
                subtitle: Text("Placeholder: STR, DEX, CON, INT, WIS, CHA."),
              ),
            ],
          ),
        ),

        if (widget.intelligencePointsEnabled) ...[
          const Divider(height: 40),

          const Text(
            "Intelligence Points",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          Text(
            intScore == null
                ? "Enter/select an INT score to calculate Intelligence Points."
                : "INT Score: $intScore | Available Intelligence Points: $intelligencePoints",
            style: const TextStyle(fontSize: 16),
          ),

          const SizedBox(height: 16),

          Card(
            child: Column(
              children: const [
                ListTile(
                  title: Text("Languages"),
                  subtitle: Text(
                    "Spend Intelligence Points on extra languages.",
                  ),
                ),
                Divider(height: 1),
                ListTile(
                  title: Text("Weapons"),
                  subtitle: Text(
                    "Spend Intelligence Points on weapon proficiencies.",
                  ),
                ),
                Divider(height: 1),
                ListTile(
                  title: Text("Armor"),
                  subtitle: Text(
                    "Spend Intelligence Points on armor proficiencies.",
                  ),
                ),
                Divider(height: 1),
                ListTile(
                  title: Text("Skills"),
                  subtitle: Text(
                    "Spend Intelligence Points on skill proficiencies.",
                  ),
                ),
                Divider(height: 1),
                ListTile(
                  title: Text("Tools"),
                  subtitle: Text(
                    "Spend Intelligence Points on tool proficiencies.",
                  ),
                ),
                Divider(height: 1),
                ListTile(
                  title: Text("Saving Throws"),
                  subtitle: Text(
                    "Spend Intelligence Points on saving throw proficiencies.",
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  void goToEquipmentPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const CharacterEquipmentPage();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ability Scores"),
        actions: [
          IconButton(
            onPressed: goToEquipmentPage,
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
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "Ability Score Method",
                  border: OutlineInputBorder(),
                ),
                value: abilityMethod,
                items: abilityMethods.map((method) {
                  return DropdownMenuItem<String>(
                    value: method,
                    child: Text(method),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    abilityMethod = value!;
                    clearScores();
                  });
                },
              ),

              const Divider(height: 40),

              if (abilityMethod == "Manual") manualScoresSection(),

              if (abilityMethod == "Standard Array") standardArraySection(),

              proficienciesPlaceholderSection(),
            ],
          ),
        ),
      ),
    );
  }
}
