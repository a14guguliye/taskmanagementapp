import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: ((context, constraints) {
        return Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ////success title on the image
              const Text(
                "SUCCESS",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              ///taking some breathing room
              const SizedBox(
                height: 30,
              ),

              ///putting the image of success
              Image.asset('assets/images/success.jpg'),

              ///taking some breathing rom
              const SizedBox(
                height: 30,
              ),

              SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Home Screen",
                        style: TextStyle(fontSize: 15),
                      )))
            ],
          ),
        );
      })),
    );
  }
}
