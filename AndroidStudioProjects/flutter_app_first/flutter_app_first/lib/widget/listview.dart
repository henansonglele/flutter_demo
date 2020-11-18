import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' as prefix0;
import 'package:fluttertoast/fluttertoast.dart';

import 'ListDetail.dart';


void mainlist() {
  runApp(new MyApp_List(
    items: new List<ListItem>.generate(1000, (i) {
      if (i % 3 == 0) {
        return new HeadingItem("Heading $i");
      } else if (i % 3 == 1) {
        return new MessageItem("发送者 $i", "消息体是 item 第 $i个");
      } else if (i % 3 == 2) {
//         return new MessageItem("Sender $i", "Message body $i");
        return new ImageItem("ImageItem $i");
      }
    }
//          (i) => i % 6 == 0
//          ? new HeadingItem("Heading $i")
//          : new MessageItem("Sender $i", "Message body $i"),
        ),
  ));
}

class MyApp_List extends StatelessWidget {
  final List<ListItem> items;

  MyApp_List({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Mixed List demo';

    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new ListView.builder(
          // Let the ListView know how many items it needs to build
          itemCount: items.length,
          // Provide a builder function. This is where the magic happens! We'll
          // convert each item into a Widget based on the type of item it is.
          itemBuilder: (context, index) {
            final item = items[index];

            if (item is HeadingItem) {
              return ListItemWidget(); //测试代码
//              return new ListTile(
//                title: new Text(
//                  item.heading,
//                  style: Theme.of(context).textTheme.headline,
//                ),
//
//              );
            } else if (item is MessageItem) {
              return new ListTile(
                title: new Text(item.sender),
                onTap: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) =>
                          new DetailScreen(item: items[index]),
                    ),
                  );
                },
                subtitle: new Text(item.body),
              );
            } else if (item is ImageItem) {
              return new ListTile(
                  title: new Image.network(
                'https://ss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/lbsugc/pic/item/a8014c086e061d950501087b7cf40ad162d9ca29.jpg',
                width: 60.0,
                height: 80.0,
              ));
            }
          },
        ),
      ),
    );
  }
}

// The base class for the different types of items the List can contain
abstract class ListItem {}

// A ListItem that contains data to display a heading
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

// A ListItem that contains data to display a message
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}

class ImageItem implements ListItem {
  final String url;

//   new Image.network(
//  'https://github.com/flutter/website/blob/master/_includes/code/layout/lakes/images/lake.jpg?raw=true',
//  )
  ImageItem(this.url);
}

class ListItemWidget extends StatelessWidget {
//  final StoreUpList card;

  const ListItemWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pic = null;
    pic ??=
        "http://img60.ddimg.cn/imgtestdir/digital/channel/59/33/2dd23d6d7bfe4ff996df411202e0a375.jpg";

    return Container(
      color: Colors.blueGrey,
      width: double.infinity,

      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child:Material(child: Ink(
        child: InkWell(
      //
//        padding: EdgeInsets.all(10.0),
      child: Row(
//        spacing: 8.0, // 主轴(水平)方向间距
//        runSpacing: 4.0, // 纵轴（垂直）方向间距
//        alignment: WrapAlignment.center, //沿主轴方向居中
      /*direction: Axis.horizontal,
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.start,
        textDirection: TextDirection.ltr,*/
      crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: 84.0,
                height: 120.0,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  //设置阴影背景
                  image: DecorationImage(
                    image: AssetImage("imgs/certification_icon.png"),
                    fit: BoxFit.cover,
                  ),
                ),
//                padding: EdgeInsets.all(12.0),
                child: Image.network(
                  pic,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                top: 18.0,
                child: Image(
                  fit: BoxFit.fill,
                  width: 20.0,
                  height: 20.0,
                  image:AssetImage("imgs/double_sign_in_icon.png"),
                ),
              ),

              Positioned(
                top: 78.0,
                child: Image(
                  fit: BoxFit.fill,
                  width: 20.0,
                  height: 20.0,
                  image:AssetImage("imgs/double_sign_in_icon.png"),
                ),
              ),

              Positioned(
                top: 18.0,
                left: 70.0,
                child: Image.network(
                  pic,
                  width: 20.0,
                  height: 20.0,
                  fit: BoxFit.cover,
                ),
              ),



            ],


          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(child: Container(//书名
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(
                          left: 10.0, top: 10.0, right: 0.0, bottom: 0.0),

                      child: Text("书书名书书名书书书名书书名名书名名书书名书书书名书书名名书名名书书书名书书名名书名名",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          strutStyle: StrutStyle(
                              forceStrutHeight: true, height: 1.0, leading: 0.3),
                          //设置行间距
                          style: TextStyle(
                            color: Color(0xff333333),
                            decoration: TextDecoration.none,
                            fontSize: 14.0,
                          )),
                    ),),

                    Container(//收藏icon
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.only(
                          left: 1.0, top: 6.0, right: 0.0, bottom: 0.0),
                      child: Image(
                        fit: BoxFit.fill,
                        width: 20.0,
                        height: 20.0,
                        image:AssetImage("imgs/double_sign_in_icon.png"),
                      ),
                    ),

                  ],),
                Container(  // 作者（ 听书  播音者， 作家）
                  padding: EdgeInsets.only(left:10,top: 6.0),
                  child: Row(
                    mainAxisAlignment:MainAxisAlignment.start ,
                    crossAxisAlignment:CrossAxisAlignment.center ,
                    children: <Widget>[
                      Image.asset("imgs/double_sign_in_icon.png", width:9.0,height: 12.0,),

                     Expanded(child: Text("作者",
                         softWrap: true,
                         maxLines: 1,
                         overflow:TextOverflow.ellipsis,
                         style: TextStyle(
                           color: Color(0xff999999),
                           fontSize: 12.0,
                         )
                     ),),
                      Image.asset("imgs/double_sign_in_icon.png", width:9.0,height: 12.0,),
                     Expanded(child:  Text("播7发光法电饭锅电饭锅第三方公司对方覆盖的分公司大范甘迪700音",
                         softWrap: true,
                         maxLines: 1,
                         overflow:TextOverflow.ellipsis,
                         style: TextStyle(
                           color: Color(0xff999999),
                           fontSize: 12.0,
                         )
                     ),),

                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(//作者
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(
                          left: 10.0, top: 6.0, right: 0.0, bottom: 0.0),
                      child: Text("作者",
                          maxLines: 1,
                          style: TextStyle(
                            color: Color(0xff999999),
                            fontSize: 12.0,
                          )),
                    ),

                    Container(//作者
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(
                          left: 10.0, top: 6.0, right: 0.0, bottom: 0.0),
                      child: Text("作者",
                          maxLines: 1,
                          style: TextStyle(
                            color: Color(0xff999999),
                            fontSize: 12.0,
                          )),
                    ),
                  ],),
//                  Expanded(
//                    child: Container(
//                        alignment: Alignment.topLeft,
//                        padding: EdgeInsets.only(left:10.0,top:5.0,right:0.0,bottom: 0.0),
//                        child:
//                        Text(card.editorRecommend,
//                            maxLines: 2,
//                            overflow: TextOverflow.ellipsis,
//                            softWrap: true,
//                            style: TextStyle(
//                              color: Color(0xff666666),
//                              fontSize: 12.0,
//                              wordSpacing: 5.0,
//                            )
//                        ),
//
//                      ),
//                      ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(
                      left: 10.0, top: 5.0, right: 0.0, bottom: 0.0),
                  child: Text("价格价格价格价格价格价格价格价格价格价格价格价格价格价格价格价格价格价格",
                      maxLines: 2,
                      style: TextStyle(
                        color: Color(0xffff4e4e),
                        fontSize: 12.0,
                      )),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(
                          left: 10.0, top: 5.0, right: 0.0, bottom: 0.0),
                      color: Colors.yellow,
                      child: Text("ddd",
                          maxLines: 1,
                          style: TextStyle(
                            color: Color(0xffff4e4e),
                            fontSize: 12.0,
                          )),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.only(
                          left: 10.0, top: 5.0, right: 0.0, bottom: 0.0),
                      color: Colors.greenAccent,
                      child: Text("2018-10-9",
                          textAlign: TextAlign.end,
                          textDirection: TextDirection.ltr,
                          maxLines: 1,
                          style: TextStyle(
                            color: Color(0xffff4e4e),
                            fontSize: 12.0,
                          )),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.only(
                          left: 10.0, top: 5.0, right: 0.0, bottom: 0.0),
                      color: Colors.greenAccent,
                      child: Text("第三",
                          textAlign: TextAlign.end,
                          textDirection: TextDirection.ltr,
                          maxLines: 1,
                          style: TextStyle(
                            color: Color(0xffff4e4e),
                            fontSize: 12.0,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),

//          ),
        ],
      ),

        onTap: (){
//          Toast.showToast("点击item");
          Fluttertoast.showToast(msg: "点击item");
        },

        splashColor: Colors.blueGrey,
      ),
      ),),

    );
  }
}
