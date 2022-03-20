import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  TestScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 3, color: Colors.red)),
        child: Form(
          key: _formKey,
          child: Column(children: [TextFormField()]),
        ),
      ),
    );
  }
}
