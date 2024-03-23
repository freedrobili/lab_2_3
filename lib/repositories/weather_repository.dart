import 'dart:math';

import '../models/weather.dart';

abstract class WeatherRepository {
  Future<Weather?> fetchWeather(String cityName);
}

class FakeWeatherRepository implements WeatherRepository {
  final List<String> cities = [
    'Саранск',
    'Москва',
    'Санкт-Петербург',
    'Новосибирск',
    'Екатеринбург',
    'Уфа'
    'Нижний Новгород',
  ];

  @override
  Future<Weather?> fetchWeather(String cityName) {
    if (!cities.contains(cityName)) {
      return Future.delayed(const Duration(milliseconds: 500), () => null);
    }

    return Future.delayed(
      const Duration(seconds: 1),
          () {
        final random = Random();

        return Weather(
          cityName: cityName,
          temperatureCelsius: 20 + random.nextInt(15) + random.nextDouble(),
        );
      },
    );
  }
}

class NetworkException implements Exception {}
