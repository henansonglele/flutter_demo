import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//import 'http.dart';

//import 'http.dart';

class AnimationPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("http网络请求")),
      body: Center(),
    );
  }
}


class AnimationPage  {
  Widget build() {
    return Scaffold(
      appBar: AppBar(title: Text("http网络请求")),
      body: HttpConnectWidget(),
    );
  }
}
class HttpConnectWidget extends StatefulWidget {
  @override
  _HttpConnectWidgetState createState() => _HttpConnectWidgetState();
}

class _HttpConnectWidgetState extends State<HttpConnectWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
          child: Text("网络请求"),
          onPressed: (){
            Fluttertoast.showToast(msg: "click");
//            GetHttp().httpConnect(
//                "https://www.baidu.com",
//                HttpCallBack(
//                  (result)=> print(result),
//                  (error)=> print(error)
//                )
//            );
          }
      ),
    );
  }
}



