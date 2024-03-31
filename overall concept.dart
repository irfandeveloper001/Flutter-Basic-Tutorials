import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class Person extends Object{
  final int number;
  final String name;
  Person(this.number, this.name);
  factory Person.display()
  {
    return Person(0915, 'irfan');
  }
}
class Student extends Object{
  List<String?>? names;
  Student(names);
  factory Student.getDetails()
  {
    return Student('usman');
  }
  @override
  bool operator == (covariant Student other) => other.names == names;

  @override
  // TODO: implement hashCode
  int get hashCode => names.hashCode;


}
void test()
{
  final obj = Person.display();
  print(obj.number);
  print(obj.name);

  final obj1 = Student.getDetails();
  final name1 = Student('usman');
  if(obj1 == name1)
    {
      print('yes \' they are equal');
    }
  else
    {
      print('No \'  they ar enot equal');
    }
  final obj2 = Customer('Muhammad', 'Irfan', 'Shakil');
  print(obj2.fullName);

}
class Customer extends Object{
  final String fName;
  final String mName;
  final String lName;
  Customer(this.fName,this.mName, this.lName);
}
extension FullName on Customer{
  String get fullName => '$fName $mName $lName';
}
Future<int> multiplyByTen(int value)
{
  return Future.delayed(const Duration (seconds: 3), ()=>value* 10);
}
void test1() async{
  final calculation = await multiplyByTen(4);
  print(calculation);
}
Stream<String> getName(String name)
{
  return Stream.periodic(const Duration (seconds: 1) ,(value){
    return '$name';});
}
void test3() async{
  await for(final value in getName('irfan'))
    {
      print(value);
    }
    print('stream running finished');
}
Iterable<int> getOneToThree() sync*{
  yield 1;
  yield 2;
  yield 3;
}
void test4()
{
  for(final value in getOneToThree())
    {
      print(value);
      if(value == 2)
        {
          break;
        }
    }
}

class Pair<A, B, C>
{
  final A  value1;
  final B value2;
  final C value3;
  Pair(this.value1, this.value2, this.value3);
}
void test5()
{
  final obj = Pair('irfan', 2 , 'usman');
  print(obj.value1);
  print(obj.value2);
  print(obj.value3);
}
//  class Person {
//
//   final String name;
//   final int age;
//   final String gender;
//   Person(this.name, this.age, this.gender);
//   factory Person.getDetails()
//   {
//     return Person('irfan', 21, 'male');
//   }
//   void display()
//   {
//     print('Name: $name');
//     print('Age: $age');
//     print('Gender: $gender');
//   }
// }
// class childPerson extends Person{
//    final String n;
//    childPerson(this.n) : super('AK', 20, 'female');
//   List<int?>? num = [null ,  12, null, 20];
//   void operations() {
//     final lengthOfList = num?.length ?? 0;
//     print(lengthOfList);
//
//     for(var i=0; i<lengthOfList; i++) {
//          final int? finds = num[i] ?? (i+1 <lengthOfList ? num[i+1]:null);
//     }
//   }
//  }
// class Children extends Person{
//   final obj = Children();
//   final obj2 = Person();
//  @override
//   display(){
//     print('Name: $this.name');
//     print('Age: $this.age');
//     print('Gender: $this.gender');
//   }
//   @override
//   bool operator ==(covariant Children other) =>  other.display(name, age, gender) == obj2.display(name,age,gender);
//
//   @override
//   // TODO: implement hashCode
//   int get hashCode => obj.hashCode;
//
//
// }
// void test()
// {
//   final obj = Person.getDetails();
//   final obj2 = childPerson('re');
//   obj2.display();
//   obj2.operations();
// }
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
 test();
 test1();
 //test3();
 test4();
 test5();


    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
