import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  final Color color;
  final int flexSize;
  final Widget cardChild;
  final Function cardFunction;

  ReuseableCard({this.color, this.flexSize, this.cardChild, this.cardFunction});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flexSize,
      child: Padding(
        padding: EdgeInsets.all(3.0),
        child: GestureDetector(
          onTap: cardFunction,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: color,
            ),
            child: cardChild,
          ),
        ),
      ),
    );
  }
}
