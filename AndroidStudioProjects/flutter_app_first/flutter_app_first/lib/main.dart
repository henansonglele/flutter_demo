import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_first/pageview_demo.dart';
import 'package:flutter_app_first/scollview_widget.dart';
import 'package:flutter_app_first/scroll/scroll_contain.dart';
import 'package:flutter_app_first/special/spe_contain.dart';
//import 'package:flutter_app_first/scroll/ani_contain.dart';
//import 'package:flutter_app_first/special/ani_contain.dart';
import 'package:flutter_app_first/switch_demo.dart';
import 'package:flutter_app_first/widget/box_layout.dart';
import 'package:flutter_app_first/widget/gesture_demo.dart';

import 'widget/BoxMove.dart';
import 'widget/BoxMove2.dart';
import 'widget/CustomPaintRoute.dart';
import 'widget/ExpansionTileSample.dart';
//import 'animator/ani_contain.dart';
//import 'animator/ani_contain.dart';
import 'animator/ani_contain.dart';
import 'widget/box_demo.dart';
//import 'box_layout.dart';
//import 'custom/ani_contain.dart';
import 'custom/custom_contain.dart';
import 'data_modle/TestModel.dart';
import 'dialog/demo1.dart';
//import 'dialog.dart';
import 'dialog/dialog.dart';
import 'widget/listview.dart';
import 'widget/gridview.dart';
//import 'gesture_demo.dart';
import 'slide_remove_item.dart';
import 'back_lastpage_demo.dart';
import 'animated_list_demo.dart';
import 'widget/bottom_tabbar_demo.dart';

import 'testStream.dart';
import 'widget/doublekill.dart';
import 'dialog/testDialog.dart';
import 'TestStreamBuilder.dart';
import '_LifecyclePageFullState.dart';
//import 'package:connectivity/connectivity.dart';


//Dart运行环境中靠事件驱动，通过event loop从队列中获取消息。
// 在一个isolate(隔离)中有两个队列，event queue和microtask queue
// dart 是单线程，每个app都是在一个隔离中运行的，不同隔离通信是通过隔离的api实现的。

//void main() => runApp(MyApp());

bool _checkboxSelected = true;
bool _switchSelected = true;

void maintest() {
  slideremove_main();


//  TestModel testModel = new TestModel();
//  gesture_main();
//  gridview_main();
//  mainlist();
}


void main() {
  runApp(new MaterialApp(

    onGenerateTitle: (_){
      return "Navigation titile\n title";
    },
    title: 'Navigation Basics',
    home: new FirstScreen(),
  ));
  testdate();

  testAsync();
  print("异步 测试");

  testEventTask();

//  print("测试联网：" +_isNetWorkAvailable().toString());
 _streamlisten();

}

///2019.4.18 By GX
///判断网络是否可用
///0 - none | 1 - mobile | 2 - WIFI
//Future<int> _isNetWorkAvailable() async{
//  var connectivityResult = await (new Connectivity().checkConnectivity());
//
//  if (connectivityResult == ConnectivityResult.mobile)
//    return 1;
//  else if (connectivityResult == ConnectivityResult.wifi)
//    return 2;
//  else if (connectivityResult == ConnectivityResult.none)
//    return 0;
//}

greetBob(Person person) => person.greet('bob');
void testdate() {
  print(DateTime.now());
  var _nowDate = DateTime.now().millisecondsSinceEpoch;
  var d = DateTime.fromMillisecondsSinceEpoch(_nowDate);
  print(d.year);
  print(d.month);
  print(d.day);
  print(d.hour);
  print(d.second);

  print(greetBob(new Person('kathy')));
  print(greetBob(new Imposter()));





//   DateTime t = DateTime(1111);

// var d =  DateTime.parse("yy-mm-dd");
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//        appBar: new AppBar(
//          title: new Text('First Screen'),
//        ),
    appBar: AppBar(
      title: Center(child: Text("demo",style: TextStyle(fontSize: 20,color: Colors.redAccent) ),),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: (){
          Navigator.of(context).pop();
        },
      ),
    ),
        body: SingleChildScrollView(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Center(
                child: new RaisedButton(
                  child: new Text('Launch slide_remove screen'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new MyApp_Slide(
                                items: new List<String>.generate(
                                    20, (i) => "Item ${i + 1}"),
                              )),
                    );
                  },
                ),
              ),

              RaisedButton(
                  child: Text("动画"),
                  onPressed: (){
//                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AnimationContain()));

                    //路由自定义动画,改为左边进入
                    Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (context,Animation animation,_)=>FadeTransition(
                          opacity: animation,
                          child: SlideTransition(position: Tween<Offset>(begin: Offset(-1.0, 0.0),end: Offset(0.0, 0.0)).animate(animation),child: AnimationContain(),),
                        )
                    ));

                  }
              ),
              RaisedButton(
                  child: Text("滚动控件"),
                  onPressed: (){
                    //基础路由调用
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ScrollWidgetContain()));
                  }
              ),
              RaisedButton(
                  child: Text("特殊控件"),
                  onPressed: (){
                    //基础路由调用
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SpecialWidgetContain()));
                  }
              ),
              RaisedButton(
                  child: Text("自绘控件"),
                  onPressed: (){
                    //基础路由调用
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CustomContain()));
                  }
              ),
              new Center(
                child: new RaisedButton(
                  child: new Text('Launch box movew'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new BoxMoveAnimation()),
                    );
                  },
                ),
              ),
              new Center(
                child: new RaisedButton(
                  child: new Text('Launch  CustomDialog'),
                  onPressed: () {
                    getCustomBottomDialog(context);
                  },
                ),
              ),
              new Center(
                child: new RaisedButton(
                  child: new Text('Launch  getAlertDialog'),
                  onPressed: () {
                    getAlertDialog(context);
                  },
                ),
              ),
              new Center(
                child: new RaisedButton(
                  child: new Text('Launch box movew'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new BoxMoveAnimation2()),
                    );
                  },
                ),
              ),
              new Center(
                child: new RaisedButton(
                  child: new Text('Launch gesture_demo screen'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new MyApp_Gesture()),
                    );
                  },
                ),
              ),new Center(
                child: new RaisedButton(
                  child: new Text('Launch showBottomSheet '),
                  onPressed: () {
                    modalBottomSheetMenu(context);

//                    showModalBottomSheet(
//                      context: context,
//                      backgroundColor: Colors.red,
//                      shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(20),
//                        side: BorderSide(
//                          width: 2,
//                          color: Colors.blue,
//                          style: BorderStyle.solid,
//                        ),
//                      ),
//                      builder: (BuildContext context) {
//                        return new Container(
//                            height: 200.0,
//                            child: Container(
//                              alignment: Alignment.center,
//                              child: Column(
//                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                children: <Widget>[
//                                  RaisedButton(
//                                    child: Text('你好'),
//                                    onPressed: (){
//                                      Navigator.pop(context,'你好');
//                                    },
//                                  ),
//                                  RaisedButton(
//                                    child: Text('我好'),
//                                    onPressed: (){
//                                      Navigator.pop(context,'我好');
//                                    },
//                                  ),
//                                  RaisedButton(
//                                    child: Text('大家好'),
//                                    onPressed: (){
//                                      Navigator.pop(context,'大家好');
//                                    },
//                                  ),
//
//                                ],
//                              ),
//                            )
//                        );
//                      },
//                    ).then((val) {
//                      // 打印 点击返回的数据
//                      print(val);
//                    });

//                    showBottomSheet(
//                        context: context,
//                        builder: (BuildContext context){
//                          return Text("Container 的圆角边框");
//                        });
                  },
                ),
              ),new Center(
                child: new CustomPaintView(),
              ),
              new Center(
                child: new RaisedButton(
                  child: new Text('Launch listview screen'),
                  padding: EdgeInsets.all(20),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new MyApp_List(
                                items: new List<ListItem>.generate(1000, (i) {
                                  if (i % 3 == 0) {
                                    return new HeadingItem("Heading $i");
                                  } else if (i % 3 == 1) {
                                    return new MessageItem(
                                        "Sender $i", "Message body $i");
                                  } else if (i % 3 == 2) {
                                    return new ImageItem("ImageItem $i");
                                  }
                                }),
                              )),
                    );
                  },
                ),
              ),
              new Center(
                child: new RaisedButton(
                  child: new Text('Launch gridview screen'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new MyApp_GridView()),
                    );
                  },
                ),
              ),
              new Center(
                child: new RaisedButton(
                  child: new Text('Launch back_lastpage_demo screen'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new BackDemoHomeScreen()),
                    );
                  },
                ),
              ),
              new Center(
                child: new RaisedButton(
                  child: new Text('Launch animatedlist screen'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new AnimatedListSample()),
                    );
                  },
                ),
              ),
              new Center(
                child: new RaisedButton(
                  child: new Text('Launch appbarbottom screen'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new AppBarBottomSample()),
                    );
                  },
                ),
              ),
              new Center(
                child: new RaisedButton(
                  child: new Text('Launch expansiontitle screen'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new ExpansionTileSample()),
                    );
                  },
                ),
              ),
              new Center(
                child: new RaisedButton(
                  child: new Text('Launch demo1 screen'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) => new Demo1()),
                    );
                  },
                ),
              ),
              new Center(
                child: new RaisedButton(
                  child: new Text('Launch box screen'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) => new Box("1")),
                    );
                  },
                ),
              ),
              new Center(
                child: new RaisedButton(
                  child: new Text('Launch boxlayout screen'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new BoxLayout()),
                    );
                  },
                ),
              ),
              new Center(
                child: new RaisedButton(
                  child: new Text('Launch scrollview screen'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new scrollview_widget()),
                    );
                  },
                ),
              ),
              new Center(
                  child: Image(
                image: AssetImage("imgs/double_sign_in_icon.png"),
                width: 50,
                height: 50,
              )),
              new Center(
                child: Image.asset(
                  "imgs/double_sign_in_icon.png",
                  width: 100,
                  height: 50,
                ),
              ),
              new Center(
                child: Icon(
                  Icons.add_call,
                  color: Colors.red,
                  size: 50,
                ),
              ),
              new Center(
                child: new RaisedButton(
                  child: Icon(
                    Icons.open_in_new,
                    color: Colors.red,
                    size: 50,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>
                              new SwitchAndCheckBoxTestRoute()),
                    );
                  },
                ),
              ),
              new Center(
                child: new RaisedButton(
                  child: Text("pageview demo"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new PageViewDemo()),
                    );
                  },
                ),
              ),
              new Center(
                  child: new Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    //背景图
                    image: AssetImage("imgs/double_sign_in_icon.png"),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.yellow, //背景色
                  border: Border.all(
                    //边框
                    color: Color(0xffc89e50),
                    width: 2.0,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(3.0), //圆角
                ),
                child: new RaisedButton(
                  onPressed: () {},
                  color: Colors.grey,
                  child: new Text("登陆"),
                  shape: new BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: new BorderSide(
                        style: BorderStyle.none,
                      )),
                ),
              )),
              new Center(
                child: Container(
                  width: 100.0,
                  height: 20.0,
                  margin: EdgeInsets.only(
                      left: 10.0, top: 16.0, right: 0.0, bottom: 0.0),
                  decoration: BoxDecoration(
                    color: Colors.transparent, //背景色
                    border: Border.all(
                      //边框
                      color: Color(0xffc89e50),
                      width: 1.0,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(3.0), //圆角
                  ),
                  child: new RaisedButton(
                    onPressed: () {},
                    color: Colors.white,
                    shape: BeveledRectangleBorder(),
                    child: new Text(
                      "租阅 ￥0.00",
                      style: TextStyle(
                        color: Color(0xfff18f1b),
                        backgroundColor: Colors.transparent,
                        fontSize: 12.0,
//                        )),
                      ),
//                    child: Text("租阅 ￥0.00",
//                        maxLines: 1,
//                        textAlign: TextAlign.center,
//                        style: TextStyle(
//                          color: Color(0xfff18f1b),
//                          fontSize: 12.0,
//                        )
                    ),
                  ),
                ),
              ),
              Container(
                  width: 80,
                  height: 24,
                  margin: EdgeInsets.only(
                      left: 10.0, top: 16.0, right: 0.0, bottom: 0.0),
                  child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage("imgs/double_sign_in_icon.png"),
                  )),
              InkWell(
                splashColor: Colors.red,
                // When the user taps the button, show a snackbar
                onTap: () {
                  Scaffold.of(context).showSnackBar(new SnackBar(
                    content: new Text('水波点击效果'),
                  ));
                },
                child: new Container(
                  padding: new EdgeInsets.all(12.0),
                  child: new Text('水波点击效果'),
                ),
              ),

              Container(
                child: _getContainerWithDecoration(),
              ),

              Container(
                child: buildGetHttp(context),
              ),
              Container(
                child: buildStreamTestWidget(context),
              ),
              Container(
                child: WillPopScopeTestRoute(),
              ),

              new Center(
                child: new RaisedButton(
                  child: Text("测试 双击back按钮 退出当前界面"
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>
                          new WillPopScopeTestRoute()),
                    );
                  },
                ),
              ),
              new Center(
                child: new RaisedButton(
                  child: Text("alertdialog"),
                  onPressed: () {
                    showalertdialog(context);
                  },
                ),
              ),
              new Center(
                child: new RaisedButton(
                  child: Text("simple dialog"),
                  onPressed: () {
                    changeLanguage(context);
                  },
                ),
              ),
              new Center(
                child: new RaisedButton(
                  child: Text("showListDialog"),
                  onPressed: () {
                    showListDialog(context);
                  },
                ),
              ),
              new Center(
                child: new RaisedButton(
                  child: Text("custom dialog"),
                  onPressed: () {
                    showMYDialog(context);
                  },
                ),
              ),
              RaisedButton.icon(
                icon: Icon(Icons.send),
                label: Text("RaisedButton 发送"),
                onPressed: (){

                },
              ),
              OutlineButton.icon(
                icon: Icon(Icons.add),
                label: Text("OutlineButton 添加"),
                onPressed: (){

    },
              ),
              FlatButton.icon(
                icon: Icon(Icons.info),
                label: Text("FlatButton 详情"),
                onPressed: (){

    },
              ),

              FlatButton(
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                child: Text("圆角button"),
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {},
              )
    ,
              Image.asset("imgs/double_sign_in_icon.png",width: 100,height: 30,fit: BoxFit.fill,),
              Switch(
                value: _switchSelected,//当前状态
                onChanged:(value){
                  //重新构建页面
//                  setState(() {
//                    _switchSelected=value;
//                  });
                },
              ),
              Checkbox(
                value: _checkboxSelected,
                activeColor: Colors.red, //选中时的颜色
                onChanged:(value){
//                  setState(() {
//                    _checkboxSelected=value;
//                  });
                } ,
              ),

              TextField(
                autofocus: false,
                decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或邮箱",
                    prefixIcon: Icon(Icons.person)
                ),
              ),
              TextField(
                textInputAction: TextInputAction.search,
                keyboardType:TextInputType.phone,//手机号

                decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "您的登录密码",
                    prefixIcon: Icon(Icons.lock)
                ),
                obscureText: true,
              ),

              // 模糊进度条(会执行一个动画)
              LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
//进度条显示50%
              LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: .5,
              ),
              // 模糊进度条(会执行一个旋转动画)
            Container(
              width: 60.0,
              height: 60.0,
//              color: Colors.red,
              padding: EdgeInsets.all(10.0),



              decoration:BoxDecoration(
                color: Colors.grey,
               borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),

              child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation(Colors.grey),
              ),


            ),
//进度条显示50%，会显示一个半圆
              CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: .5,
              ),

              SizedBox(
                width: 130,
                height: 100,
                child:  buildCircularProgressIndicatorWidget(context )
,
    ),
              new Center(
                child: new RaisedButton(
                  child: Text("测试 streambuilder"
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>
                          new TestStreamBuilder()),
                    );
                  },
                ),
              ), new Center(
                child: new RaisedButton(
                  child: Text("测试 state fulll"
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>
                          new lifeDemo()),
                    );
                  },
                ),
              ),

            ],
          ),
        ));
  }


  void modalBottomSheetMenu(BuildContext c) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: c,
        builder: (builder) {
          return new Container(
              height: 470,
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),topRight: Radius.circular(25.0),
                      ))),
//              decoration: new BoxDecoration(
//                  color: Colors.white,
//                  borderRadius: new BorderRadius.only(
//                      topLeft: const Radius.circular(25.0),
//                      topRight: const Radius.circular(25.0))),

              child: new Center(
                child: new Text("底部弹出框 顶部圆9角"),
              ));
        });
  }

getAlertDialog(BuildContext context){
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert Dialog"),
          content: Text("Hello Alert Dialog"),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(this);
                },
                child: Text("关闭"))
          ],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
        );
      });

}

Future getCustomBottomDialog(BuildContext context){
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return BaseDialog(
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "自定义Dialog",
                      style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 2,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 20),
                      child: Text("Hello 自定义Dialog"),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                            onTap: () {
                              Navigator.of(context).pop(this);
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 20),
                              alignment: Alignment.center,
                              width: 100,
                              height: 30,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.4),
                                    Theme.of(context).primaryColor
                                  ]),
                                  borderRadius:
                                  BorderRadius.circular(15),
                                  color:
                                  Theme.of(context).primaryColor),
                              child: Text(
                                "关闭",
                                style: TextStyle(
                                    letterSpacing: 3,
                                    color: Colors.white),
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              ),
              MediaQuery.of(context).size.height*0.6,
              MediaQuery.of(context).size.width );
        });

}


}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('First Screen'),
      ),
      body: Text("hello"),
    );
  }
}

Widget _getContainerWithDecoration() {//带点击效果widget
  return Container(
    height: 48,
    width: Size.infinite.width,
    child: Material(
        color: Colors.black,

        shape: BeveledRectangleBorder(),
//        shape: CircleBorder(),

        child: IconButton(
            iconSize: 32,
            color: Colors.white,
            icon: Icon(Icons.navigate_before),
            splashColor: Colors.red,
            highlightColor: Colors.green,
            onPressed: () {
//              Fluttertoast.showToast(msg: '测试');
            }),
  ),
    decoration: BoxDecoration(
      color: Colors.yellow,
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF00A0FF),
          Color(0xFF20A0FF),
          Color(0x8000A0FF),
        ],
      ),
    ),
  );
}

testAsync() async
{
  print("异步 开始");

  Future.delayed(Duration(seconds:20),(){
    print("延迟 20秒");

  });

  print("开始await");
  await Future.delayed(Duration(seconds:8),(){
    print("延迟 8秒");

  });
  print("异步 结尾");

}
 // 验证 event 和task 队列。
//app开始运行时，event loop优先处理microtask queue,直到microtask queue为空的时候，
// 再开始处理event queue。event queue不为空的话，一次取一个event执行，执行完后会重新判断microtask是否为空
//Future对象就是一个event，创建Future就会在event queue中添加一条记录，在async await中，被await标记的是一个event
testEventTask() async {

    new Future((){
      print('event1');

      Future.microtask(() {
        print('microtask3');
      });

    });

    Future.microtask(() {
      print('microtask1');
    });
    new Future((){print('event2');});

    Future.microtask(() {
      print('microtask2');
    });




}

//模拟异步获取网络数据
Widget buildGetHttp(BuildContext context) {
  return Center(
    child: FutureBuilder<String>(
      future: mockNetworkData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        // 请求已结束
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            // 请求失败，显示错误
            return Text("Error: ${snapshot.error}");
          } else {
            // 请求成功，显示数据
            return Text("测试 异步future获取联网数据 : ${snapshot.data}");
          }
        } else {
          // 请求未结束，显示loading
          return CircularProgressIndicator();
        }
      },
    ),
  );
}

Future<String> mockNetworkData() async {
  return Future.delayed(Duration(seconds: 2), () => "我是从互联网上获取的数据");
}

//Stream<T>. forEach()
//
//这中操作和listen()的方式基本差不多，也是一种监听流的方式，这只是监听了onData


//Stream<T>. listen()
//1.onData是接收到数据的处理,必须要实现的方法
//
//2.onError流发生错误时候的处理
//
//3.onDone流完成时候调取
//
//4.cancelOnError发生错误的时候是否立马终止
void _streamlisten() async {

  print("streamlisten 测试");
  Duration interval = Duration(seconds: 1);
  Stream<int> stream = Stream.periodic(interval, (data) => data);
  stream = stream.take(10);
  //在流中添加筛选条件，过滤掉一些不想要的数据，满足条件返回true,不满足条件返回false,如下我们筛选出流中大于5小于10的数据
  stream = stream.where((data)=>data>5);
  stream = stream.where((data)=> data<10);
  stream = stream.map((data) => data + 1);

 // stream<T>.map
  //对流中的数据进行一些变换，以下是我对Stream的每个数据都加1

  stream.listen((data) {
    print("流数据:"+data.toString());
  }, onError: (error) {
    print("流发生错误");
  }, onDone: () {
    print("流已完成");
  }, cancelOnError: false);
}

//构建多监听器的StreamController有两种方式

//1.直接创建多订阅Stream （广播流）
testStreamBoradcast() {
  StreamController<String> streamController = StreamController.broadcast();
  streamController.stream.listen((data){
  print(data);
  },onError: (error){
  print(error.toString());
  });
  streamController.stream.listen((data) => print(data));
streamController.add("bbb");

  streamController.close();
 // 将单订阅流转成多订阅流
//  StreamController<String> streamController = StreamController();
//  Stream stream =streamController.stream.asBroadcastStream();
//  stream.listen((data) => print(data));
//  stream.listen((data) => print(data));
//  streamController.sink.add("aaa");
//  streamController.close();

  //上面代码会输出 aaa,aaa




}



//StreamBuilder使用
//​ 前面我把Stream的常用方式做了简单的介绍和演示，我们怎么结合Flutter使用呢？在Flutter里面提供了一个Widget名叫StreamBuilder,
// StreamBuilder其实是个StreamBuilder它一直记录着流中最新的数据，当数据流发生变化时，会自动调用builder方法进行重建。

