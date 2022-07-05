import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[300],
        appBar: AppBar(
          title: Center(
            child: Text(
              'Counter',
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Tap '-' to decrement",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Container(
                color: Colors.blue[200],
                alignment: Alignment.center,
                width: 210,
                height: 70,
              ),
              Text("Tap '+' to increment",
                style: TextStyle(
                  color: Colors.white,
                ),),
            ],
          ),
        ),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CounterWidgetState();
  }
}

class _CounterWidgetState extends State<CounterWidget> {
  late int _count;

  @override
  void initState() {
    _count = 50;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(),
    );
  }
}
