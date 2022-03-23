import 'package:flutter/material.dart';

class NewTaskStrip extends StatelessWidget {
  const NewTaskStrip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "New Reminder",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
            color: Color(0xFF242A3E)),
      ),
    );
  }
}
