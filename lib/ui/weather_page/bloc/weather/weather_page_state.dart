part of 'weather_page_bloc.dart';

abstract class WeatherPageState extends Equatable {
  const WeatherPageState();
}

class WeatherPageLoading extends WeatherPageState {
  @override
  List<Object> get props => [];
}

class WeatherPageLoaded extends WeatherPageState {
  final List<Weather> weatherInfoList;

  const WeatherPageLoaded({required this.weatherInfoList});
  @override
  List<Object> get props => [weatherInfoList];
}
