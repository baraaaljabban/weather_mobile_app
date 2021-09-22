part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class SearchWeatherByCityEvent extends WeatherEvent {
  final SearchWeatherByCityParams params;
  SearchWeatherByCityEvent({required this.params});
}
