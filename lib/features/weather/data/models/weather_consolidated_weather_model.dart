part of 'package:weather/features/weather/data/models/weather_by_woeid_response_model.dart';

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
          minTemp: consolidatedMinTemp.round(),
          maxTemp: consolidatedMaxTemp.round(),
          theTemp: consolidatedTheTemp.round(),
          windSpeed: consolidatedWindSpeed.round(),
          windDirection: consolidatedWindDirection,
          airPressure: consolidatedAirPressure.round(),
          humidity: consolidatedHumidity,
          visibility: consolidatedVisibility,
          predictability: consolidatedPredictability,
          day: DateFormat('EEEE').format(
            DateTime.parse(consolidatedApplicableDate),
          ),
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
