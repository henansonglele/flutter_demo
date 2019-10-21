import 'package:flutter/material.dart';
import 'package:flutter_app_1/scollview_widget.dart';
import 'listview.dart';
import 'gridview.dart';
import 'gesture_demo.dart';
import 'slide_remove_item.dart';
import 'back_lastpage_demo.dart';
import 'animated_list_demo.dart';
import 'bottom_tabbar_demo.dart';
import 'package:flutter_app_1/ExpansionTileSample.dart';
import 'package:flutter_app_1/demo1.dart';
import 'package:flutter_app_1/box_demo.dart';
import 'package:flutter_app_1/box_layout.dart';
import 'package:flutter_app_1/slide_remove_item.dart';
import 'package:flutter_app_1/switch_demo.dart';
import 'package:flutter_app_1/pageview_demo.dart';

//void main() => runApp(MyApp());
void maintest() {
  slideremove_main();
//  gesture_main();
//  gridview_main();
//  mainlist();
}

void main() {
  runApp(new MaterialApp(
    title: 'Navigation Basics',
    home: new FirstScreen(),
  ));
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('First Screen'),
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
              ),
              new Center(
                child: new RaisedButton(
                  child: new Text('Launch listview screen'),
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
                  image:AssetImage("imgs/double_sign_in_icon.png"),
                  width: 50,height: 50,
                )
              ),
              new Center(
                child: Image.asset("imgs/double_sign_in_icon.png",width: 100,height: 50,),
              ),
              new Center(
                child: Icon(
                  Icons.add_call,color: Colors.red,size: 50,
                ),
              ),

              new Center(
                child: new RaisedButton(
                  child: Icon(Icons.open_in_new,color: Colors.red,size: 50,),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new SwitchAndCheckBoxTestRoute()),
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

            ],
          ),
        ));
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
