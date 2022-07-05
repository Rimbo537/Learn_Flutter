import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Routing and Navigation'),
          centerTitle: true,
        ),
        body: HomePage(),
      ),
      initialRoute: '/page2',
      routes: {
        '/page2': (context) => Page2(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Simple navigation
          Route route = MaterialPageRoute(builder: (context) => Page2());
          Navigator.push(context, route);
          // Navigator.pushNamed(context, '/page2');
        },
        child: Text('Move to page 2"'),
      ),
    );
  }
}

class Page2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go Back'),
        ),
      ),
    );
  }
}
