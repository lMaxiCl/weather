import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/weather/weather_page_bloc.dart';
import 'forecast_item.dart';

class WeatherInfoWidget extends StatelessWidget {
  const WeatherInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherPageBloc, WeatherPageState>(
      builder: (context, state) {
        if (state is WeatherPageLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WeatherPageLoaded) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.weatherInfoList.length,
            itemBuilder: (context, index) {
              return ForecastItem(
                weatherInfo: state.weatherInfoList[index],
              );
            },
          );
        } else {
          //Error handling needs to be implemented.
          return const Center(
            child: Text("Something went wrong"),
          );
        }
      },
    );
  }
}
