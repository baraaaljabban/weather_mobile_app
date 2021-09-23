part of 'package:weather/features/weather/data/models/weather_by_woeid_response_model.dart';

class SourceModel {
  String sourceTitle;
  String sourceSlug;
  String sourceUrl;
  int sourceCrawlRate;

  SourceModel({
    required this.sourceTitle,
    required this.sourceSlug,
    required this.sourceUrl,
    required this.sourceCrawlRate,
  })
  // : super(
  // title: sourceTitle,
  // slug: sourceSlug,
  // url: sourceUrl,
  // crawlRate: sourceCrawlRate,
  // )
  ;

  Map<String, dynamic> toMap() {
    return {
      'title': sourceTitle,
      'slug': sourceSlug,
      'url': sourceUrl,
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
