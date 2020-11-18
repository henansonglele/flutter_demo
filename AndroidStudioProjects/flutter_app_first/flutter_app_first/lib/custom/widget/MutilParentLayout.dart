import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MultiChildrenLayout.dart';

class MultiParentLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: GridLayout(
        horizontalSpace:20,
        verticalSpace:40,
        children: <Widget>[
          Container(
            color: Colors.blue,
            width: 100,
            height: 100,
          ),
          Container(
            color: Colors.red,
            width: 100,
            height: 100,
          ),
          Container(
            color: Colors.green,
            width: 100,
            height: 100,
          ),
          Container(
            color: Colors.amber,
            width: 100,
            height: 100,
          )
        ],
      ),
    );
  }
}