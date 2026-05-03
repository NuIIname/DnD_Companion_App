import 'package:flutter/material.dart';
import '../widgets/menu_button.dart';

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 320,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
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
