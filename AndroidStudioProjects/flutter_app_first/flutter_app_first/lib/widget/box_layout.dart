
import 'package:flutter/material.dart';

import 'box_demo.dart';
//import 'widget/box_demo.dart';


//MainAxisAlignment（主轴）就是与当前控件方向一致的轴，而CrossAxisAlignment（交叉轴）就是与当前控件方向垂直的轴
//在水平方向控件中，例如Row
//MainAxisAlignment是水平的，默认起始位置在左边，排列方向为从左至右，此时可以通过textDirection来改变MainAxisAlignment的起始位置和排列方向
//CrossAxisAlignment是垂直的，默认起始位置在中间，排列方向为从上至下，此时可以通过verticalDirection来改变CrossAxisAlignment的起始位置及排列方向
//在垂直方向的控件中，例如Column
//MainAxisAlignment是垂直的，默认起始位置在上边，排列方向为从上至下，此时可以通过verticalDirection来改变MainAxisAlignment的起始位置及排列方向
//CrossAxisAlignment是水平的，默认起始位置在中间，此时可以通过textDirection来改变CrossAxisAlignment的起始位置

/*enum MainAxisAlignment {
  //将子控件放在主轴的开始位置
  start,
  //将子控件放在主轴的结束位置
  end,
  //将子控件放在主轴的中间位置
  center,
  //将主轴空白位置进行均分，排列子元素，手尾没有空隙
  spaceBetween,
  //将主轴空白区域均分，使中间各个子控件间距相等，首尾子控件间距为中间子控件间距的一半
  spaceAround,
  //将主轴空白区域均分，使各个子控件间距相等
  spaceEvenly,
}*/

/*前面我们已经说了，在Row（水平排列）控件中，CrossAxisAlignment的方向就是垂直的，在 Column（垂直排列）控件中，CrossAxisAlignment的方向就是水平的。

enum CrossAxisAlignment {
  //将子控件放在交叉轴的起始位置
  start,

  //将子控件放在交叉轴的结束位置
  end,

  //将子控件放在交叉轴的中间位置
  center,

//使子控件填满交叉轴
  stretch,

//将子控件放在交叉轴的上，并且与基线相匹配（不常用）
  baseline,
}*/


class BoxLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      height: 500,
      margin: EdgeInsets.all(10),

      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
//      child: Row(
////       textDirection: TextDirection.rtl,
//        textDirection: TextDirection.rtl,
//
////        mainAxisAlignment: MainAxisAlignment.center,
////        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        mainAxisAlignment: MainAxisAlignment.spaceAround,
//
//        children: <Widget>[
//          Box("1"),
//          Box("2"),
//          Box("3"),
//        ],
//      ),

        child: Column(
//          mainAxisAlignment: MainAxisAlignment.start,
//          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceAround,

//          crossAxisAlignment: CrossAxisAlignment.start,
//          crossAxisAlignment: CrossAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,



//          verticalDirection: VerticalDirection.up,
          verticalDirection: VerticalDirection.down,


          children: <Widget>[
            Box("1"),
            Box("2"),
            Box("3"),
          ],
        ),



    );

  }

}
