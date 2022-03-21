import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      textBaseline: TextBaseline.ideographic,
      children: const <Widget>[
        Text(
          "Welcome, bro!",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        FittedBox(
          fit: BoxFit.cover,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Color(0xFFff59a9),
            foregroundColor: Colors.white,
            child: Text(
              "GG",
              style: TextStyle(fontSize: 20),
            ),
          ),
        )
      ],
    );
  }
}
