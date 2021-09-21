import 'package:dartz/dartz.dart';
import 'package:weather/core/AppStrings/error_strings.dart';

import 'package:weather/core/Network/network_info.dart';
import 'package:weather/core/error/exceptions.dart';
import 'package:weather/core/error/failures.dart';
import 'package:weather/features/weather/data/datasources/weather_remote_data_Source.dart';
import 'package:weather/features/weather/domain/entities/weather.dart';
import 'package:weather/features/weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final NetworkInfo networkInfo;
  final WeatherRemoteDataSrouce remoteDataSrouce;
  WeatherRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSrouce,
  });

  @override
  Future<Either<Failure, Weather>> getWeatherByCitiy({required String query}) async {
    if (await networkInfo.isConnected()) {
      try {
        final getWeatherByCitiyResult = await remoteDataSrouce.getWeatherByCitiy(query: query);
        final getWeatherByWoeidResult = await remoteDataSrouce.getWeatherByWoeid(woeid: getWeatherByCitiyResult.woeid);
        return Right(getWeatherByWoeidResult);
      } on ServerException catch (e) {
        return Left(UnExpectedServerResponseFailure(e.message));
      } catch (e) {
        return Left(UnknownFailuer(message: e.toString()));
      }
    } else {
      return Left(InternetConnectionFailure(NO_INTERNET));
    }
  }
}
