import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          
        });
      },
      child: Scaffold(
          backgroundColor: Color.fromRGBO(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1),
          body: const Center(
            child: Text(
              "Hey there",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                 ),
              textDirection: TextDirection.ltr,
            ),
          ),
       ),
    );
  }
}