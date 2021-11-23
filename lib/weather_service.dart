import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:kurs3_sabak8/utilities/constants.dart';

class WeatherService {
  Future<Map<String, dynamic>> getWeatherByLocation(Position position) async {
    try {
      final String url =
          '$baseApiUrl?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey';
      // print('url: $url');
      final Uri uri = Uri.parse(url);

      final http.Response response = await http.get(uri);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final _data = json.decode(response.body) as Map<String, dynamic>;
        return _data;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> getWeather(String city) async {
    try {
      final String url = '$baseApiUrl?q=$city&appid=$apiKey';
      final Uri uri = Uri.parse(url);

      final http.Response response = await http.get(uri);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final _data = json.decode(response.body) as Map<String, dynamic>;
        return _data;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

final WeatherService weatherService = WeatherService();
