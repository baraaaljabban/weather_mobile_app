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
    //so first of all I'm checking if the user is connected to the internet or not
    if (await networkInfo.isConnected()) {
      try {
        // first call the `getWeatherByCitiy` to get the [woeid] that we will use it to fetch
        //weather days List and other info
        final getWeatherByCitiyResult = await remoteDataSrouce.getWeatherByCitiy(query: query);
        //will return Failuer if there is no result from search
        if (getWeatherByCitiyResult.weatherSearchList.isEmpty) return Left(NoResultFound());
        //call getWeatherByWoeid and pass the `woeid` that we got from the first call
        final getWeatherByWoeidResult =
            await remoteDataSrouce.getWeatherByWoeid(woeid: getWeatherByCitiyResult.weatherSearchList.first.woeid);
        //if there was no result then return NoResult
        if (getWeatherByWoeidResult.consolidatedWeatherModel.isEmpty) return Left(NoResultFound());
        // other than that we return our call as Weather entity class
        return Right(getWeatherByWoeidResult);
      }
      //if we got any Exception from the previouse layer we return Failure
      on ServerException catch (e) {
        return Left(UnExpectedServerResponseFailure(e.message));
      }
      //this might happen if there was error  other than the server side error
      catch (e) {
        return Left(UnknownFailuer(message: e.toString()));
      }
    }
    //here it means that the user has no Connection
    else {
      return Left(InternetConnectionFailure(NO_INTERNET));
    }
  }
}
