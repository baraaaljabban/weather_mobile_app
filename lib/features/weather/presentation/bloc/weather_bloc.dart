import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather/features/weather/domain/entities/weather.dart';
import 'package:weather/features/weather/export_weather_feature.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final SearchWeatherByCity usecase;
  WeatherBloc({required this.usecase}) : super(WeatherInitial());
  late Weather weather;
  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is SearchWeatherByCityEvent) {
      yield Loading();
      final searchResult = await usecase(params: event.params);
      yield* searchResult.fold(
        (l) async* {
          yield Error(message: l.message);
        },
        (r) async* {
          weather = r;
          yield SearchResultState(weather: r);
          yield DetailedDayWeatherState(consolidatedWeather: r.consolidatedWeather.first, list: r.consolidatedWeather);
        },
      );
    } else if (event is SelectDayToShowWeatherDetails) {
      yield DetailedDayWeatherState(consolidatedWeather: weather.consolidatedWeather[event.indexOfDay],list: weather.consolidatedWeather);
    }
  }
}
