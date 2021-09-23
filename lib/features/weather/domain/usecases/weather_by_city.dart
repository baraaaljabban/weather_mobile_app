import 'package:dartz/dartz.dart';
import 'package:weather/core/UseCases/use_cases.dart';
import 'package:weather/core/error/failures.dart';
import 'package:weather/features/weather/domain/entities/weather.dart';
import 'package:weather/features/weather/domain/repositories/weather_repository.dart';

///call the `WeatherRepository` using the call method and get the response back
///`Either` `Failure` or `Weather` entity
class SearchWeatherByCity extends UseCase<Weather, SearchWeatherByCityParams> {
  final WeatherRepository repository;
  SearchWeatherByCity({
    required this.repository,
  });

  @override
  Future<Either<Failure, Weather>> call({
    required SearchWeatherByCityParams params,
  }) async {
    return await repository.getWeatherByCitiy(query: params.query);
  }
}

/// `SearchWeatherByCityParams` will take String and it's the search box String as `query`
class SearchWeatherByCityParams {
  final String query;
  SearchWeatherByCityParams({
    required this.query,
  });
}
