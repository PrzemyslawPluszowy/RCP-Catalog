// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yoast_head_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YoastHeadJson _$YoastHeadJsonFromJson(Map<String, dynamic> json) =>
    YoastHeadJson(
      title: json['title'] as String?,
      robots: json['robots'] == null
          ? null
          : Robots.fromJson(json['robots'] as Map<String, dynamic>),
      canonical: json['canonical'] as String?,
      ogLocale: json['og_locale'] as String?,
      ogType: json['og_type'] as String?,
      ogTitle: json['og_title'] as String?,
      ogDescription: json['og_description'] as String?,
      ogUrl: json['og_url'] as String?,
      ogSiteName: json['og_site_name'] as String?,
      articlePublisher: json['article_publisher'] as String?,
      articleModifiedTime: json['article_modified_time'] as String?,
      ogImage: (json['og_image'] as List<dynamic>?)
          ?.map((e) => OgImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      twitterCard: json['twitter_card'] as String?,
      schema: json['schema'] == null
          ? null
          : Schema.fromJson(json['schema'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$YoastHeadJsonToJson(YoastHeadJson instance) =>
    <String, dynamic>{
      'title': instance.title,
      'robots': instance.robots,
      'canonical': instance.canonical,
      'og_locale': instance.ogLocale,
      'og_type': instance.ogType,
      'og_title': instance.ogTitle,
      'og_description': instance.ogDescription,
      'og_url': instance.ogUrl,
      'og_site_name': instance.ogSiteName,
      'article_publisher': instance.articlePublisher,
      'article_modified_time': instance.articleModifiedTime,
      'og_image': instance.ogImage,
      'twitter_card': instance.twitterCard,
      'schema': instance.schema,
    };
