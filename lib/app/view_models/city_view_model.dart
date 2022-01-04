import 'package:geolocator/geolocator.dart';
import 'package:kurs3_sabak8/app/models/weather_model.dart';
import 'package:kurs3_sabak8/app/repositories/location/location_repo.dart';
import 'package:kurs3_sabak8/app/repositories/weather/weather_repo.dart';

class CityViewModel {
  WeatherModel _weatherModel;
  WeatherModel get getWeatherModel => _weatherModel;

  getLocationAndWeather() async {
    final _position = await locationRepo.getCurrentLocation();
    _weatherModel = await weatherRepo.getWeatherByLocation(_position);
  }

  getWeatherByCityname(String cityName) async {
    _weatherModel = await weatherRepo.getWeatherByCityName(cityName);
  }
}

final CityViewModel cityViewModel = CityViewModel();
