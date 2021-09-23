import 'package:dartz/dartz.dart';
import 'package:weather/core/error/failures.dart';
import 'package:weather/features/weather/domain/entities/weather.dart';

abstract class WeatherRepository {
  ///will return `Either Failure or  Weather` and takes `String query` that is city name enterd by user
  Future<Either<Failure, Weather>> getWeatherByCitiy({required String query});
}
