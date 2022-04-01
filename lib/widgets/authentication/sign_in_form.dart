import 'package:flutter/material.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:taskmanagementapp/services/firebase_auth.dart';

final _formKey = GlobalKey<FormState>();

class SigninForm extends StatelessWidget {
  final Function resetEmailState;
  const SigninForm({Key? key, required this.resetEmailState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FireBaseAuthService authService = FireBaseAuthService();

    String? _email;

    ////once link has been received sign the user in.
    FirebaseDynamicLinks.instance.onLink.listen((event) async {
      ////the function will be called to sign the user in once we received the link
      authService.signInWithEmailLink(event.link.toString(), _email!);
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
                  ///button background color changes with the
                  ///different states of button
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => getColor(states)),
                ),
                onPressed: () async {
                  if (_email != null) {
                    ////send me email to log in
                    await authService.sendEmailLink(_email!);
                    ////showing waiting fish on the screen
                    resetEmailState();
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
