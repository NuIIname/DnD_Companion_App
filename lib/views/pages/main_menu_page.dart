import 'package:dnd_companion_app/data/notifiers.dart';
import 'package:flutter/material.dart';
import 'package:dnd_companion_app/views/widgets/menu_button.dart';
import 'package:dnd_companion_app/views/pages/character_list_page.dart';

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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MenuButton(
                title: "Characters",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CharacterListPage();
                      },
                    ),
                  );
                },
              ),
              const MenuButton(title: "Creatures"),
              const MenuButton(title: "Classes"),
              const MenuButton(title: "Feats"),
              const MenuButton(title: "Backgrounds"),
              const MenuButton(title: "Spells"),
              const MenuButton(title: "Items"),
            ],
          ),
        ),
      ),
    );
  }
}
