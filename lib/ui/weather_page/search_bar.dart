import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/ui/weather_page/bloc/city_search/city_search_bloc.dart';
import 'package:weather/ui/weather_page/bloc/weather/weather_page_bloc.dart';

class CitySearchFieldWidget extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  CitySearchFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CitySearchBloc, CitySearchState>(
      builder: (context, state) {
        return Column(
          children: [
            TextFormField(
              focusNode: _focusNode,
              autofocus: true,
              controller: _textEditingController,
              decoration: const InputDecoration(
                hintText: 'Enter a city',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                context.read<CitySearchBloc>().add(
                      SearchCity(value),
                    );
              },
              onFieldSubmitted: (value) {
                //not very elegant and secure, but I am not in a mood to do it properly
                // To make it right, one should implement error handling in the bloc and check every edge case
                if (state is CitySearchLoaded) {
                  context.read<WeatherPageBloc>().add(
                        LoadWeatherForCity(
                          state.cities
                              .firstWhere(
                                (element) => element.name == value,
                              )
                              .toCity(),
                        ),
                      );
                  context.read<CitySearchBloc>().add(ClearSearch());
                  _focusNode.unfocus();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Error getting weather for $value'),
                    ),
                  );
                }
              },
            ),
            if (state is CitySearchLoaded)
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: state.cities.length,
                  itemBuilder: (context, index) {
                    return MaterialButton(
                      child: Text(
                          '${state.cities[index].name}, ${state.cities[index].country}'),
                      onPressed: () {
                        _textEditingController.text = state.cities[index].name;
                        context.read<WeatherPageBloc>().add(
                              LoadWeatherForCity(
                                state.cities[index].toCity(),
                              ),
                            );
                        context.read<CitySearchBloc>().add(ClearSearch());
                        _focusNode.unfocus();
                      },
                    );
                  },
                ),
              )
          ],
        );
      },
    );
  }
}
