import 'package:flutter/material.dart';

class MagicLinkSent extends StatelessWidget {
  final Function resetEmailState;

  MagicLinkSent({Key? key, required this.resetEmailState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (layout, constraints) => Column(
        children: [
          ConstrainedBox(
              constraints: BoxConstraints(maxHeight: constraints.maxHeight / 2),
              child: Image.asset('assets/images/waiting.gif')),

          ////taking some breathing room
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Please check email",
            style: TextStyle(color: Color(0xFFfc4c00), fontSize: 25),
          ),

          ////taking some breathing room

          const SizedBox(
            height: 15,
          ),
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            width: constraints.maxWidth / 4,
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xFF9b00fc))),
              onPressed: () {
                resetEmailState();
              },
              child: const Text(
                "Sign in",
                style: TextStyle(fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
