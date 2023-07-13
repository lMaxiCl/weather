import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:weather/services/location/location_service.dart';
import 'package:weather/ui/weather_page/weather_page_scaffold.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.instance.registerSingleton(LocationService());
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const WeatherPage(),
    );
  }
}
