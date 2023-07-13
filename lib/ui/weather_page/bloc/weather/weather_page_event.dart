part of 'weather_page_bloc.dart';

abstract class WeatherPageEvent extends Equatable {
  const WeatherPageEvent();
}

class LoadWeatherForCity extends WeatherPageEvent {
  final City city;

  const LoadWeatherForCity(this.city);

  @override
  List<Object> get props => [city];
}
