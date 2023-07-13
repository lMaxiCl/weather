part of 'city_search_bloc.dart';

abstract class CitySearchEvent extends Equatable {
  const CitySearchEvent();
}

class SearchCity extends CitySearchEvent {
  final String cityName;

  const SearchCity(this.cityName);

  @override
  List<Object> get props => [cityName];
}

class ClearSearch extends CitySearchEvent {
  @override
  List<Object> get props => [];
}
