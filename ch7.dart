import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
abstract class Person{
  List<String> names = ['irfan', 'usman', 'rehman', 'raza'];
}
extension Run on Person{
  void display()
  {
    for(var i=0; i<4; i++)
    {
      print(names[i]);
    }
  }
}
class Student extends Person{
  final int num1;
  final int num2;
  Student(this.num1, this.num2):super();
  factory Student.addition(){
    return Student(3, 4);
  }}
extension implement on Student{
  Future<int> Additons(){
    return Future.delayed(const Duration(seconds: 4), ()=>num1+num2+8);
}}
extension multipleTime on Student{
  Stream<int> multiply(){
    return Stream.periodic(const Duration(seconds : 1),(value) => num1*num2*4);
  }}
class Pair<A,B,C> extends Person{
  final A  a;   final B  b;    final C  c;
  Pair(this.a, this.b, this.c):super();
  factory Pair.printDetails(A a, B b, C c){
    return Pair(a, b, c);
  }
}

extension Addition on Student{
  void sum() {
    final int add =num1 + num2;
    print(add);
  }
}
void test() async
{
  final obj = Student.addition();
  obj.display();
  obj.sum();
  print(await obj.Additons());
  final obj2 = Pair.printDetails('irfan', 'usman', 3);

  var i=0;
  await for(final value in obj.multiply())
    {
      print(value);
          i++;
      if(i ==5)
        {
          break;
        }
    }
}

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
test();


    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
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
