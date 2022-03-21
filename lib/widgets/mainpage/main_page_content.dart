import 'package:flutter/material.dart';
import 'package:taskmanagementapp/widgets/mainpage/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainPageContet extends StatefulWidget {
  const MainPageContet({Key? key}) : super(key: key);

  @override
  State<MainPageContet> createState() => _MainPageContetState();
}

class _MainPageContetState extends State<MainPageContet> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () async {
      print("I am signedout");
      await FirebaseAuth.instance.signOut();
    });
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green, width: 5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ////below widget holds the reference to the welcoming text + profile icon
            ///it is called welcome.dart
            const WelcomeText(),

            ////greeting widget
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Hello, John!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "You are here to create and build",
                  style: TextStyle(fontSize: 15, color: Color(0xFF747E8C)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
