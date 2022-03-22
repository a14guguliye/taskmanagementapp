import 'package:flutter/material.dart';
import 'package:taskmanagementapp/widgets/mainpage/main_page_content.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    print("Width");
    print(MediaQuery.of(context).size.width);
    print("Height");
    print(MediaQuery.of(context).size.height);
    return LayoutBuilder(builder: (context, constraints) {
      return SafeArea(
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Container(
            decoration: const BoxDecoration(shape: BoxShape.circle, boxShadow: [
              BoxShadow(
                color: Color(0xFFEAF2FF),
                spreadRadius: 4,
                blurRadius: 4,
                offset: Offset(0, 0),
              ),
            ]),
            width: 65,
            height: 65,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFF122ADC),
              onPressed: () {},
              child: const Icon(
                Icons.add,
                size: 34,
              ),
            ),
          ),
          body: Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.red,
              width: 1,
            )),
            child: MainPageContent(),
          ),
        ),
      );
    });
  }
}
