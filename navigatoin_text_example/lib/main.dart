import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: FirstHome(),
      // 2 способ передачи данных через RouteSettings
      // только с использованием маршрута
    // routes: {
    //   '/first': (context) => FirstHome(),
    //   '/second': (context) => SecondHome(),
    // },
    // 3 способ передачи данных
    onGenerateRoute: (settings) {
      switch (settings.name) {
        case '/':
        return MaterialPageRoute(builder: (context) => FirstHome());
        case '/second':
        User user = settings.arguments as User;
        return MaterialPageRoute(builder: (context) => SecondHome(user: user));
        default:
          return MaterialPageRoute(
            builder: (_) => Scaffold(
              body:
                  Center(child: Text('No route defined for ${settings.name}')),
            ),
          );
      }
    },
  ));
}

class FirstHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Home'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            User user = User(name: 'Ivan', age: 22);
            // 1 способ передачи данных
            // Route route = MaterialPageRoute(builder: (context) => SecondHome(user: user));
            // Navigator.push(context, route);

            // 2 способ передачи данных через RouteSettings
             Navigator.pushNamed(context, '/second', arguments: user);
          },
          child: Text('Second Home'),
        ),
      ),
    );
  }
}

class SecondHome extends StatelessWidget {
  late final User user;
  SecondHome({required this.user});
  @override
  Widget build(BuildContext context) {
    // 2 способ передачи данных
    // RouteSettings settings = ModalRoute.of(context)!.settings;
    // user = settings.arguments as User;
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.user.name} - ${this.user.age}'),
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

class User {
  final String name;
  final int age;

User({required this.name, required this.age});
}
