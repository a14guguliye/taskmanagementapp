import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskmanagementapp/widgets/authentication/magic_link_sent.dart';
import 'package:taskmanagementapp/widgets/authentication/sign_in_form.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  double signinScreenHeight = 0;
  bool emailSent = false;

  void wasEmailSent() {
    setState(() {
      emailSent = !emailSent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final widthS = constraints.maxWidth;
          final heightS = constraints.maxHeight;

          return Container(
            width: widthS,
            height: heightS,
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ////image widget on the main screen
                ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: heightS / 1.8,
                    ),
                    child: Image.asset('assets/images/signinimage.jpg')),

                ////taking some breathing room
                const SizedBox(height: 10),

                ///text widget on the screen
                Text(
                  "Welcome to Task Management App",
                  style: GoogleFonts.lato(
                    letterSpacing: 1,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                ///taking some breathing room
                const SizedBox(
                  height: 10,
                ),

                ////signin form widget. it may display 2 widgets, either signin fomr
                ///or email sent widget
                Expanded(
                  child: Container(
                    width: widthS,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        color: Color(0xFF00c2fc)),
                    child: emailSent == false
                        ? SigninForm(resetEmailState: wasEmailSent)
                        : MagicLinkSent(
                            resetEmailState: wasEmailSent), /*SigninForm()*/
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
