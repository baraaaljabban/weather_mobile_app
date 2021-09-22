part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

///this event is for the user to input the city name
///using`[params]` `SearchWeatherByCityParams`
class SearchWeatherByCityEvent extends WeatherEvent {
  final SearchWeatherByCityParams? params;
  SearchWeatherByCityEvent({this.params});
}

///this even it to call when user select another day to show it's infromation in deatils
///will take `index` as [int] represent the index of selected item
class SelectDayToShowWeatherDetails extends WeatherEvent {
  final int indexOfDay;
  //or we can put the weather as it is from the list and we can show it's information

  SelectDayToShowWeatherDetails({required this.indexOfDay});
}
