import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepOrange,
        appBar: AppBar(
          title: Text('Weather Forecast'),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
        ),
        body: _buildBody(),
      ),
    );
  }
}

Widget _buildBody() {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.all(30.0),
        child: _headerText(),
      ),
      _temperatureCenter(),
      _temperatureInformation(),
      _temperatureHeader(),
      _myListView(),
    ],
  );
}

Column _headerText() {
  return Column(
    children: [
      Center(
        child: Text(
          'Kharkiv oblast, UA',
          style: TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 40.0,
            color: Colors.white,
          ),
        ),
      ),
      Text(
        'Friday, Mar 20, 2022',
        style: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 15,
          color: Colors.white,
        ),
      ),
    ],
  );
}

Row _temperatureCenter() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.wb_sunny,
        color: Colors.white,
        size: 70.0,
      ),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              '14 °F',
              style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 60.0,
                  color: Colors.white),
            ),
            Text(
              'LIGNT SNOW',
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 20.0,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    ],
  );
}

Row _temperatureInformation() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(
                Icons.air,
                size: 30.0,
                color: Colors.white,
              ),
              Text(
                '5',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
              Text(
                'km/hr',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(
                Icons.ac_unit,
                size: 30.0,
                color: Colors.white,
              ),
              Text(
                '3',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
              Text(
                '%',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(
                Icons.wb_sunny,
                size: 30.0,
                color: Colors.white,
              ),
              Text(
                '20',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
              Text(
                '%',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Container _temperatureHeader() {
  return Container(
    padding: EdgeInsets.only(top: 50.0),
    child: Center(
      child: Text(
        '7-DAY WEATHER FORECAST',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
          color: Colors.white,
        ),
      ),
    ),
  );
}

Widget _myListView() {
  return Container(
    height: 150,
    child: ListView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(10.0),
      itemExtent: 170,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Color.fromRGBO(255, 255, 255, 0.4),
          ),
          height: 100,
          width: 150,
          //padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.only(right: 10.0),
          child: ListTile(
            title: Text(
              'Friday',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Color.fromRGBO(255, 255, 255, 0.4),
          ),
          height: 100,
          width: 100,
          margin: EdgeInsets.only(right: 10.0),
          child: ListTile(
            title: Text(
              'Saturday',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Color.fromRGBO(255, 255, 255, 0.4),
          ),
          height: 100,
          width: 100,
          margin: EdgeInsets.only(right: 10.0),
          child: ListTile(
            title: Text(
              'Sunday',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Color.fromRGBO(255, 255, 255, 0.4),
          ),
          height: 100,
          width: 100,
          margin: EdgeInsets.only(right: 10.0),
          child: ListTile(
            title: Text(
              'Monday',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Color.fromRGBO(255, 255, 255, 0.4),
          ),
          height: 100,
          width: 100,
          margin: EdgeInsets.only(right: 10.0),
          child: ListTile(
            title: Text(
              'Tuesday',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Color.fromRGBO(255, 255, 255, 0.4),
          ),
          height: 100,
          width: 100,
          margin: EdgeInsets.only(right: 10.0),
          child: ListTile(
            title: Text(
              'Wednesday',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Color.fromRGBO(255, 255, 255, 0.4),
          ),
          height: 100,
          width: 100,
          child: ListTile(
            title: Text(
              'Thirsday',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    ),
  );
}
