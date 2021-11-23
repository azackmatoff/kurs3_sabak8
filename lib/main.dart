import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:kurs3_sabak8/city_ui.dart';

import 'package:kurs3_sabak8/weather_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: CityUI(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, dynamic> okuuchular = {
    'okuuchular': [
      {
        'name': 'Bobrov Sergey',
        'baa': 5,
        'age': 14,
        'male': true,
      },
      {
        'name': 'Jon Doe',
        'baa': 5,
        'age': 14,
        'male': true,
      },
      {
        'name': 'Jane Doe',
        'baa': 5,
        'age': 14,
        'male': false,
      }
    ],
    'mektep': [],
  };

  @override
  void initState() {
    super.initState();
    printWeather();
  }

  printWeather() async {
    final dataFromServer = await WeatherService().getWeather('osh');

    print('dataFromServer: $dataFromServer');
  }

// Synchronous programming
  void print1() {
    print('print1 =========================');
    print('okuuchular: $okuuchular');
    print('=========================');
    print('okuuchular[okuuchular]: ${okuuchular['okuuchular']}');
    print('=========================');
    print(
        'okuuchular[okuuchular][2][male]: ${okuuchular['okuuchular'][2]['male']}');
  }

// Asynchronous programming, Asinhronnoe programmirovanie
  Future<void> print2() async {
    await Future.delayed(Duration(seconds: 5));
    print('print2 =========================');
    print('_counter: $_counter');
  }

  print3() {
    Timer(Duration(seconds: 5), () {
      print('print3 =========================');
      print('_counter: $_counter');
    });
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
