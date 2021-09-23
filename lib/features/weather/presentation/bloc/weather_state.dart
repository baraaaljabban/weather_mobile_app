part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class Loading extends WeatherState {}

class Error extends WeatherState {
  final String message;
  Error({required this.message});
}

///this state is when user will select another day to see it's information
///so I would send the detailes of that day using this state
///taks list of days as `list` param and the detailed weather about a day
///as `consolidatedWeather` param
class DetailedDayWeatherState extends WeatherState {
  final ConsolidatedWeather consolidatedWeather;
  final List<ConsolidatedWeather> list;

  DetailedDayWeatherState({required this.consolidatedWeather, required this.list});
}
