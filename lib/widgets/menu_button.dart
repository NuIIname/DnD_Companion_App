import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String title;
  const MenuButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black)),
      ),
      child: Center(child: Text(title, style: TextStyle(fontSize: 28))),
    );
  }
}
