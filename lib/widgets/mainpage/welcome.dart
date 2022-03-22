import 'package:flutter/material.dart';
import 'package:taskmanagementapp/services/firebase_auth.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      textBaseline: TextBaseline.ideographic,
      children: <Widget>[
        const Text(
          "Welcome, bro!",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        IconButton(
            onPressed: () async {
              await FireBaseAuthService().signmeOutFromApp();
            },
            icon: const Icon(Icons.outlet)),
        const FittedBox(
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
