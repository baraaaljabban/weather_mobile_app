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
  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is SearchWeatherByCityEvent) {
      yield Loading();
      final searchResult = await usecase(params: event.params);
      yield searchResult.fold(
        (l) => Error(message: l.message),
        (r) => SearchResultState(weather: r),
      );
    }
  }
}
