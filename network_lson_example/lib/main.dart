import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Networking',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

@override
  void initState() {

    super.initState();
    LoadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Networking'),
      ),
      body: Container(),
    );
  }
}

Future<http.Response> getData() async {
  const url = 'https://about.google/static/data/locations.json';
  return await http.get(Uri.parse(url));
}

void LoadData() {
  getData().then((response) {
    if(response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.statusCode);
    }
  }).catchError((error) {
    debugPrint(error.toString());
  });
}