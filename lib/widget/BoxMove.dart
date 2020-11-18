
import 'package:flutter/material.dart';

/// p平移动画
class BoxMoveAnimation extends StatefulWidget {
  BoxMoveAnimation({Key key}) : super(key: key);

  BoxMoveAnimation.Has(Widget w){
    childw = w;
  }
  Widget childw ;
  @override
  _BoxMoveAnimationState createState() => _BoxMoveAnimationState.Has(childw);
}

class _BoxMoveAnimationState extends State<BoxMoveAnimation> with TickerProviderStateMixin {

  _BoxMoveAnimationState.Has(Widget w){
    childw = w;
  }
  Widget childw ;
  AnimationController controller;
  Animation<Offset> animation;

  int num = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
          Container(
            color: Colors.white,
              //SlideTransition 用于执行平移动画
              child: SlideTransition(
                position: animation,
                //将要执行动画的子view
                child: Container(
                  width: 200.0,
                  height: 200.0,
                  color: Colors.red,
                  child: Text("测试 更新ui"+num.toString()),
                ),
              ),
            ),

        RaisedButton(
          child: Container(width: 50,height: 50,color: Colors.greenAccent,),
          onPressed: (){
            num++;

            setState(() {

            });
          },
        )

      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 1000), vsync: this);
    controller.addStatusListener((status) {
    });
    animation =
        Tween(begin: Offset(0.0,1.0), end: Offset(0.0, 0.0)).animate(controller);
    //开始执行动画
    controller.forward();
  }
}