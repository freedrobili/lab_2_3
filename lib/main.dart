import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/weather/weather_cubit.dart';
import 'repositories/weather_repository.dart';
import 'screens/weather_search_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: BlocProvider(
        create: (context) => WeatherCubit(FakeWeatherRepository()),
        child: const WeatherSearchPage(),
      ),
    );
  }
}
