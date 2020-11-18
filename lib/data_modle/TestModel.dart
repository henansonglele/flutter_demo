class TestModel{
  final String name;
//   String name;

//  TestModel(String name){//
//    this.name = name;
//  }

  const TestModel(this.name);//工厂方法构造函数  常量构造函数）  如果你的类提供一个状态不变的对象，你可以把这些对象 定义为编译时常量。要实现这个功能，需要定义一个 const 构造函数， 并且声明所有类的变量为 final

//
//  factory TestModel(String name){//工厂方法构造函数  果一个构造函数并不总是返回一个新的对象，则使用 factory 来定义 这个构造函数。例如，一个工厂构造函数 可能从缓存中获取一个实例并返回
//    final symbol = new TestModel(name);
////    final symbol = new TestModel._internal(name);
//    return symbol;
//  }

  TestModel._internal(this.name);

  TestModel.name(this.name);//构造函数
  TestModel.x(String ss):this(ss);//重定向构造函数


  TestModel.fromJson(Map jsonMap)//命名构造函数
      : name = jsonMap['name']{
    print('In Point.fromJson(): ($name)');

  }
}



testEnum(){
  Fruit.apple.index;
  Fruit.values;
}

class Person {
  // In the interface, but visible only in this library.
  final _name;

  // Not in the interface, since this is a constructor.
  Person(this._name);

  // In the interface.
  String greet(who) => 'Hello, $who. I am $_name.';
}

// An implementation of the Person interface.
class Imposter implements Person {//每个类都隐式的定义了一个包含所有实例成员的接口
  // We have to define this, but we don't use it.
  final _name = "";

  String greet(who) => 'Hi $who. Do you know who I am?';
}


enum Fruit{//枚举
  apple,
  peach,
  orange
}

//声明异步方法 ，异步方法调用会立即返回一个future或者stream
checkVersion() async {
   print("----");
  // ...
}

dealawait()  {
  print("dealawait");
  // ...
}
testAwait() async{//await 必须放在async中，因为await会阻塞进程，所以要异步执行他。
 var result =  await dealawait();

}

Future<String> testasyn() async{
  return "字符串不是fruture";
}

dealasyn(){
  Future<String> f = testasyn();
}
//在 await expression 中， expression 的返回值通常是一个 Future； 如果返回的值不是 Future，
// 则 Dart 会自动把该值放到 Future 中返回。
// Future 对象代表返回一个对象的承诺（promise）。 await expression 执行的结果为这个返回的对象。
// await expression 会阻塞住，直到需要的对象返回为止。
