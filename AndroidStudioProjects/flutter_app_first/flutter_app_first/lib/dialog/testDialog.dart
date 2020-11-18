
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// alterdialog
Future<void> showalertdialog(BuildContext context ) async {
  int i = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
    title: Text("提示"),
    content: Text("您确定要删除当前文件吗?"),
    actions: <Widget>[
      FlatButton(
        child: Text("取消"),
        onPressed: (){
              Navigator.of(context).pop(2); //关闭对话框
        }
      ),
      FlatButton(
        child: Text("删除"),
        onPressed: () {
// ... 执行删除操作
          Navigator.of(context).pop(1); //关闭对话框
        },
      ),
    ],
  );
});
}
//simpladialog
Future<void> changeLanguage(BuildContext context ) async {
  int i = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('请选择语言'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                // 返回1
                Navigator.pop(context, 1);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: const Text('中文简体'),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                // 返回2
                Navigator.pop(context, 2);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: const Text('美国英语'),
              ),
            ),
          ],
        );
      });

  if (i != null) {
    print("选择了：${i == 1 ? "中文简体" : "美国英语"}");
  }
}

Future<void> showListDialog(BuildContext  context) async {
  int index = await showDialog<int>(
    context: context,
    builder: (BuildContext context) {
      var child = Column(
        children: <Widget>[
          ListTile(title: Text("请选择")),
          Expanded(
              child: ListView.builder(
                itemCount: 30,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text("$index"),
                    onTap: () => Navigator.of(context).pop(index),
                  );
                },
              )),
        ],
      );
      //使用AlertDialog会报错
      //return AlertDialog(content: child);
      return Dialog(child: child);
    },
  );
  if (index != null) {
    print("点击了：$index");
  }
}


Future<void> showMYDialog(BuildContext  context) async {

showCustomDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("提示"),
        content: Text("您确定要删除当前文件吗?"),
        actions: <Widget>[
          FlatButton(
            child: Text("取消"),
            onPressed: (){
              Fluttertoast.showToast(msg: "点击 取消");
//              Toast.showToast( "点击 取消");
            },
          ),
          FlatButton(
            child: Text("删除"),
            onPressed: () {
              Fluttertoast.showToast(msg: "点击 删除");
//              Toast.showToast("点击 删除");
// 执行删除操作
            },
          ),
        ],
      );
    },
  );
}
//实际上，showDialog方法正是showGeneralDialog的一个封装，定制了Material风格对话框的遮罩颜色和动画。
// Material风格对话框打开/关闭动画是一个Fade（渐隐渐显）动画，如果我们想使用一个缩放动画就可以通过transitionBuilder来自定义。
// 下面我们自己封装一个showCustomDialog方法，它定制的对话框动画为缩放动画，并同时制定遮罩颜色为Colors.black87
Future<T> showCustomDialog<T>({
  @required BuildContext context,
  bool barrierDismissible = true,
  WidgetBuilder builder,
}) {
  final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
  return showGeneralDialog(
    context: context,
    pageBuilder: (BuildContext buildContext, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      final Widget pageChild = Builder(builder: builder);
      return SafeArea(
        child: Builder(builder: (BuildContext context) {
          return theme != null
              ? Theme(data: theme, child: pageChild)
              : pageChild;
        }),
      );
    },
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black87, // 自定义遮罩颜色
    transitionDuration: const Duration(milliseconds: 150),
    transitionBuilder: _buildMaterialDialogTransitions,
  );
}

Widget _buildMaterialDialogTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child) {
  // 使用缩放动画
  return ScaleTransition(
    scale: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    child: child,
  );
}