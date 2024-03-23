import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/weather.dart';
import '../../repositories/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherCubit(this._weatherRepository) : super(WeatherInitial());

  Future<void> getWeather(String cityName) async {
    try {
      emit(const WeatherLoading());
      final weather = await _weatherRepository.fetchWeather(cityName);
      if (weather != null) {
        emit(WeatherLoaded(weather));
      } else {
        emit(const WeatherError("Город не найден"));
      }
    } on NetworkException {
      emit(const WeatherError("Не удалось получить данные о погоде. Проверьте подключение к сети"));
    }
  }

}
