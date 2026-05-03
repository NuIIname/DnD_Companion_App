import 'package:dnd_companion_app/data/notifiers.dart';
import 'package:flutter/material.dart';
import 'package:dnd_companion_app/views/widgets/menu_button.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ValueListenableBuilder(
            valueListenable: isDarkModeNotifier,
            builder: (context, isDarkMode, child) {
              return IconButton(
                onPressed: () {
                  isDarkModeNotifier.value = !isDarkModeNotifier.value;
                },
                icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: 320,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.outline),
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MenuButton(title: "Characters"),
              MenuButton(title: "Creatures"),
              MenuButton(title: "Classes"),
              MenuButton(title: "Feats"),
              MenuButton(title: "Backgrounds"),
              MenuButton(title: "Spells"),
              MenuButton(title: "Items"),
            ],
          ),
        ),
      ),
    );
  }
}
