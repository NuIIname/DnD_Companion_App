import 'package:flutter/material.dart';
import 'package:dnd_companion_app/views/pages/character_home_page.dart';
import 'package:dnd_companion_app/helper_classes/character_helper.dart';

class CharacterListPage extends StatefulWidget {
  const CharacterListPage({super.key});

  @override
  State<CharacterListPage> createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {
  late Future<List<Map<String, dynamic>>> charactersFuture;

  @override
  void initState() {
    super.initState();
    loadCharacters();
  }

  void loadCharacters() {
    charactersFuture = CharacterHelper.instance.getAll();
  }

  Future<void> refreshCharacters() async {
    setState(() {
      loadCharacters();
    });
  }

  void goToCharacterCreator() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const CharacterHomePage();
        },
      ),
    );

    refreshCharacters();
  }

  Future<void> deleteCharacter(int characterId, String characterName) async {
    final bool? shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Delete Character"),
          content: Text("Delete $characterName?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text("Cancel"),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );

    if (shouldDelete != true) {
      return;
    }

    final int result = await CharacterHelper.instance.delete(characterId);

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(result > 0 ? "$characterName deleted" : "Delete failed"),
      ),
    );

    refreshCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Characters"),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: goToCharacterCreator,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: charactersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text("Error loading characters: ${snapshot.error}"),
            );
          }

          final characters = snapshot.data ?? [];

          if (characters.isEmpty) {
            return const Center(
              child: Text(
                "No characters created yet.",
                style: TextStyle(fontSize: 20),
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: refreshCharacters,
            child: ListView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                final character = characters[index];

                final int characterId = character["character_id"] ?? 0;
                final String characterName =
                    character["character_name"] ?? "Unnamed Character";
                final xp = character["xp"] ?? 0;
                final alignment = character["alignment"] ?? "Unknown";
                final className = character["class_name"] ?? "No class";
                final level = character["level"] ?? "?";
                final raceName = character["race_name"] ?? "No race";

                return Card(
                  child: ListTile(
                    title: Text(characterName),
                    subtitle: Text(
                      "Level $level $raceName $className | XP: $xp | Alignment: $alignment",
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () {
                        deleteCharacter(characterId, characterName);
                      },
                    ),
                    onTap: () {
                      debugPrint("Selected character: $characterName");
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
