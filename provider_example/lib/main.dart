import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<CountProvider>.value(
            value: CountProvider(),
          ),
          FutureProvider<List<User>>(
            initialData: [],
              create: (_) async => UserProvider().loadUserData()),
          StreamProvider(
              create: (_) => EventProvider().intStream(), initialData: 0),
        ],
        child: DefaultTabController(
          length: 3,
          child: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                title: Text('Provider Demo'),
                centerTitle: true,
                bottom: TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.add)),
                    Tab(icon: Icon(Icons.person)),
                    Tab(icon: Icon(Icons.message)),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  MyCountPage(),
                  MyUserPage(),
                  MyEventPage(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyCountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CountProvider _state = Provider.of<CountProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ChangeNotiferProvider Example',
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 50),
            Text('${_state.counterValue}',
                style: Theme.of(context).textTheme.headline4),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => _state._decrementCount(),
                  icon: Icon(Icons.remove),
                  color: Colors.red,
                ),
                Consumer<CountProvider>(
                  builder: (context, value, child) {
                    return IconButton(
                      onPressed: () => value._incrementCount(),
                      icon: Icon(Icons.add),
                      color: Colors.green,
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'FutureProvider Example, users loaded from a file',
            style: TextStyle(fontSize: 17),
          ),
        ),
        Consumer(builder: (context, List<User> users, _) {
          return Expanded(
            child: users.isEmpty
                ? Container(
                    child: Center(child: CircularProgressIndicator()),
                  )
                : ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 50,
                        color: Colors.grey[(index * 200) % 400],
                        child: Center(
                          child: Text(
                              '${users[index].firstName} ${users[index].lastName} ${users[index].website}'),
                        ),
                      );
                    },
                  ),
          );
        })
      ],
    );
  }
}

class MyEventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _value = Provider.of<int>(context);
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'StreamProvider Example',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              '${_value.toString()}',
              style: Theme.of(context).textTheme.headline4,
            )
          ],
        ),
      ),
    );
  }
}

// CountProvider (ChangeNotifer)
class CountProvider extends ChangeNotifier {
  int _count = 0;
  int get counterValue => _count;

  void _incrementCount() {
    _count++;
    notifyListeners();
  }

  void _decrementCount() {
    _count--;
    notifyListeners();
  }
}

class UserProvider {
  final String _dataPath = "assets/users.json";
  late List<User> users = [];

  Future<String> loadAsset() async {
    return await Future.delayed(Duration(seconds: 2), () async {
      return await rootBundle.loadString(_dataPath);
    });
  }

  Future<List<User>> loadUserData() async {
    var dataString = await loadAsset();
    Map<String, dynamic> jsonUserData = jsonDecode(dataString);
    users = UserList.fromJson(jsonUserData['users']).users;
    return users;
  }
}

class EventProvider {
  Stream<int> intStream() {
    Duration interval = Duration(seconds: 2);
    return Stream<int>.periodic(interval, (int _count) => _count++);
  }
}

class User {
  final String firstName, lastName, website;
  const User(this.firstName, this.lastName, this.website);

  User.fromJson(Map<String, dynamic> json)
      : this.firstName = json['first_name'],
        this.lastName = json['last_name'],
        this.website = json['website'];
}

class UserList {
  final List<User> users;
  UserList(this.users);

  UserList.fromJson(List<dynamic> usersJson)
      : users = usersJson.map((user) => User.fromJson(user)).toList();
}
