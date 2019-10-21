import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(new PageViewDemo());
}

class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

/// An indicator showing the currently selected page of a PageController
class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color: Colors.white,
  }) : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 8.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 2.0;

  // The distance between the center of each dot
  static const double _kDotSpacing = 25.0;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return new Container(
      width: _kDotSpacing,
      child: new Center(
        child: new Material(
          color: color,
          type: MaterialType.circle,
          child: new Container(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            child: new InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State createState() => new MyHomePageState();
}

class MyPageControler extends PageController {

}

class MyHomePageState extends State<MyHomePage> {

  final _controller = new PageController(
//  initialPage: 1, //默认显示第几个页面（默认0）
//  keepPage: false, //设置为true  initialPage才生效（默认true）
//  viewportFraction: 1.0 //默认1，每个页面占可视窗的比例
  initialPage:0,
      keepPage: true,
      viewportFraction: 0.8);

  static const _kDuration = const Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  final _kArrowColor = Colors.black.withOpacity(0.8);

  final List<Widget> _pages = <Widget>[
    new Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: new Center(child:
        new Text("page 1",style : new TextStyle(
          fontSize:20,
          color: Colors.black,
        )),
        )
    ),
    new ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: new FlutterLogo(colors: Colors.blue),
    ),
    new Container(
        color: Colors.black,
        child: new Center(child:
        new Text("page 3",style : new TextStyle(
          fontSize:20,
          color: Colors.white,
        )),
        )
    ),
    new ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: new FlutterLogo(style: FlutterLogoStyle.stacked, colors: Colors.red),
    ),
    new Container(
        color: Colors.black,
        child: new Center(child:
        new Text("page 5",style : new TextStyle(
          fontSize:20,
          color: Colors.white,
        )),
        )
    ),
    new ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: new FlutterLogo(style: FlutterLogoStyle.horizontal, colors: Colors.green),
    ),
    new Container(
        color: Colors.black,
        child: new Center(child:
        new Text("page end",style : new TextStyle(
          fontSize:20,
          color: Colors.white,
        )),
        )
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blue[100],
      body: new IconTheme(
        data: new IconThemeData(color: _kArrowColor),
        child: new Stack(
          children: <Widget>[
            new PageView.builder(
              physics: new AlwaysScrollableScrollPhysics(),
              controller: _controller,
              pageSnapping: false, //默认true，即拖动不到一半弹回原页面;flase即，拖到哪里停在哪
              scrollDirection: Axis.horizontal, //垂直切换还是水平切换（默认水平，Android原生ViewPage要费很大劲才能实现）
              reverse: false, //倒置，设置true页面顺序从后往前，默认false
              itemCount: _pages.length, //item 数量   不设置 默认无限循环。
              onPageChanged: (current){//onPageChanged 监听页面改变，输出当前页面序号
                print("选择item ：$current");
              },
              itemBuilder: (BuildContext context, int index) {//展示具体的Widget
                return _pages[index % _pages.length];
              },
            ),

            new Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: new Container(
                color: Colors.grey[800].withOpacity(0.5),
                padding: const EdgeInsets.all(20.0),
                child: new Center(
                  child: new DotsIndicator(
                    controller: _controller,
                    itemCount: _pages.length,
                    onPageSelected: (int page) {
                      _controller.animateToPage(
                        page,
                        duration: _kDuration,
                        curve: _kCurve,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}