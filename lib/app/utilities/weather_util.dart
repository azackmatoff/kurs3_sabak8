class WeatherUtil {
  double intToDouble(dynamic val) {
    if (val.runtimeType == double) {
      return val;
    } else if (val.runtimeType == int) {
      return val.toDouble();
    } else {
      throw Exception("value is not of type 'int' or 'double' got type '" +
          val.runtimeType.toString() +
          "'");
    }
  }

  int kelvinToCelcius(double kelvin) {
    return (kelvin - 273.15).round();
  }

  String getWeatherMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }
}

final WeatherUtil weatherUtil = WeatherUtil();
