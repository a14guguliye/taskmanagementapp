import 'package:flutter/material.dart';
import 'package:taskmanagementapp/shared/shared.dart';
import 'package:taskmanagementapp/models/user.dart';
import 'package:taskmanagementapp/services/firebase_store.dart';
import 'package:taskmanagementapp/services/firebase_auth.dart';

class Motivation extends StatefulWidget {
  const Motivation({Key? key}) : super(key: key);

  @override
  State<Motivation> createState() => _MotivationState();
}

class _MotivationState extends State<Motivation> {
  FireStoreDatabase fr = FireStoreDatabase();
  FireBaseAuthService fs = FireBaseAuthService();
  Users? currentUser;

  @override
  Widget build(BuildContext context) {
    fr.getMeCurrentUser(fs.getMeCurrentUserUid).then((currentUserObtained) {
      setState(() {
        currentUser = currentUserObtained;
      });
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 5,
        ),
        Text(
          "Hello,"
          "${SharedDetails.capitalize(currentUser?.name.toString()) ?? "loading"}",
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          "You are here to create and build",
          style: TextStyle(fontSize: 15, color: Color(0xFF747E8C)),
        )
      ],
    );
  }
}
