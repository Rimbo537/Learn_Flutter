import 'package:flutter/material.dart';

import 'screens/location_screen.dart';
//import 'screens/weather_forecast_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LocationScreen(),
    );
  }
}
