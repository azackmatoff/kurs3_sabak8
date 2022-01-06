import 'package:geolocator/geolocator.dart';

import 'package:kurs3_sabak8/app/app_constants/app_constants.dart';
import 'package:kurs3_sabak8/app/utilities/http_utils/http_utils.dart';

class WeatherService {
  Future<Map<String, dynamic>> getWeatherByLocation(Position position) async {
    try {
      final String url =
          '${AppConstants.baseApiUrl}?lat=${position.latitude}&lon=${position.longitude}&appid=${AppConstants.apiKey}';

      return await HttpUtils.get(url);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<Map<String, dynamic>> getWeatherByCityName(String city) async {
    try {
      final String url =
          '${AppConstants.baseApiUrl}?q=$city&appid=${AppConstants.apiKey}';

      return await HttpUtils.get(url);
    } catch (e) {
      throw Exception(e);
    }
  }
}

final WeatherService weatherService = WeatherService();
