
import 'dart:async';

import 'package:flutter/material.dart';

//上面我既使用了streamController.sink.add("aaa");添加数据，也使用了streamController.add("bbb");方式添加数据。实际效果是一样的，
// 查看源码可知 sink如下,实际上sink是对StreamController的一种包装，最终都是调取的StreamController.add方法；

class TestStreamBuilder extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TestStreamBuilder> {
  int _count = 0;
  final StreamController<int> _streamController = StreamController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: StreamBuilder<int>(
              stream: _streamController.stream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return snapshot.data == null
                    ? Text("0")
                    : Text("${snapshot.data}");
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            _streamController.sink.add(++_count);
          }),
    );
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }
}