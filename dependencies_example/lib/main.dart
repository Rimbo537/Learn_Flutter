import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var rowDate = DateTime(1483749600);
    var dateFormat = DateFormat('EEEE');
    print(dateFormat.format(rowDate));
    return MaterialApp(
      title: 'Dependencies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dependetcies & package'),
          centerTitle: true,
        ),
      ),
    );
  }
}
