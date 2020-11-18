import 'package:flutter/material.dart';

class BaseDialog extends Dialog {
  //子控件
  final Widget widget;

  // 高
  final double height;

  //宽
  final double width;

  BaseDialog(this.widget, this.height, this.width, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.bottomCenter,
      child: Padding(
          padding: const EdgeInsets.only(left:0.0),
          child: new Material(
            type: MaterialType.transparency,
            child: new Container(
              alignment: Alignment.center,
                height: this.height,
                width: this.width,
                decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),topRight: Radius.circular(25.0),
                          bottomLeft: Radius.circular(25.0),bottomRight: Radius.circular(25.0),
                        ))),
                child: this.widget),
          )),
    );
  }
}