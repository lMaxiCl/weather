part of 'city_search_bloc.dart';

abstract class CitySearchState extends Equatable {
  const CitySearchState();
}

class CitySearchInitial extends CitySearchState {
  @override
  List<Object> get props => [];
}

class CitySearchLoaded extends CitySearchState {
  final List<GeoCity> cities;

  const CitySearchLoaded(this.cities);

  @override
  List<Object> get props => [cities];
}
