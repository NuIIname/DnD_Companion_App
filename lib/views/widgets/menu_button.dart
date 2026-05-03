import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String title;
  const MenuButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Theme.of(context).colorScheme.outline),
        ),
      ),
      child: Center(child: Text(title, style: TextStyle(fontSize: 28))),
    );
  }
}
