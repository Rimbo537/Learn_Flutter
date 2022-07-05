import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'IndieFlower'),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Beautiful Dasha'),
        ),
        body: Center(
          // child: Stack(
          //   fit: StackFit.expand,
          //   children: <Widget>[
            child:  Column(
              children: [
                Image(
                    image: AssetImage('assets/images/bg.jpg'),
                  ),
              ],
            ),
              
          //   ],
          // ),
        ),
      ),
    );
  }
}
