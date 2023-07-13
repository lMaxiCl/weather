import 'package:flutter/material.dart';

import '../../services/network/data/weather.dart';

class ForecastItem extends StatelessWidget {
  final Weather weatherInfo;
  const ForecastItem({required this.weatherInfo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //my design choice is a cli:)
          Text(
              DateTime.fromMillisecondsSinceEpoch(weatherInfo.date).toString()),
          Text('morningTemp: ${weatherInfo.temp.morn}'),
          Text('dayTemp: ${weatherInfo.temp.day}'),
          Text('eveningTemp: ${weatherInfo.temp.eve}'),
          Text('nightTemp: ${weatherInfo.temp.night}'),
          Text('minTemp: ${weatherInfo.temp.min}'),
          Text('maxTemp: ${weatherInfo.temp.max}'),
          Text(weatherInfo.weather[0].main,
              style: const TextStyle(fontSize: 30)),
          Text(weatherInfo.weather[0].description),
        ],
      ),
    );
  }
}
