import 'package:flutter/material.dart';
import 'package:flutter_app_first/custom/widget/SInglChildLayout.dart';
import 'package:flutter_app_first/custom/widget/custom.dart';
import 'package:flutter_app_first/custom/widget/customPainterWidget.dart';
import 'package:flutter_app_first/custom/widget/Multilayout.dart';
import 'package:flutter_app_first/custom/widget/layout_with_multi_widget.dart';

import '../base_contain.dart';
import 'widget/MutilParentLayout.dart';




class CustomContain extends StatelessWidget {
  final List<Widget> barList = <Widget>[
    Tab(text: "customPainter",),
    Tab(text: "singleWidget",),
    Tab(text: "multiWidget",),

    Tab(text: "六芒星实现",),
    Tab(text: "六芒星基础实现",),
    Tab(text: "布局封装控件实现"),
  ];
  final title = "自定义控件";
  final viewList = <Widget>[
    CustomView2(),
    SingleDemoLayout(),
    MultiParentLayout(),
    MyMultiLayout(),
    CustomView(),
    LayoutWidget(),

  ];

  @override
  Widget build(BuildContext context) {
    return BaseContain(title, barList, viewList);
  }
}