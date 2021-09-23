// ignore_for_file: file_names
import 'dart:convert';

import 'package:weather/core/Network/http_client.dart';
import 'package:weather/core/Network/response.dart';
import 'package:weather/core/error/exceptions.dart';
import 'package:weather/features/weather/data/models/weather_by_search_response_model.dart';
import 'package:weather/features/weather/export_weather_feature.dart';

abstract class WeatherRemoteDataSrouce {
  Future<WeatherBySearchResponseModel> getWeatherByCitiy({
    required String query,
  });

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
