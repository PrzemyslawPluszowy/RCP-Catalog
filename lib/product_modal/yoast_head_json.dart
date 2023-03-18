import 'package:json_annotation/json_annotation.dart';

import 'og_image.dart';
import 'robots.dart';
import 'schema.dart';

part 'yoast_head_json.g.dart';

@JsonSerializable()
class YoastHeadJson {
  String? title;
  Robots? robots;
  String? canonical;
  @JsonKey(name: 'og_locale')
  String? ogLocale;
  @JsonKey(name: 'og_type')
  String? ogType;
  @JsonKey(name: 'og_title')
  String? ogTitle;
  @JsonKey(name: 'og_description')
  String? ogDescription;
  @JsonKey(name: 'og_url')
  String? ogUrl;
  @JsonKey(name: 'og_site_name')
  String? ogSiteName;
  @JsonKey(name: 'article_publisher')
  String? articlePublisher;
  @JsonKey(name: 'article_modified_time')
  String? articleModifiedTime;
  @JsonKey(name: 'og_image')
  List<OgImage>? ogImage;
  @JsonKey(name: 'twitter_card')
  String? twitterCard;
  Schema? schema;

  YoastHeadJson({
    this.title,
    this.robots,
    this.canonical,
    this.ogLocale,
    this.ogType,
    this.ogTitle,
    this.ogDescription,
    this.ogUrl,
    this.ogSiteName,
    this.articlePublisher,
    this.articleModifiedTime,
    this.ogImage,
    this.twitterCard,
    this.schema,
  });

  @override
  String toString() {
    return 'YoastHeadJson(title: $title, robots: $robots, canonical: $canonical, ogLocale: $ogLocale, ogType: $ogType, ogTitle: $ogTitle, ogDescription: $ogDescription, ogUrl: $ogUrl, ogSiteName: $ogSiteName, articlePublisher: $articlePublisher, articleModifiedTime: $articleModifiedTime, ogImage: $ogImage, twitterCard: $twitterCard, schema: $schema)';
  }

  factory YoastHeadJson.fromJson(Map<String, dynamic> json) {
    return _$YoastHeadJsonFromJson(json);
  }

  Map<String, dynamic> toJson() => _$YoastHeadJsonToJson(this);
}
