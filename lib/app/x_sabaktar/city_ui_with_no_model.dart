import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kurs3_sabak8/app/app_constants/app_text_styles.dart';

import 'package:kurs3_sabak8/app/services/location/location_service.dart';
import 'package:kurs3_sabak8/app/views/get_weather_view.dart';
import 'package:kurs3_sabak8/app/widgets/progress_indicator.dart';

import 'package:kurs3_sabak8/app/services/weather/weather_service.dart';

//Flutter StatefulWidget lifecycle
class CityUiWithNoModel extends StatefulWidget {
  const CityUiWithNoModel({Key key}) : super(key: key);

  @override
  _CityUiWithNoModelState createState() => _CityUiWithNoModelState();
}

class _CityUiWithNoModelState extends State<CityUiWithNoModel> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cityNameController = TextEditingController();
  Position _position;

  bool isLoading = false;
  Map<String, dynamic> _data;
  int _tempCelcius = 0;
  String _cityName = 'Bishkek';
  String weatherIcon;
  String weatherMessage;

  @override
  void initState() {
    super.initState();
    print('initState');
    getLocation();
  }

  getLocation() async {
    setState(() {
      isLoading = true;
    });
    final _position = await LocationService().getCurrentLocation();
    _data = await weatherService.getWeatherByLocation(_position);

    double kelvin = _data['main']['temp'];

    _cityName = _data['name'];
    _tempCelcius = (kelvin - 273.15).round();

    print('_dataByLoc: ${_data['name']}');
    // await Future.delayed(Duration(seconds: 4));
    setState(() {
      isLoading = false;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //kodtor astinda jazilish kerke
    // getCurrentLocationV2();
    // showSnackbar();
    //contest aluu uchun kutkonu jardam beret
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _showMyDialog();
    // });

    print('didChangeDependencies');
  }

  void showSnackbar() {
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: const Text('snack'),
      duration: const Duration(seconds: 1),
      action: SnackBarAction(
        label: 'ACTION',
        onPressed: () {},
      ),
    ));
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Write your city'),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: TextFormField(
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Required field';
                  } else {
                    return null;
                  }
                },
                onChanged: (String danniy) {
                  // print('onChanged: $danniy');
                  // // _cityName = danniy;
                  // print('onChanged _cityName: $_cityName');
                },
                controller: _cityNameController,
                // onSaved: (String danniy) {
                //   print('validate');
                //   print('onSaved: $danniy');
                //   _cityName = danniy;
                // },
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                print(
                    '_cityNameController.text before validate: ${_cityNameController.text}');
                if (_formKey.currentState.validate()) {
                  print(
                      '_cityNameController.text after validate: ${_cityNameController.text}');
                  Navigator.of(context).pop(); //Dialogtu jap
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => CityByNameUI(
                  //       cityName: _cityNameController.text,
                  //       temp: _celcius, //bul jon gana misal uchun
                  //     ),
                  //   ),
                  // );
                }
                //Jani betke ot
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    //kodtor ustundo jazilish kerek
    print('dispose');
    super.dispose();
  }

  @override
  void deactivate() {
    //kodtor ustundo jazilish kerek
    print('deactivate');
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    print('build');

    return Scaffold(
      body: Scaffold(
        key: scaffoldKey,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/location_background.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.8), BlendMode.dstATop),
            ),
          ),
          constraints: BoxConstraints.expand(),
          child: isLoading
              ? circularProgress()
              : SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              final Position _pos =
                                  await locationService.getCurrentLocation();
                              _data = await weatherService
                                  .getWeatherByLocation(_pos);

                              _cityName = _data['name'];
                              double kelvin = _data['main']['temp'];
                              _tempCelcius = (kelvin - 273.15).round();

                              setState(() {
                                isLoading = false;
                              });
                            },
                            child: Icon(
                              Icons.near_me,
                              size: 50.0,
                            ),
                          ),
                          FlatButton(
                            onPressed: () async {
                              // _showMyDialog();
                              final _cityNameFromCityPage =
                                  await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return GetWeatherView();
                                  },
                                ),
                              );

                              print(
                                  '_cityNameFromCityPage: ${_cityNameFromCityPage.runtimeType}');

                              if (_cityNameFromCityPage != null) {
                                setState(() {
                                  isLoading = true;
                                });
                                _data =
                                    await weatherService.getWeatherByCityName(
                                        _cityNameFromCityPage);

                                _cityName = _data['name'];
                                double kelvin = _data['main']['temp'];
                                _tempCelcius = (kelvin - 273.15).round();

                                setState(() {
                                  isLoading = false;
                                });
                              }
                            },
                            child: Icon(
                              Icons.location_city,
                              size: 50.0,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              _tempCelcius.toString(),
                              style: AppTextStyles.kTempTextStyle,
                            ), //Model menen ishtegen
                            // Text(
                            //   '$_celcius',
                            //   style: kTempTextStyle,
                            // ),  //Model jasabay tuz ishtoo
                            Text(
                              '☀️',
                              style: AppTextStyles.kConditionTextStyle,
                            ), //Model mn ishtoo
                            // Text(
                            //   weatherIcon ?? '☀️',
                            //   style: kConditionTextStyle,
                            // ),//Model jok ishtoo
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 15.0),
                        child: Text(
                          'bugun jamgyr jaayt $_cityName',
                          textAlign: TextAlign.right,
                          style: AppTextStyles.kMessageTextStyle,
                        ),
                        // Text(
                        //   weatherMessage == null
                        //       ? 'Weather in $_cityName'
                        //       : '$weatherMessage in $_cityName',
                        //   textAlign: TextAlign.right,
                        //   style: kMessageTextStyle,
                        // ), //Model jok ishtoo
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

//OOP Object Oriented Programming language

//Model
//Class

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
    final dataFromServer = await WeatherService().getWeatherByCityName('osh');

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
