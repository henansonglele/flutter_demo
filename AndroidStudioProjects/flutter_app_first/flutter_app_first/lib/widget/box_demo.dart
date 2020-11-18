import 'package:flutter/material.dart';
/*
* 一个带渐变颜色的正方形
* */
class Box extends StatelessWidget {
  String index;
  double boxSize=100;

  Box(String index) {
    this.index = index;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: boxSize,
      height: boxSize,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.orangeAccent, Colors.orange, Colors.deepOrange]),
      ),
      child: Text(
        index,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
