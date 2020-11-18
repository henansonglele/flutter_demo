import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleDemoLayout extends StatelessWidget {


  SingleDemoLayout();

  @override
  Widget build(BuildContext context) {
    return RectLayout(
      child: Container(
        width: 100,
          height: 100,
        color: Colors.redAccent,
      ),

    );
  }
}
class RectLayout extends StatelessWidget {
  final Widget child;

  RectLayout({@required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomSingleChildLayout(
      delegate: RectLayoutDelegate(),//进行布局的代理
      child: child,
    );
  }
}

class RectLayoutDelegate extends SingleChildLayoutDelegate {
  //确定layout的size，constraints是parent传过来的约束
  @override
  Size getSize(BoxConstraints constraints) => super.getSize(constraints);

  ///是否需要relayout
  @override
  bool shouldRelayout(SingleChildLayoutDelegate oldDelegate) => false;

  ///确定child的位置，返回一个相对于parent的偏移值，size是layout的大小，由getsize确定，childSize由getConstraintsForChild得出的Constraints对child进行约束，得到child自身的size
  @override
  Offset getPositionForChild(Size size, Size childSize) {
    double dx = (size.width - childSize.width) / 2;
    double dy = (size.height - childSize.height) / 2;
    return Offset(dx, dy);
  }

  ///确定child的约束，用于确定child的大小
  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {//
    double maxEdge = min(constraints.maxWidth, constraints.maxHeight);
    return BoxConstraints(maxWidth: maxEdge, maxHeight: maxEdge);
  }
}