import 'package:flutter/material.dart';
import 'data_modle/Todo.dart';
import 'listview.dart';


class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Todo
//  final Todo todo;
  final MessageItem item;

  // In the constructor, require a Todo
  DetailScreen({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create our UI
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("${item.sender}"),
      ),
      body: new Padding(
        padding: new EdgeInsets.all(16.0),
        child: new Text('${item.body}'),
      ),
    );
  }
}