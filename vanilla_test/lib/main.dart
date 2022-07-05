import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vanilla Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _raiting = 0;

  @override
  Widget build(BuildContext context) {
    double _size = 50;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Vanilla Demo',
        ),
      ),
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: IconButton(
              icon: (_raiting >= 2
                  ? Icon(
                      Icons.star,
                      size: _size,
                    )
                  : Icon(
                      Icons.star_border,
                      size: _size,
                    )),
              color: Colors.indigo[500],
              onPressed: () {
                setState(() {
                  _raiting = 1;
                });
              },
              iconSize: _size,
            ),
          ),
          Container(
            child: IconButton(
              icon: (_raiting >= 2
                  ? Icon(
                      Icons.star,
                      size: _size,
                    )
                  : Icon(
                      Icons.star_border,
                      size: _size,
                    )),
              color: Colors.indigo[500],
              onPressed: () {
                setState(() {
                  _raiting = 2;
                });
              },
              iconSize: _size,
            ),
          ),
          Container(
            child: IconButton(
              icon: (_raiting >= 3
                  ? Icon(
                      Icons.star,
                      size: _size,
                    )
                  : Icon(
                      Icons.star_border,
                      size: _size,
                    )),
              color: Colors.indigo[500],
              onPressed: () {
                setState(() {
                  _raiting = 3;
                });
              },
              iconSize: _size,
            ),
          ),
        ],
      )),
    );
  }
}
