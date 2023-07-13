import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/services/network/data/city.dart';

import '../../../../services/network/data/weather.dart';
import '../../../../services/network/repository/weather_repository.dart';

part 'weather_page_event.dart';
part 'weather_page_state.dart';

class WeatherPageBloc extends Bloc<WeatherPageEvent, WeatherPageState> {
  final WeatherRepository repository;
  WeatherPageBloc({required this.repository}) : super(WeatherPageLoading()) {
    on<LoadWeatherForCity>((event, emit) async {
      emit(WeatherPageLoading());
      var forecast = await repository.getForecastByLatLong(
          event.city.coord.lat, event.city.coord.lon);
      emit(
        WeatherPageLoaded(weatherInfoList: forecast.list),
      );
    });
  }
}
