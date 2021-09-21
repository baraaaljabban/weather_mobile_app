// ignore_for_file: annotate_overrides, non_constant_identifier_names

import 'dart:convert';

import 'package:weather/features/weather/domain/entities/weather.dart';

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
          sources: sourcesModel,
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

class ConsolidatedWeatherModel extends ConsolidatedWeather {
  int consolidatedId;
  String consolidatedWeatherStateName;
  String consolidatedWeatherStateAbbr;
  String consolidatedWindDirectionCompass;
  String consolidatedCreated;
  String consolidatedApplicableDate;
  double consolidatedMinTemp;
  double consolidatedMaxTemp;
  double consolidatedTheTemp;
  double consolidatedWindSpeed;
  double consolidatedWindDirection;
  double consolidatedAirPressure;
  int consolidatedHumidity;
  double consolidatedVisibility;
  int consolidatedPredictability;

  ConsolidatedWeatherModel({
    required this.consolidatedId,
    required this.consolidatedWeatherStateName,
    required this.consolidatedWeatherStateAbbr,
    required this.consolidatedWindDirectionCompass,
    required this.consolidatedCreated,
    required this.consolidatedApplicableDate,
    required this.consolidatedMinTemp,
    required this.consolidatedMaxTemp,
    required this.consolidatedTheTemp,
    required this.consolidatedWindSpeed,
    required this.consolidatedWindDirection,
    required this.consolidatedAirPressure,
    required this.consolidatedHumidity,
    required this.consolidatedVisibility,
    required this.consolidatedPredictability,
  }) : super(
          id: consolidatedId,
          weatherStateName: consolidatedWeatherStateName,
          weatherStateAbbr: consolidatedWeatherStateAbbr,
          windDirectionCompass: consolidatedWindDirectionCompass,
          created: consolidatedCreated,
          applicableDate: consolidatedApplicableDate,
          minTemp: consolidatedMinTemp,
          maxTemp: consolidatedMaxTemp,
          theTemp: consolidatedTheTemp,
          windSpeed: consolidatedWindSpeed,
          windDirection: consolidatedWindDirection,
          airPressure: consolidatedAirPressure,
          humidity: consolidatedHumidity,
          visibility: consolidatedVisibility,
          predictability: consolidatedPredictability,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': consolidatedId,
      'weather_state_name': consolidatedWeatherStateName,
      'weather_state_abbr': consolidatedWeatherStateAbbr,
      'wind_direction_compass': consolidatedWindDirectionCompass,
      'created': consolidatedCreated,
      'applicable_date': consolidatedApplicableDate,
      'min_temp': consolidatedMinTemp,
      'max_temp': consolidatedMaxTemp,
      'the_temp': consolidatedTheTemp,
      'wind_speed': consolidatedWindSpeed,
      'wind_direction': consolidatedWindDirection,
      'air_pressure': consolidatedAirPressure,
      'humidity': consolidatedHumidity,
      'visibility': consolidatedVisibility,
      'predictability': consolidatedPredictability,
    };
  }

  factory ConsolidatedWeatherModel.fromMap(Map<String, dynamic> map) {
    return ConsolidatedWeatherModel(
      consolidatedId: map['id'] != null ? map['id'] as int : 0,
      consolidatedWeatherStateName: map['weather_state_name'] != null ? map['weather_state_name'] as String : "",
      consolidatedWeatherStateAbbr: map['weather_state_abbr'] != null ? map['weather_state_abbr'] as String : "",
      consolidatedWindDirectionCompass: map['wind_direction_compass'] != null ? map['wind_direction_compass'] as String : "",
      consolidatedCreated: map['created'] != null ? map['created'] as String : "",
      consolidatedApplicableDate: map['applicable_date'] != null ? map['applicable_date'] as String : "",
      consolidatedMinTemp: map['min_temp'] != null ? map['min_temp'] as double : 0.0,
      consolidatedMaxTemp: map['max_temp'] != null ? map['max_temp'] as double : 0.0,
      consolidatedTheTemp: map['the_temp'] != null ? map['the_temp'] as double : 0.0,
      consolidatedWindSpeed: map['wind_speed'] != null ? map['wind_speed'] as double : 0.0,
      consolidatedWindDirection: map['wind_direction'] != null ? map['wind_direction'] as double : 0.0,
      consolidatedAirPressure: map['air_pressure'] != null ? map['air_pressure'] as double : 0.0,
      consolidatedHumidity: map['humidity'] != null ? map['humidity'] as int : 0,
      consolidatedVisibility: map['visibility'] != null ? map['visibility'] as double : 0.0,
      consolidatedPredictability: map['predictability'] != null ? map['predictability'] as int : 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ConsolidatedWeatherModel.fromJson(String source) => ConsolidatedWeatherModel.fromMap(json.decode(source));
}

class ParentModel extends Parent {
  String parentTitle;
  String parentLocationType;
  int parentWoeid;
  String parentLattLong;

  ParentModel({
    required this.parentTitle,
    required this.parentLocationType,
    required this.parentWoeid,
    required this.parentLattLong,
  }) : super(
          title: parentTitle,
          locationType: parentLocationType,
          woeid: parentWoeid,
          lattLong: parentLattLong,
        );

  Map<String, dynamic> toMap() {
    return {
      'title': parentTitle,
      'location_type': parentLocationType,
      'woeid': parentWoeid,
      'latt_long': parentLattLong,
    };
  }

  factory ParentModel.fromMap(Map<String, dynamic> map) {
    return ParentModel(
      parentTitle: map['title'] != null ? map['title'] as String : "",
      parentLocationType: map['location_type'] != null ? map['location_type'] as String : "",
      parentWoeid: map['woeid'] != null ? map['woeid'] as int : 0,
      parentLattLong: map['latt_long'] != null ? map['latt_long'] as String : "",
    );
  }

  String toJson() => json.encode(toMap());

  factory ParentModel.fromJson(String source) => ParentModel.fromMap(json.decode(source));
}

class SourceModel extends Source {
  String sourceTitle;
  String sourceSlug;
  String sourceUrl;
  int sourceCrawlRate;

  SourceModel({
    required this.sourceTitle,
    required this.sourceSlug,
    required this.sourceUrl,
    required this.sourceCrawlRate,
  }) : super(
          title: sourceTitle,
          slug: sourceSlug,
          url: sourceUrl,
          crawlRate: sourceCrawlRate,
        );

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'slug': slug,
      'url': url,
      'crawl_rate': sourceCrawlRate,
    };
  }

  factory SourceModel.fromMap(Map<String, dynamic> map) {
    return SourceModel(
      sourceTitle: map['title'] != null ? map['title'] as String : "",
      sourceSlug: map['slug'] != null ? map['slug'] as String : "",
      sourceUrl: map['url'] != null ? map['url'] as String : "",
      sourceCrawlRate: map['crawl_rate'] != null ? map['crawl_rate'] as int : 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory SourceModel.fromJson(String source) => SourceModel.fromMap(json.decode(source));
}
