import 'package:flutter/material.dart';
import 'package:dnd_companion_app/views/pages/character_class_page.dart';

class CharacterHomePage extends StatefulWidget {
  const CharacterHomePage({super.key});

  @override
  State<CharacterHomePage> createState() => _CharacterHomePageState();
}

class _CharacterHomePageState extends State<CharacterHomePage> {
  String advancementType = "Milestone";
  String inspirationType = "Advantage";

  bool intelligencePoints = false;
  bool encumbrance = false;
  bool homebrewRules = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Character Rules"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CharacterClassPage(
                      intelligencePointsEnabled: intelligencePoints,
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
              const Text(
                "Character Rules",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),

              const Divider(height: 32),

              const Text("Advancement Type", style: TextStyle(fontSize: 22)),
              RadioListTile<String>(
                title: const Text("Milestone"),
                value: "Milestone",
                groupValue: advancementType,
                onChanged: (value) {
                  setState(() {
                    advancementType = value!;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text("XP"),
                value: "XP",
                groupValue: advancementType,
                onChanged: (value) {
                  setState(() {
                    advancementType = value!;
                  });
                },
              ),

              const Divider(height: 32, thickness: 1),

              const SizedBox(height: 16),

              const Text("Inspiration", style: TextStyle(fontSize: 22)),
              RadioListTile<String>(
                title: const Text("Advantage"),
                value: "Advantage",
                groupValue: inspirationType,
                onChanged: (value) {
                  setState(() {
                    inspirationType = value!;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text("Dice"),
                value: "Dice",
                groupValue: inspirationType,
                onChanged: (value) {
                  setState(() {
                    inspirationType = value!;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text("Cards"),
                value: "Cards",
                groupValue: inspirationType,
                onChanged: (value) {
                  setState(() {
                    inspirationType = value!;
                  });
                },
              ),

              const Divider(height: 32),

              CheckboxListTile(
                title: const Text("Intelligence Points"),
                value: intelligencePoints,
                onChanged: (value) {
                  setState(() {
                    intelligencePoints = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text("Encumbrance"),
                value: encumbrance,
                onChanged: (value) {
                  setState(() {
                    encumbrance = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text("Homebrew Rules"),
                value: homebrewRules,
                onChanged: (value) {
                  setState(() {
                    homebrewRules = value!;
                  });
                },
              ),

              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.all(30.0),
                child: OutlinedButton.icon(
                  onPressed: () {
                    print("Create tag");
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Create Tag"),
                ),
              ),

              const SizedBox(height: 8),

              DropdownButton<String>(
                hint: const Text("View all tags"),
                items: const [
                  DropdownMenuItem(
                    value: "Rain King",
                    child: Text("Rain King"),
                  ),
                  DropdownMenuItem(value: "Trinty", child: Text("Trinity")),
                ],
                onChanged: (value) {},
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
