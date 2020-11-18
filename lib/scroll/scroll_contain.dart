import 'package:flutter/material.dart';
import 'package:flutter_app_first/scroll/widget/custom_scroll_view.dart';
import 'package:flutter_app_first/scroll/widget/scrollBar.dart';
import 'package:flutter_app_first/scroll/widget/scrollable.dart';
import '../base_contain.dart';
class ScrollWidgetContain extends StatelessWidget {

  final List<Widget> barList = <Widget>[
    Tab(text: "原生滚动控件",),
    Tab(text: "滚动条",),
    Tab(text: "自定义滚动控件",),
  ];
  final String title = "滚动控件展示";
  final viewList = <Widget>[
    ScrollWidget(),
    ScrollBarView(),
    CustomScrollViewTestRoute()
  ];
  @override
  Widget build(BuildContext context) {
    return BaseContain(title, barList, viewList);
  }
}
