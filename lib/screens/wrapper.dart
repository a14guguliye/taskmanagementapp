import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taskmanagementapp/screens/mainpage.dart';
import 'package:taskmanagementapp/screens/sign_in.dart';

////wrapper widget, it is very simple stateless widget which either
///opens the sign in page, or home page, depending on the state
class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ////here i have stream builder, which sits and listens to the user changes
    ///when the user sign in/out the widget tree is rebuilt from very top
    ///It basically returns two widgets, Sign in widget if the user is unauthenticated
    ///or MainPage where i see my tasks if the authentication process is completed successfully
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (context, snapshot) {
          ////sit and listen, if data is null, back to SignIn
          if (snapshot.data == null) {
            return const SignIn();
          } else {
            ///if not, open the MainPage
            return const MainPage();
          }
        });
  }
}
