import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/ListDetail.dart';

void mainlist() {
  runApp(new MyApp_List(
    items: new List<ListItem>.generate(
      1000,(i){
       if( i%3 == 0){
         return new HeadingItem("Heading $i");
       }else if( i%3 == 1){
         return new MessageItem("发送者 $i", "消息体是 item 第 $i个");
       }else if( i%3 == 2){
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
              return new ListTile(
                title: new Text(
                  item.heading,
                  style: Theme.of(context).textTheme.headline,
                ),

              );
            } else if (item is MessageItem) {
              return new ListTile(
                title: new Text(item.sender),
                onTap: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => new DetailScreen(item: items[index]),
                    ),
                  );
                },
                subtitle: new Text(item.body),
              );
            } else if (item is ImageItem) {
              return new ListTile(
                title: new Image.network('https://ss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/lbsugc/pic/item/a8014c086e061d950501087b7cf40ad162d9ca29.jpg',)
              );
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