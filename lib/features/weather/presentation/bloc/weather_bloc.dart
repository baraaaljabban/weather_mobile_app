import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather/core/AppStrings/error_strings.dart';
import 'package:weather/features/weather/domain/entities/weather.dart';
import 'package:weather/features/weather/export_weather_feature.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final SearchWeatherByCity usecase;
  String city = "";
  WeatherBloc({required this.usecase}) : super(WeatherInitial());
  late Weather weather;
  int indexOfSelectedDay = 0;
  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is SearchWeatherByCityEvent) {
      if ((event.params != null && event.params!.query.isNotEmpty) || city.isNotEmpty) {
        //here I'm passing either the city that the user enterd previously
        //so when pull to refresh happen I'll get the old value
        //and when the `event.params` is not null I'll get the value from it
        city = event.params != null ? event.params!.query : city;
        var params = SearchWeatherByCityParams(query: city.trim());
        yield Loading();
        final searchResult = await usecase(params: params);
        yield searchResult.fold(
          (l) {
            return Error(message: l.message);
          },
          (r) {
            weather = r;
            return DetailedDayWeatherState(consolidatedWeather: r.consolidatedWeather.first, list: r.consolidatedWeather);
          },
        );
      } else {
        // show error whene user did not enter anything to search for
        yield Error(message: EMPTY_QUERY);
      }
    } else if (event is SelectDayToShowWeatherDetails) {
      indexOfSelectedDay = event.indexOfDay;
      yield DetailedDayWeatherState(consolidatedWeather: weather.consolidatedWeather[event.indexOfDay], list: weather.consolidatedWeather);
    } else if (event is ChangeTempEvent) {
      //convert from Fahrenheit to celsius and the other way around
      for (var element in weather.consolidatedWeather) {
        //set the InFahrenheit to it's oppist
        element.isTempInCelsius = !element.isTempInCelsius;
        if (!element.isTempInCelsius) {
          element.theTemp = ((element.theTemp * 1.8) + 32).round();
          element.maxTemp = ((element.maxTemp * 1.8) + 32).round();
          element.minTemp = ((element.minTemp * 1.8) + 32).round();
        } else {
          element.theTemp = ((element.theTemp - 32) * 0.5556).round();
          element.maxTemp = ((element.maxTemp - 32) * 0.5556).round();
          element.minTemp = ((element.minTemp - 32) * 0.5556).round();
        }
      }
      yield DetailedDayWeatherState(
        consolidatedWeather: weather.consolidatedWeather[indexOfSelectedDay],
        list: weather.consolidatedWeather,
      );
    }
  }
}
