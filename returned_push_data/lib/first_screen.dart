import 'package:flutter/material.dart';
import 'package:returned_push_data/second_screen.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() {
    // TODO: implement createState
    return _FirstScreenState();
  }
}

class _FirstScreenState extends State<FirstScreen> {
  String text = 'Some Text';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(32.0),
              child: Text(
                text,
                style: TextStyle(fontSize: 24),
              ),
            ),
            TextButton(
                child: Text(
                  'Go to second screen',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () {
                  _returnDataFromSecondScreen(context);
                })
          ],
        ),
      ),
    );
  }
}

void _returnDataFromSecondScreen(BuildContext context) async {
  Route route = MaterialPageRoute(builder: (context) => SecondScreen());
  final result = Navigator.push(context, route);

  setState(() {
    text = result;
  });
}
