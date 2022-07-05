import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() {
    // TODO: implement createState
    return _SecondScreenState();
  }
}

class _SecondScreenState extends State<SecondScreen> {
  TextEditingController textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(32.0),
            child: TextField(
              controller: textFieldController,
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ),
          ElevatedButton(
            child: Text(
              'Send text back',
              style: TextStyle(fontSize: 24),
            ),
            onPressed: () {
              String textToSendBack = textFieldController.text;
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
