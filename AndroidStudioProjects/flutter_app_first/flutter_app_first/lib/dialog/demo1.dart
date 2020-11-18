import 'package:flutter/material.dart';

class Demo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      color: Colors.white,//背景色
      padding: const EdgeInsets.all(32.0),
      margin: const EdgeInsets.fromLTRB(10, 10, 30, 30),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  color: Colors.black,
                  child: new Text(
                    'Oeschinen Lake Campground',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: 20,
                      backgroundColor: Colors.red[100]
                    ),
                  ),
                ),
                new Text(
                  '去掉下划线',
                  style: new TextStyle(
                    color: Colors.grey[500],
                    fontSize: 20,
                    decoration: TextDecoration.none,

                  ),
                ),

                new Text(
                  '下划线',
                  style: new TextStyle(
                    color: Colors.grey[500],
                    fontSize: 20,
                    decoration: TextDecoration.underline,

                  ),
                ),

                new Text(
                  '字体中间划线',
                  style: new TextStyle(
                    color: Colors.grey[500],
                    fontSize: 20,
                    decoration: TextDecoration.lineThrough,

                  ),
                ),

                new Icon(
                  Icons.access_alarm,
                  color: Colors.red[500],
                ),
                new Text(
                  '字体上划线，设置上划线颜色',
                  style: new TextStyle(
                    color: Colors.grey[500],
                    fontSize: 20,
                    decoration: TextDecoration.overline,
                    decorationStyle: TextDecorationStyle.solid,
                      decorationColor:Colors.red

                  ),
                ),
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text('41'),
        ],
      ),
    );
    //...
//    return titleSection;

    return new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: Colors.white,
    ),

      home: Scaffold(
        backgroundColor: Colors.green[100],
        appBar: AppBar(
          title: Text('Top Lakes'),
        ),
        body: Column(
          children: [
            titleSection,
          ],
        ),
      ),
    );


  }}