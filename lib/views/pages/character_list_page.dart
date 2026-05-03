import 'package:flutter/material.dart';
import 'package:dnd_companion_app/views/pages/character_home_page.dart';

class CharacterListPage extends StatelessWidget {
  const CharacterListPage({super.key});

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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CharacterHomePage();
                  },
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
