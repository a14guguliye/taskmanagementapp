import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskmanagementapp/widgets/sign_in_form.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  double signinScreenHeight = 0;
  ScrollController scrollController = ScrollController();

  void changeHeight() {
    setState(() {
      print("I am moving up or down");
      if (signinScreenHeight != 0) {
        signinScreenHeight = 0;
      } else {
        signinScreenHeight = 300;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ScrollController sc = ScrollController();
    DraggableScrollableController sd = DraggableScrollableController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/images/signinimage.jpg'),
              const SizedBox(height: 10),
              Text(
                "Welcome to Task Management App",
                style: GoogleFonts.lato(
                  letterSpacing: 1,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SigninForm(),
            ],
          ),
        ),
      ),
    );
  }
}
