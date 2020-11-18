import 'package:flutter/material.dart';

class _LifecyclePageFullState extends State<LifecyclePageFull>
    with WidgetsBindingObserver {
  int number = 0;

  @override
  void initState() {
    print('生命周期--initState');
    super.initState();
    //注册widget监听，复写时要在super之后
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    print('生命周期--didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(LifecyclePageFull oldWidget) {
    print('生命周期--didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('生命周期--deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('生命周期--dispose');
    //注销widget监听，复写时要在super之前
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        print('Observer--可见没有响应inactive');
        break;
      case AppLifecycleState.paused:
        print('Observer--不可见不响应paused');
        break;
      case AppLifecycleState.resumed:
        print('Observer--可见可交互resumed');
        break;
      case AppLifecycleState.suspending:
        print('Observer--申请暂停suspending');
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    print('生命周期--build');
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text('leftcycle'),
      ),
      body: new Center(
        child: new Text(
          '$number',
          style: TextStyle(fontSize: 25.0),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          setState(() {
            print('number加1了');
            number++;
          });
        },
        child: new Icon(Icons.add),
      ),
    );
  }
}


class LifecyclePageFull extends StatefulWidget {
  @override
  State createState() => new _LifecyclePageFullState();
}

//class LifecyclePageFull extends StatefulWidget{
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return null;
//  }
//
//}

class lifeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new LifecyclePageFull(),
      debugShowCheckedModeBanner: false,
    );
  }
}
