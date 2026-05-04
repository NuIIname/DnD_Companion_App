//WIP might not need until later
import 'package:flutter/material.dart';
import 'package:dnd_companion_app/views/pages/main_menu_page.dart';
import 'package:dnd_companion_app/views/pages/character_list_page.dart';

List<Widget> pages = [MainMenuPage(), CharacterListPage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
