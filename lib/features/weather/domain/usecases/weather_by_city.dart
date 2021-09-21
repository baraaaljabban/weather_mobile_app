

import 'package:dartz/dartz.dart';
import 'package:weather/core/UseCases/use_cases.dart';
import 'package:weather/core/error/failures.dart';
import 'package:weather/features/weather/domain/entities/weather.dart';

class SearchWeatherByCitiy extends UseCase<List<Weather>, SearchWeatherByCitiyParams> {
  final WeatherRepository repository;
  SearchWeatherByCitiy({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<Weather>>> call({
    required SearchWeatherByCitiyParams params,
  }) async {
    return await repository.searchWeatherByCitiy(query: params.query);
  }
}

class SearchWeatherByCitiyParams {
  final String query;
  SearchWeatherByCitiyParams({
    required this.query,
  });
}
