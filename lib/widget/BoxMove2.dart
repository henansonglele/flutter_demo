import 'package:flutter/material.dart';

class BoxMoveAnimation2 extends StatefulWidget {
  BoxMoveAnimation2({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _BoxMoveAnimationState createState() => _BoxMoveAnimationState();
}

class _BoxMoveAnimationState extends State<BoxMoveAnimation2> with TickerProviderStateMixin {

  AnimationController controller;
  Animation<Offset> animation;

  @override
  Widget build(BuildContext context) {
    return Container(
        //SlideTransition 用于执行平移动画
        child: SlideTransition(
          position: animation,
          //将要执行动画的子view
          child: Container(
            width: 200,
            height: 200,
//            color: Colors.red,

            child: Container(

              width: 40,height: 40,color: Colors.greenAccent,
            ),
          ),
        ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 2000), vsync: this);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //AnimationStatus.completed 动画在结束时停止的状态
        debugPrint('完成');
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //AnimationStatus.dismissed 表示动画在开始时就停止的状态
        debugPrint('消失');
        controller.forward();
//        controller.dispose();
      }
    });
    animation =
        Tween(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0)).animate(controller);
    //开始执行动画
    controller.forward();
  }
}