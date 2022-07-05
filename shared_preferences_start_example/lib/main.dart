import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SharedPreferenceExample(),
    );
  }
}

class SharedPreferenceExample extends StatefulWidget {
  const SharedPreferenceExample({Key? key}) : super(key: key);

  @override
  State<SharedPreferenceExample> createState() =>
      _SharedPreferenceExampleState();
}

class _SharedPreferenceExampleState extends State<SharedPreferenceExample> {
  late SharedPreferences _prefs;

  static const String kNumberPrefKey = 'number_pref';
  static const String kBoolPrefKey = 'bool_pref';

  int _numberPref = 0;
  bool _boolPref = false;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance()
      ..then((prefs) {
        setState(() => this._prefs = prefs);
        _loadNumberPref();
        _loadBoolPref();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preference'),
      ),
      body: Column(
        children: [
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(children: [
                Text('Number Preference'),
                Text('${this._numberPref}'),
                ElevatedButton(
                    onPressed: () => this._setNumberPref(this._numberPref + 1),
                    child: Text('Increment'))
              ]),
              TableRow(
                children: [
                  Text('Boolean Preference'),
                  Text('${this._boolPref}'),
                  ElevatedButton(
                    onPressed: () => this._setBoolPref(!this._boolPref),
                    child: Text('Toogle'),
                  ),
                ],
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () => this._resetDataPref(),
            child: Text('Reset Data'),
          ),
        ],
      ),
    );
  }

  Future<Null> _setNumberPref(int value) async {
    await this._prefs.setInt(kNumberPrefKey, value);
    _loadNumberPref();
  }

  Future<Null> _setBoolPref(bool value) async {
    await this._prefs.setBool(kBoolPrefKey, value);
    _loadBoolPref();
  }

  void _loadNumberPref() {
    setState(() {
      this._numberPref = this._prefs.getInt(kNumberPrefKey) ?? 0;
    });
  }

  void _loadBoolPref() {
    setState(() {
      this._boolPref = this._prefs.getBool(kBoolPrefKey) ?? false;
    });
  }

  Future<Null> _resetDataPref() async {
    await this._prefs.remove(kNumberPrefKey);
    await this._prefs.remove(kBoolPrefKey);
    _loadNumberPref();
    _loadBoolPref();
  }
}
