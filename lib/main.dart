import 'package:flutter/material.dart';
import 'package:dnd_companion_app/data/notifiers.dart';
import 'package:dnd_companion_app/views/pages/main_menu_page.dart';

void main() {
  runApp(const DnDApp());
}

class DnDApp extends StatelessWidget {
  const DnDApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.purple,
              brightness: Brightness.light,
            ),
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.purple,
              brightness: Brightness.dark,
            ),
          ),
          home: const MainMenuPage(),
        );
      },
    );
  }
}
