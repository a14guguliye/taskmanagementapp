import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Categories extends StatefulWidget {
  final Function notifyCategory;
  const Categories({Key? key, required this.notifyCategory}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  TextStyle categoriesStyle =
      const TextStyle(fontSize: 15, fontWeight: FontWeight.bold);

  int _activeIndex = 0;

  BoxDecoration inactiveCategoryDecoration = const BoxDecoration(
    color: Color(0xFFEBF3FF),
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ///all
          GestureDetector(
            onTap: () {
              setState(() {
                _activeIndex = 0;
                widget.notifyCategory(_activeIndex);
              });
            },
            child: Container(
              width: 72,
              decoration: _activeIndex == 0
                  ? inactiveCategoryDecoration.copyWith(
                      color: Color(0xFF5500c2))
                  : inactiveCategoryDecoration,
              child: Center(
                child: Text(
                  "All",
                  style: _activeIndex == 0
                      ? categoriesStyle.copyWith(color: Color(0xFFFB8500))
                      : categoriesStyle,
                ),
              ),
            ),
          ),

          ////taking some breathing room
          const SizedBox(
            width: 24,
          ),

          ///MRO
          GestureDetector(
            onTap: () {
              setState(() {
                _activeIndex = 1;
                widget.notifyCategory(_activeIndex);
              });
            },
            child: Container(
              width: 72,
              decoration: _activeIndex == 1
                  ? inactiveCategoryDecoration.copyWith(
                      color: Color(0xFF5500c2))
                  : inactiveCategoryDecoration,
              child: Center(
                child: Text(
                  "MRO",
                  style: _activeIndex == 1
                      ? categoriesStyle.copyWith(color: Color(0xFFC28b00))
                      : categoriesStyle,
                ),
              ),
            ),
          ),

          const SizedBox(
            width: 24,
          ),

          ///project
          GestureDetector(
            onTap: () {
              setState(() {
                _activeIndex = 2;
                widget.notifyCategory(_activeIndex);
              });
            },
            child: Container(
              width: 72,
              decoration: _activeIndex == 2
                  ? inactiveCategoryDecoration.copyWith(
                      color: Color(0xFF5500c2))
                  : inactiveCategoryDecoration,
              child: Center(
                child: Text(
                  "Project",
                  style: _activeIndex == 2
                      ? categoriesStyle.copyWith(color: Color(0xFFC28b00))
                      : categoriesStyle,
                ),
              ),
            ),
          ),

          const SizedBox(
            width: 24,
          ),

          ///NCR
          GestureDetector(
            onTap: () {
              setState(() {
                _activeIndex = 3;
                widget.notifyCategory(_activeIndex);
              });
            },
            child: Container(
              width: 72,
              decoration: _activeIndex == 3
                  ? inactiveCategoryDecoration.copyWith(
                      color: Color(0xFF5500c2))
                  : inactiveCategoryDecoration,
              child: Center(
                child: Text(
                  "Leads",
                  style: _activeIndex == 3
                      ? categoriesStyle.copyWith(color: Color(0xFFC28b00))
                      : categoriesStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}