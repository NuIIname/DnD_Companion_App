import 'package:flutter/material.dart';

class CharacterClassPage extends StatelessWidget {
  const CharacterClassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Character Class")),
      body: const Center(
        child: Text("Character Class Page", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
