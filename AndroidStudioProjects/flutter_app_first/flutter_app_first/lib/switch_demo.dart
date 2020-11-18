import 'package:flutter/material.dart';

class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  @override
  _SwitchAndCheckBoxTestRouteState createState() =>
      new _SwitchAndCheckBoxTestRouteState();
}

class _SwitchAndCheckBoxTestRouteState
    extends State<SwitchAndCheckBoxTestRoute> {
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
      appBar: new AppBar(
        title: const Text('AppBar Bottom Widget'),
        leading: new IconButton(
          tooltip: 'Previous choice',
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: <Widget>[
          new IconButton(
            icon: const Icon(Icons.arrow_forward),
            tooltip: 'Next choice',
            onPressed: () {},
          ),
        ],
      ),
      body: new Column(
        children: <Widget>[
         new Center(
           child:
           Switch(
             value: _switchSelected, //当前状态
             onChanged: (value) {
               //重新构建页面
               setState(() {
                 _switchSelected = value;
               });
             },
           ),
         )
          ,
          new Center(child:
            Checkbox(
            value: _checkboxSelected,
            activeColor: Colors.red, //选中时的颜色
            onChanged: (value) {
              setState(() {
                _checkboxSelected = value;
              });
            },
          )
            ,)

        ],
      ),
    ));
  }
}
