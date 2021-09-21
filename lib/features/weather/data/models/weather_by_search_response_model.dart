import 'dart:convert';

import 'package:weather/features/weather/domain/entities/weather_search.dart';

class WeatherBySearchResponseModel extends WeatherSearch {
  String title;
  String locationType;
  int woeid;
  String lattLong;

  WeatherBySearchResponseModel({
    required this.title,
    required this.locationType,
    required this.woeid,
    required this.lattLong,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'location_type': locationType,
      'woeid': woeid,
      'latt_long': lattLong,
    };
  }

  factory WeatherBySearchResponseModel.fromMap(Map<String, dynamic> map) {
    return WeatherBySearchResponseModel(
      title: map['title'] != null ? map['title'] as String : "",
      locationType: map['location_type'] != null ? map['location_type'] as String : "",
      woeid: map['woeid'] != null ? map['woeid'] as int : 0,
      lattLong: map['latt_long'] != null ? map['latt_long'] as String : "",
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherBySearchResponseModel.fromJson(String source) => WeatherBySearchResponseModel.fromMap(json.decode(source));
}
