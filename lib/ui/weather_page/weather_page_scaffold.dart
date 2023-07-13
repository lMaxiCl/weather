import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather/services/network/dioI.dart';
import 'package:weather/services/network/repository/weather_repository.dart';
import 'package:weather/ui/weather_page/bloc/city_search/city_search_bloc.dart';
import 'package:weather/ui/weather_page/search_bar.dart';
import 'package:weather/ui/weather_page/weather_info_list.dart';

import '../../services/location/location_service.dart';
import '../../services/network/repository/cities_repository.dart';
import 'bloc/weather/weather_page_bloc.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherPageBloc>(
          create: (BuildContext context) => WeatherPageBloc(
            repository: WeatherRepository(
              DioInstances.getDioWeatherInstance(),
            ),
          )..add(
              LoadWeatherForCity(GetIt.instance.get<LocationService>().city),
            ),
        ),
        BlocProvider(
          create: (BuildContext context) => CitySearchBloc(
            repository: CitiesRepository(
              DioInstances.getDioGeocodingInstance(),
            ),
          ),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          body: Column(children: [
            CitySearchFieldWidget(),
            const Expanded(
              child: WeatherInfoWidget(),
            ),
          ]),
        ),
      ),
    );
  }
}
