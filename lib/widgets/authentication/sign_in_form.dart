import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:taskmanagementapp/services/firebase_auth.dart';

class SigninForm extends StatefulWidget {
  final Function resetEmailState;
  const SigninForm({Key? key, required this.resetEmailState}) : super(key: key);
  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  final _formKey = GlobalKey<FormState>();
  FireBaseAuthService authService = FireBaseAuthService();

  @override
  Widget build(BuildContext context) {
    String? _email;
    FirebaseDynamicLinks.instance.onLink.listen((event) async {
      if (FirebaseAuth.instance.isSignInWithEmailLink(event.link.toString())) {
        await FirebaseAuth.instance
            .signInWithEmailLink(
                email: _email!, emailLink: event.link.toString())
            .catchError((error) => print(error));
      }
    });

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return const Color(0xFF5379F8);
    }

    return Form(
      key: _formKey,
      child: ListView(
        children: [
          Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextFormField(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  label: Text("Email"),
                ),
                onChanged: (val) {
                  _email = val;
                },
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => getColor(states)),
                ),
                onPressed: () async {
                  if (_email != null) {
                    await authService.sendEmailLink(_email!);

                    widget.resetEmailState();
                  }
                },
                child: const Text("SIGN IN"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}