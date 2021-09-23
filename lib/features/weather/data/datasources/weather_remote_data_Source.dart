// ignore_for_file: file_names
import 'dart:convert';

import 'package:weather/core/Network/http_client.dart';
import 'package:weather/core/Network/response.dart';
import 'package:weather/core/error/exceptions.dart';
import 'package:weather/features/weather/data/models/weather_by_search_response_model.dart';
import 'package:weather/features/weather/export_weather_feature.dart';

///this class has 2 methods and it's responsable for `HTTP calling`
///
///1) [getWeatherByCitiy] that takes `String query` represent the city name and return `WeatherBySearchResponseModel`
///
///2) [getWeatherByWoeid] that will take `int woeid` represent the id of city and that we got it from the first method
///[getWeatherByCitiy] and will return `WeatherByWoeidResponseModel`
abstract class WeatherRemoteDataSrouce {
  ///taks  `String query` "the name of the city enterd by user"
  ///return `WeatherBySearchResponseModel` that contains `woeid` (where on earth ID)
  Future<WeatherBySearchResponseModel> getWeatherByCitiy({
    required String query,
  });

  /// will take `woeid` and will return `WeatherByWoeidResponseModel` that contain list of weahter days
  Future<WeatherByWoeidResponseModel> getWeatherByWoeid({
    required int woeid,
  });
}

class WeatherRemoteDataSrouceImpl extends WeatherRemoteDataSrouce {
  final HttpHelper client;
  WeatherRemoteDataSrouceImpl({
    required this.client,
  });

  @override
  Future<WeatherBySearchResponseModel> getWeatherByCitiy({required String query}) async {
    final String path = "/search/?query=$query";
    try {
      final respone = await client.get(path: path);
      final WeatherBySearchResponseModel response = WeatherBySearchResponseModel.fromMap(json.decode(respone.body));
      if (respone.statusCode == RESPONSE_SUCCESS) {
        return response;
      } else {
        throw ServerException(message: respone.reasonPhrase.toString());
      }
    } on ServerException catch (e) {
      throw ServerException(message: e.message.toString());
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<WeatherByWoeidResponseModel> getWeatherByWoeid({required int woeid}) async {
    final String path = "/$woeid/";
    try {
      final respone = await client.get(path: path);
      final WeatherByWoeidResponseModel response = WeatherByWoeidResponseModel.fromJson(
        utf8.decode(respone.bodyBytes),
      );
      if (respone.statusCode == RESPONSE_SUCCESS) {
        return response;
      } else {
        throw ServerException(message: respone.reasonPhrase.toString());
      }
    } on ServerException catch (e) {
      throw ServerException(message: e.message.toString());
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
