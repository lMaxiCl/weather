import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/transformers.dart';
import 'package:weather/services/network/repository/cities_repository.dart';

import '../../../../services/network/data/city.dart';

part 'city_search_event.dart';
part 'city_search_state.dart';

class CitySearchBloc extends Bloc<CitySearchEvent, CitySearchState> {
  final CitiesRepository repository;
  CitySearchBloc({required this.repository}) : super(CitySearchInitial()) {
    on<SearchCity>(
      (event, emit) async {
        if (event.cityName.isEmpty) {
          emit(CitySearchInitial());
        } else {
          var result = await repository.queryCities(event.cityName);
          emit(CitySearchLoaded(result));
        }
      },
      transformer: (events, mapper) => events
          .debounceTime(
            const Duration(seconds: 1),
          )
          .asyncExpand(mapper),
    );
    on<ClearSearch>(
      (event, emit) => emit(
        CitySearchInitial(),
      ),
    );
  }
}
