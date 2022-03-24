import 'package:flutter/material.dart';

class BottomStrip extends StatefulWidget {
  final Function({required int tappedBottomButton}) updateStateofParent;
  final int tappedBottomIndex;
  const BottomStrip(
      {Key? key,
      required this.updateStateofParent,
      required this.tappedBottomIndex})
      : super(key: key);

  @override
  State<BottomStrip> createState() => _BottomStripState();
}

class _BottomStripState extends State<BottomStrip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Color(0xFFEBF3FF),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.tappedBottomIndex == 0
              ? const SizedBox(
                  width: 30,
                )
              : const SizedBox(
                  width: 0,
                ),
          Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: IconButton(
                  color: Colors.red,
                  onPressed: () {
                    ////0 means home buttons has been pressed
                    widget.updateStateofParent(tappedBottomButton: 0);
                  },
                  icon: const Icon(
                    Icons.home,
                    size: 32,
                    color: Color(0xFFFF4500),
                  ))),
          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: IconButton(
                  onPressed: () {
                    ////1  means notification has been pressed
                    widget.updateStateofParent(tappedBottomButton: 1);
                  },
                  icon: const Icon(
                    Icons.notifications,
                    size: 32,
                    color: Color(0xFFFF4500),
                  ))),
          widget.tappedBottomIndex == 1
              ? const SizedBox(
                  width: 30,
                )
              : const SizedBox(
                  width: 0,
                ),
        ],
      ),
    );
  }
}
