import 'package:flutter/material.dart';

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

  Color activeBacground = const Color(0xFFFF4500);
  Color activeTextColor = const Color(0xFF060506);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xFFEBF3FF),
            spreadRadius: 3,
            blurRadius: 3,
            offset: Offset(0, 4.75), // changes position of shadow
          ),
        ],
      ),
      child: LimitedBox(
        maxHeight: 68,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            clipBehavior: Clip.antiAliasWithSaveLayer,
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
                          color: activeBacground)
                      : inactiveCategoryDecoration,
                  child: Center(
                    child: Text(
                      "All",
                      style: _activeIndex == 0
                          ? categoriesStyle.copyWith(color: activeTextColor)
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
                          color: activeBacground)
                      : inactiveCategoryDecoration,
                  child: Center(
                    child: Text(
                      "MRO",
                      style: _activeIndex == 1
                          ? categoriesStyle.copyWith(color: activeTextColor)
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
                          color: activeBacground)
                      : inactiveCategoryDecoration,
                  child: Center(
                    child: Text(
                      "Project",
                      style: _activeIndex == 2
                          ? categoriesStyle.copyWith(color: activeTextColor)
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
                          color: activeBacground)
                      : inactiveCategoryDecoration,
                  child: Center(
                    child: Text(
                      "Leads",
                      style: _activeIndex == 3
                          ? categoriesStyle.copyWith(color: activeTextColor)
                          : categoriesStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
