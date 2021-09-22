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
class DetailedDayWeatherState extends WeatherState {
  final ConsolidatedWeather consolidatedWeather;
  final List<ConsolidatedWeather> list;

  DetailedDayWeatherState({required this.consolidatedWeather,required this.list});
}

// class ListDaysWeather extends WeatherState {
//   final List<ConsolidatedWeather> consolidatedWeather;
//   ListDaysWeather({required this.consolidatedWeather});
// }

/// this state is once loading finished after user typed the city name will show the weather for that city
// class SearchResultState extends WeatherState {
//   final Weather weather;
//   SearchResultState({required this.weather});
// }
