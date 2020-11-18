import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WillPopScopeTestRoute extends StatefulWidget {
  @override
  WillPopScopeTestRouteState createState() {
    return new WillPopScopeTestRouteState();
  }
}

class WillPopScopeTestRouteState extends State<WillPopScopeTestRoute> {
  DateTime _lastPressedAt; //上次点击时间

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async {
          if (_lastPressedAt == null ||
              DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
            //两次点击间隔超过1秒则重新计时
            _lastPressedAt = DateTime.now();
            return false;
          }

          Fluttertoast.showToast(msg:  "双击退市");
          return true;
        },
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          child: Text("1秒内连续按两次物理返回键退出",style: TextStyle(
            fontSize: 20,
          ),),
        )
    );
  }
}