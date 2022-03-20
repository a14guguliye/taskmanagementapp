import 'package:flutter/material.dart';

class SigninForm extends StatefulWidget {
  ScrollController sc = ScrollController();
  SigninForm({Key? key}) : super(key: key);

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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

    String? _email;
    String? _password;
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Color(0xFFCADDFE)),
        child: Form(
          key: _formKey,
          child: DraggableScrollableSheet(
            initialChildSize: 0.1,
            minChildSize: 0.1,
            builder: (context, scrollC) => ListView(
              controller: scrollC,
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
                Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          label: Text("Password")),
                      onChanged: (val) {
                        _password = val;
                      },
                      obscureText: true,
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
                      onPressed: () {
                        _formKey.currentState?.reset();
                      },
                      child: const Text("SIGN IN"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
