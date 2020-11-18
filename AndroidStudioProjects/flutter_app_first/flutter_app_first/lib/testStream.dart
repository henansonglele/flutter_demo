import 'package:flutter/material.dart';
//返回stream 包裹的递增计数器。
Stream<Rect> counter() {
  return Stream.periodic(Duration(seconds: 1), (i) {
    return Rect(0,0,10,10+i);
  });
}

Stream<int> counterInt() {
  return Stream.periodic(Duration(seconds: 1), (i) {

    if(i > 100)
      return 100;

    return i;
  });
}

class Rect{
  int left ;
  int top ;
  int w;
  int h ;
  Rect(this.left,this.top,this.w,this.h);
}


Widget buildStreamTestWidget(BuildContext context) {
  return StreamBuilder<int>(
    stream: counterInt(), //
    //initialData: ,// a Stream<int> or null
    builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
      if (snapshot.hasError)
        return Text('Error: ${snapshot.error}');
      switch (snapshot.connectionState) {
        case ConnectionState.none:
          return Text('没有Stream');
        case ConnectionState.waiting:
          return Text('等待数据...');
        case ConnectionState.active:
          return Text('测试异步stream功能 - count: ${snapshot.data}');
        case ConnectionState.done:
          return Text('Stream已关闭');
      }
      return null; // unreachable
    },
  );
}

Widget buildCircularProgressIndicatorWidget(BuildContext context) {
  return StreamBuilder<int>(
    stream: counterInt(), //
    //initialData: ,// a Stream<int> or null
    builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
      if (snapshot.hasError)
        return Text('Error: ${snapshot.error}');
      switch (snapshot.connectionState) {
        case ConnectionState.none:
          return Text('没有Stream');
        case ConnectionState.waiting:
          return Text('等待数据...');
        case ConnectionState.active:
          return CircularProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation(Colors.blue),
            value: snapshot.data/100.0,
          );
        case ConnectionState.done:
          return Text('Stream已关闭');
      }
      return null; // unreachable
    },
  );
}