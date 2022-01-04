// Model menen ishtoo
// ozuncho data turu jasap alabiz, class, model, object
// OOP = Object Oriented Programming

import 'package:kurs3_sabak8/app/utilities/weather_util.dart';

class WeatherModel {
  final String cityName;
  final int celcius;
  final double kelvin;
  final String icon;
  final String message;

  WeatherModel({
    this.cityName,
    this.celcius,
    this.kelvin,
    this.icon,
    this.message,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      kelvin: json['main']['temp'],
      celcius: weatherUtil.kelvinToCelcius(json['main']['temp']),
      message: weatherUtil.getWeatherMessage(
        weatherUtil.kelvinToCelcius(json['main']['temp']),
      ),
      icon: weatherUtil.getWeatherIcon(
        (weatherUtil.intToDouble(json['main']['temp'])).round(),
      ),
    );
  }
}
