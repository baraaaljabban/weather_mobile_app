class Weather {
  List<ConsolidatedWeather> consolidatedWeather;
  String time;
  String sunRise;
  String sunSet;
  String timezoneName;
  Parent parent;
  // List<Source> sources;
  String title;
  String locationType;
  int woeid;
  String lattLong;
  String timezone;

  Weather({
    required this.consolidatedWeather,
    required this.time,
    required this.sunRise,
    required this.sunSet,
    required this.timezoneName,
    required this.parent,
    // required this.sources,
    required this.title,
    required this.locationType,
    required this.woeid,
    required this.lattLong,
    required this.timezone,
  });
}

class Parent {
  String title;
  String locationType;
  int woeid;
  String lattLong;

  Parent({
    required this.title,
    required this.locationType,
    required this.woeid,
    required this.lattLong,
  });
}

class ConsolidatedWeather {
  int id;
  String weatherStateName;
  String weatherStateAbbr;
  String windDirectionCompass;
  String created;
  String applicableDate;
  double minTemp;
  double maxTemp;
  double theTemp;
  double windSpeed;
  double windDirection;
  double airPressure;
  int humidity;
  double visibility;
  int predictability;
  String day;

  ConsolidatedWeather({
    required this.id,
    required this.weatherStateName,
    required this.weatherStateAbbr,
    required this.windDirectionCompass,
    required this.created,
    required this.applicableDate,
    required this.minTemp,
    required this.maxTemp,
    required this.theTemp,
    required this.windSpeed,
    required this.windDirection,
    required this.airPressure,
    required this.humidity,
    required this.visibility,
    required this.predictability,
    required this.day,
  });
}

// not needed class for UI

// class Source {
//   String title;
//   String slug;
//   String url;
//   int crawlRate;

//   Source({
//     required this.title,
//     required this.slug,
//     required this.url,
//     required this.crawlRate,
//   });
// }
