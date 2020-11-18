import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_first/animator/page/toast.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomView2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleView();
  }
}

/*
* 绘制一个圆
*
*  CustomPaint 是一个 SingleChildRenderObjectWidget
*
*  createRenderObject 返回 RenderCustomPaint
*  RenderCustomPaint 就是 RenderBox with RenderObjectWithChildMixin<RenderBox>
*  在其的paint方法中调用_paintWithPainter(context.canvas, offset, _painter)
*  回调 painter.paint(canvas, size);
*   _painter 是 CustomPainter
*
* */
class CircleView extends StatefulWidget {
  @override
  _CircleViewState createState() => _CircleViewState();
}

class _CircleViewState extends State<CircleView> {
  Rect _rect;
  @override
  Widget build(BuildContext context) {
    //屏幕的尺寸
    Size size = MediaQuery.of(context).size;
    return Container(
        child: GestureDetector(
            child: CustomPaint(
              size: size,
              painter: CirclePainter((rect){
                _rect = rect;
                print(_rect.toString());
              }),
            ),
            onTapDown:(TapDownDetails detail){
              //获取的点击点是绝对高度
              print(detail.globalPosition.toString());
              //状态栏高度
              double statusBar = MediaQueryData.fromWindow(ui.window).padding.top;
              //顶部高度 = 状态栏高度+toolbar高度+tab高度
              double topHeight = statusBar + kToolbarHeight + kTextTabBarHeight;
              var dx = detail.globalPosition.dx - size.width/2;
              //绝对高度减去
              var dy = detail.globalPosition.dy - (size.height-topHeight)/2 -topHeight ;
              if(_rect.contains(Offset(dx, dy))){
//                Toast.show("点击文字！");
                Fluttertoast.showToast(msg: "点击文字！");
              }
            },
            onTap: (){
              print("========================");
            }
        )
    );
  }
}


typedef RectCallback = void Function(Rect rect);

class CirclePainter extends CustomPainter{
  Paint _paint;
  Path _path;
  double textWidth = 100;
  double textFontSize = 12.0;
  ui.Paragraph paragraph;
  RectCallback callback;
  ui.Image _image;/// = Image(image: AssetImage("imgs/double_sign_in_icon.png"), width: 50, height: 50,);

  CirclePainter(this.callback){
    _paint = Paint();
    loadImage();
    ///setStyle(Style style) 这个方法设置的是绘制的 Style 。Style 具体来说有三种： FILL , STROKE 和 FILL_AND_STROKE 。FILL 是填充模式，STROKE 是画线模式（即勾边模式）， FILL_AND_STROKE 是两种模式一并使用：既画线又填充。它的默认值是 FILL ，填充模式。
    ///在 STROKE 和 FILL_AND_STROKE 下，还可以使用paint.setStrokeWidth(float width) 来设置线条的宽度。
    ///isAntiAlias是否开启抗锯齿，没有开启抗锯齿的时候，图形会有毛片现象，默认是不开启的。
    _paint.isAntiAlias = true;
    _paint.style = PaintingStyle.fill;
    _path = Path();
    ui.ParagraphBuilder paragraphBuilder = ui.ParagraphBuilder(
      ui.ParagraphStyle(
        textAlign: TextAlign.center,
        fontSize: textFontSize,
        textDirection: TextDirection.ltr,
        maxLines: 1,
      ),
    )
      ..pushStyle(
        ui.TextStyle(
            color: Colors.black87, textBaseline: ui.TextBaseline.alphabetic),
      )
      ..addText("六芒星咒符");

    paragraph = paragraphBuilder.build()
      ..layout(ui.ParagraphConstraints(width: textWidth));

    //高度误差+20
    Rect rect = Rect.fromLTRB(-textWidth/2, -10-textFontSize/2, textWidth/2, 10+textFontSize/2);
    callback.call(rect);
  }

  int radius  = 30 ;
  @override
  void paint(Canvas canvas, Size size) {
    print("${size.width}  ${size.height}  ${radius}");
    canvas.translate(size.width/2, size.height/2);
    radius++;
    if(radius > 200)
      radius =0;
    //绘制表格
    /*double width = 160;
      for(double i = -width; i<= width; i+=10){
      _paint.strokeWidth = 1;
      _paint.color = Colors.grey;
      canvas.drawLine(Offset(width, i), Offset(-width, i), _paint);
      canvas.drawLine(Offset(i, -width), Offset(i, width), _paint);
    }*/
    //绘制坐标
    /*_paint.strokeWidth = 2;
    _paint.color = Colors.black;
    canvas.drawLine(Offset(width, 0), Offset(-width, 0), _paint);
    canvas.drawLine(Offset(0, -width), Offset(0, width), _paint);*/

    //绘制外圈
    _paint.strokeWidth = 1.5;
    _paint.color = Colors.blueAccent;
    _paint.style = PaintingStyle.stroke;
    canvas.drawCircle(Offset(0, 0), 100, _paint);
    canvas.drawCircle(Offset(0, 0), 120, _paint);

    canvas.drawCircle(Offset(0, 0), radius.toDouble(), _paint);

    //绘制六芒星
    _paint.color = Colors.redAccent;
    _path.moveTo(0, -100);
    _path.lineTo(0.85*100, 0.5*100);
    _path.lineTo(-0.85*100, 0.5*100);
    _path.lineTo(0, -100);
    _path.moveTo(0, 100);
    _path.lineTo(0.85*100, -0.5*100);
    _path.lineTo(-0.85*100, -0.5*100);
    _path.lineTo(0, 100);
    canvas.drawPath(_path, _paint);

    canvas.drawImage(_image, Offset(-_image.width/2,-_image.height/2), _paint);

    //绘制文字

    /*
    * 绘制文字有2种方式
    * 1.继承构造TextPainter，通过其的paint来绘制
    * */
    canvas.drawParagraph(paragraph, Offset(-textWidth/2,-textFontSize/2));

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  loadImage() async{
    _paint = Paint();
    await _loadImage('imgs/certification_icon.png').then((res) {
      _image = res;
    });
  }

  /// 加载图片
  Future<ui.Image> _loadImage(String path) async {
    var data = await rootBundle.load(path);
    var codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    var info = await codec.getNextFrame();
    return info.image;
  }
}

