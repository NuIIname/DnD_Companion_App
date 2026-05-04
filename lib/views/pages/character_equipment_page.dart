import 'package:flutter/material.dart';
import 'package:dnd_companion_app/data_models/character_model.dart';
import 'package:dnd_companion_app/data_models/character_draft.dart';
import 'package:dnd_companion_app/helper_classes/character_helper.dart';

class CharacterEquipmentPage extends StatefulWidget {
  final CharacterDraft draft;

  const CharacterEquipmentPage({super.key, required this.draft});

  @override
  State<CharacterEquipmentPage> createState() => _CharacterEquipmentPageState();
}

class _CharacterEquipmentPageState extends State<CharacterEquipmentPage> {
  String? selectedClassEquipment;
  String? selectedBackgroundEquipment;
  String? selectedStartingGold;

  final List<String> classEquipmentOptions = const [
    "Default Class Equipment",
    "Starting Gold",
    "Custom Equipment",
  ];

  final List<String> backgroundEquipmentOptions = const [
    "Default Background Equipment",
    "Custom Background Equipment",
  ];

  final List<String> startingGoldOptions = const [
    "Roll Starting Gold",
    "Use Average Gold",
    "Manual Gold Entry",
  ];

  final TextEditingController customEquipmentController =
      TextEditingController();

  @override
  void dispose() {
    customEquipmentController.dispose();
    super.dispose();
  }

  Widget equipmentDropdown({
    required String label,
    required String? value,
    required List<String> options,
    required void Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      value: value,
      items: options.map((option) {
        return DropdownMenuItem<String>(value: option, child: Text(option));
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          onChanged(newValue);
        });
      },
    );
  }

  Future<void> finishCharacter() async {
    final String characterName = widget.draft.name.trim().isEmpty
        ? "Unnamed Character"
        : widget.draft.name.trim();

    final String alignment = widget.draft.alignment.trim().isEmpty
        ? "True Neutral"
        : widget.draft.alignment.trim();

    final character = Character(
      characterName: characterName,
      conditions: "None",
      xp: 0,
      resurrectionDC: 10,
      alignment: alignment,
      deathSaves: 0,
    );

    final int characterId = await CharacterHelper.instance.addNew(character);

    if (characterId <= 0) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Character save failed")));
      return;
    }

    if (widget.draft.characterClass.isNotEmpty) {
      final int level = int.tryParse(widget.draft.level) ?? 1;

      final int classResult = await CharacterHelper.instance.setCharacterClass(
        characterId,
        widget.draft.characterClass,
        level,
      );

      if (classResult <= 0) {
        debugPrint("Character saved, but class/level attachment failed.");
      }
    }

    if (widget.draft.race.isNotEmpty) {
      final int raceResult = await CharacterHelper.instance.setCharacterRace(
        characterId,
        widget.draft.race,
      );

      if (raceResult <= 0) {
        debugPrint("Character saved, but race attachment failed.");
      }
    }

    if (!mounted) return;

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("$characterName saved")));

    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    final draft = widget.draft;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Equipment"),
        actions: [
          IconButton(onPressed: finishCharacter, icon: const Icon(Icons.check)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Starting Equipment",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              Card(
                child: ListTile(
                  title: Text(
                    draft.name.trim().isEmpty
                        ? "Unnamed Character"
                        : draft.name.trim(),
                  ),
                  subtitle: Text(
                    "${draft.race.isEmpty ? "No race" : draft.race} "
                    "${draft.characterClass.isEmpty ? "No class" : draft.characterClass} "
                    "Level ${draft.level.isEmpty ? "1" : draft.level}",
                  ),
                ),
              ),

              const SizedBox(height: 16),

              equipmentDropdown(
                label: "Class Equipment",
                value: selectedClassEquipment,
                options: classEquipmentOptions,
                onChanged: (value) {
                  selectedClassEquipment = value;
                },
              ),

              const SizedBox(height: 16),

              equipmentDropdown(
                label: "Background Equipment",
                value: selectedBackgroundEquipment,
                options: backgroundEquipmentOptions,
                onChanged: (value) {
                  selectedBackgroundEquipment = value;
                },
              ),

              const SizedBox(height: 16),

              equipmentDropdown(
                label: "Starting Gold",
                value: selectedStartingGold,
                options: startingGoldOptions,
                onChanged: (value) {
                  selectedStartingGold = value;
                },
              ),

              const Divider(height: 40),

              const Text(
                "Custom Equipment Notes",
                style: TextStyle(fontSize: 22),
              ),

              const SizedBox(height: 12),

              TextField(
                controller: customEquipmentController,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: "Enter custom equipment, items, or notes",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 24),

              Card(
                child: Column(
                  children: const [
                    ListTile(
                      title: Text("Weapons"),
                      subtitle: Text(
                        "Placeholder: weapon choices from backend",
                      ),
                    ),
                    Divider(height: 1),
                    ListTile(
                      title: Text("Armor"),
                      subtitle: Text("Placeholder: armor choices from backend"),
                    ),
                    Divider(height: 1),
                    ListTile(
                      title: Text("Tools / Packs"),
                      subtitle: Text(
                        "Placeholder: tools and packs from backend",
                      ),
                    ),
                    Divider(height: 1),
                    ListTile(
                      title: Text("Currency"),
                      subtitle: Text("Placeholder: starting gold / coins"),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              FilledButton.icon(
                onPressed: finishCharacter,
                icon: const Icon(Icons.check),
                label: const Text("Finish Character"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
