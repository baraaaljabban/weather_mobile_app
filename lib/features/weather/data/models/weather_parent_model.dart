part of 'package:weather/features/weather/data/models/weather_by_woeid_response_model.dart';

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