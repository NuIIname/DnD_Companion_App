import 'package:flutter/material.dart';
import 'package:dnd_companion_app/views/pages/character_abilities_page.dart';
import 'package:dnd_companion_app/data_models/character_draft.dart';

class CharacterRaceBackgroundPage extends StatefulWidget {
  final CharacterDraft draft;

  const CharacterRaceBackgroundPage({super.key, required this.draft});

  @override
  State<CharacterRaceBackgroundPage> createState() =>
      _CharacterRaceBackgroundPageState();
}

class _CharacterRaceBackgroundPageState
    extends State<CharacterRaceBackgroundPage> {
  String? selectedRace;
  String? selectedBackground;
  String? selectedAlignment;

  final List<String> races = const [
    "Human",
    "Elf",
    "Dwarf",
    "Halfling",
    "Dragonborn",
    "Tiefling",
    "Half-Elf",
    "Half-Orc",
    "Gnome",
  ];

  final List<String> backgrounds = const [
    "Acolyte",
    "Criminal",
    "Folk Hero",
    "Noble",
    "Sage",
    "Soldier",
    "Urchin",
  ];

  final List<String> alignments = const [
    "Lawful Good",
    "Neutral Good",
    "Chaotic Good",
    "Lawful Neutral",
    "True Neutral",
    "Chaotic Neutral",
    "Lawful Evil",
    "Neutral Evil",
    "Chaotic Evil",
  ];

  @override
  void initState() {
    super.initState();

    selectedRace = widget.draft.race.isEmpty ? null : widget.draft.race;
    selectedBackground = widget.draft.background.isEmpty
        ? null
        : widget.draft.background;
    selectedAlignment = widget.draft.alignment.isEmpty
        ? null
        : widget.draft.alignment;
  }

  void saveDraftAndGoNext() {
    widget.draft.race = selectedRace ?? "";
    widget.draft.background = selectedBackground ?? "";
    widget.draft.alignment = selectedAlignment ?? "True Neutral";

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return CharacterAbilitiesPage(draft: widget.draft);
        },
      ),
    );
  }

  void showRaceDetails() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("${selectedRace ?? "Race"} Details"),
          content: Text(
            selectedRace == null
                ? "Select a race first."
                : "Race details for $selectedRace will go here.",
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

  void showBackgroundDetails() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("${selectedBackground ?? "Background"} Details"),
          content: Text(
            selectedBackground == null
                ? "Select a background first."
                : "Background details for $selectedBackground will go here.",
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

  Widget textLine(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: const UnderlineInputBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Race & Background"),
        actions: [
          IconButton(
            onPressed: saveDraftAndGoNext,
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
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: "Race",
                        border: OutlineInputBorder(),
                      ),
                      value: selectedRace,
                      items: races.map((race) {
                        return DropdownMenuItem(value: race, child: Text(race));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedRace = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: "Background",
                        border: OutlineInputBorder(),
                      ),
                      value: selectedBackground,
                      items: backgrounds.map((background) {
                        return DropdownMenuItem(
                          value: background,
                          child: Text(background),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedBackground = value;
                        });
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: selectedRace == null ? null : showRaceDetails,
                      icon: const Icon(Icons.info_outline),
                      label: const Text("Race Details"),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: selectedBackground == null
                          ? null
                          : showBackgroundDetails,
                      icon: const Icon(Icons.info_outline),
                      label: const Text("Background Details"),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "Alignment",
                  border: OutlineInputBorder(),
                ),
                value: selectedAlignment,
                items: alignments.map((alignment) {
                  return DropdownMenuItem(
                    value: alignment,
                    child: Text(alignment),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedAlignment = value;
                  });
                },
              ),

              const Divider(height: 40),

              textLine("Personality Traits"),
              textLine("Ideals"),
              textLine("Bonds"),
              textLine("Flaws"),
              textLine("About"),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
