
import 'dart:convert';

import 'package:weather/features/weather/domain/entities/weather.dart';
part 'package:weather/features/weather/data/models/weather_consolidated_weather_model.dart';
part 'package:weather/features/weather/data/models/weather_parent_model.dart';
part 'package:weather/features/weather/data/models/weather_source_model.dart';

class WeatherByWoeidResponseModel extends Weather {
  covariant List<ConsolidatedWeatherModel> consolidatedWeatherModel;
  String responseTime;
  String responseSunRise;
  String responseSunSet;
  String responseTimezoneName;
  covariant ParentModel parentModel;
  covariant List<SourceModel> sourcesModel;
  String responseTitle;
  String responseLocationType;
  int responseWoeid;
  String responseLattLong;
  String responseTimezone;

  WeatherByWoeidResponseModel({
    required this.consolidatedWeatherModel,
    required this.responseTime,
    required this.responseSunRise,
    required this.responseSunSet,
    required this.responseTimezoneName,
    required this.parentModel,
    required this.sourcesModel,
    required this.responseTitle,
    required this.responseLocationType,
    required this.responseWoeid,
    required this.responseLattLong,
    required this.responseTimezone,
  }) : super(
          consolidatedWeather: consolidatedWeatherModel,
          time: responseTime,
          sunRise: responseSunRise,
          sunSet: responseSunSet,
          timezoneName: responseTimezoneName,
          parent: parentModel,
          // sources: sourcesModel,
          title: responseTitle,
          locationType: responseLocationType,
          woeid: responseWoeid,
          lattLong: responseLattLong,
          timezone: responseTimezone,
        );

  Map<String, dynamic> toMap() {
    return {
      'consolidated_weather': consolidatedWeatherModel.map((x) => x.toMap()).toList(),
      'time': responseTime,
      'sun_rise': responseSunRise,
      'sun_set': responseSunSet,
      'timezone_name': timezoneName,
      'parent': parentModel.toMap(),
      'sources': sourcesModel.map((x) => x.toMap()).toList(),
      'title': title,
      'location_type': responseLocationType,
      'woeid': responseWoeid,
      'latt_long': responseLattLong,
      'timezone': responseTimezone,
    };
  }

  factory WeatherByWoeidResponseModel.fromMap(Map<String, dynamic> map) {
    return WeatherByWoeidResponseModel(
      consolidatedWeatherModel:
          List<ConsolidatedWeatherModel>.from(map['consolidated_weather'].map((x) => ConsolidatedWeatherModel.fromMap(x))),
      responseTime: map['time'],
      responseSunRise: map['sun_rise'],
      responseSunSet: map['sun_set'],
      responseTimezoneName: map['timezone_name'],
      parentModel: ParentModel.fromMap(map['parent']),
      sourcesModel: List<SourceModel>.from(map['sources'].map((x) => SourceModel.fromMap(x))),
      responseTitle: map['title'],
      responseLocationType: map['location_type'],
      responseWoeid: map['woeid'],
      responseLattLong: map['latt_long'],
      responseTimezone: map['timezone'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherByWoeidResponseModel.fromJson(String source) => WeatherByWoeidResponseModel.fromMap(json.decode(source));
}



