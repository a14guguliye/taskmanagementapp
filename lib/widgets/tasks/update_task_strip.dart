import 'package:flutter/material.dart';

class UpdateTaskStrip extends StatelessWidget {
  const UpdateTaskStrip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Update Reminder",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
            color: Color(0xFF242A3E)),
      ),
    );
  }
}
