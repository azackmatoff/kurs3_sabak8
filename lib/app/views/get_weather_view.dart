import 'package:flutter/material.dart';
import 'package:kurs3_sabak8/app/app_constants/app_text_styles.dart';

class GetWeatherView extends StatefulWidget {
  @override
  _GetWeatherViewState createState() => _GetWeatherViewState();
}

class _GetWeatherViewState extends State<GetWeatherView> {
  String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: AppTextStyles.kTextFieldInputDecoration,
                  onChanged: (value) {
                    print('value: $value');
                    cityName = value;
                    print('cityname: $cityName');
                  },
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context, cityName);
                },
                child: Text(
                  'Get Weather',
                  style: AppTextStyles.kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
