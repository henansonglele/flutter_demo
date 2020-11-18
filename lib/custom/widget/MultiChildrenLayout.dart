import 'dart:math';

import 'package:flutter/cupertino.dart';

class GridLayout extends StatelessWidget {
  final List<Widget> children;
  final double horizontalSpace;
  final double verticalSpace;

  GridLayout(
      {@required this.children,
        @required this.horizontalSpace,
        @required this.verticalSpace});

  @override
  Widget build(BuildContext context) {
    List<Widget> layoutChildren = new List();
    for (int index = 0; index < children.length; index++) {
      layoutChildren.add(LayoutId(id: index, child: children[index]));
    }
    return CustomMultiChildLayout(
      delegate: GridLayoutDelegate(//真正的布局实现
        horizontalSpace: horizontalSpace,
        verticalSpace: verticalSpace,
      ),
      children: layoutChildren,
    );
  }
}

class GridLayoutDelegate extends MultiChildLayoutDelegate {
  final double horizontalSpace;
  final double verticalSpace;
  List<Size> _itemSizes = List();

  GridLayoutDelegate(
      {@required this.horizontalSpace, @required this.verticalSpace});

  @override
  void performLayout(Size size) {
    //对每个child进行逐一布局
    int index = 0;
    double width = (size.width - horizontalSpace) / 2;
    var itemConstraints = BoxConstraints(
        minWidth: width, maxWidth: width, maxHeight: size.height);

    while (hasChild(index)) {
      _itemSizes.add(layoutChild(index, itemConstraints));
      index++;
    }
    //对每一个child逐一进行定位
    index = 0;
    double dx = 0;
    double dy = 0;
    while (hasChild(index)) {
      positionChild(index, Offset(dx, dy));
      dx = index % 2 == 0 ? width + horizontalSpace : 0;
      if (index % 2 == 1) {
        double maxHeight =
        max(_itemSizes[index].height, _itemSizes[index - 1].height);
        dy += maxHeight + verticalSpace;
      }
      index++;
    }
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) {
    return oldDelegate != this;
  }

  //确定layout的size，constraints是parent传过来的约束
  @override
  Size getSize(BoxConstraints constraints) => super.getSize(constraints);
}