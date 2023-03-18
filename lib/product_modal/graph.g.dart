// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graph.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Graph _$GraphFromJson(Map<String, dynamic> json) => Graph(
      type: json['@type'] as String?,
      id: json['@id'] as String?,
      url: json['url'] as String?,
      name: json['name'] as String?,
      isPartOf: json['isPartOf'] == null
          ? null
          : IsPartOf.fromJson(json['isPartOf'] as Map<String, dynamic>),
      datePublished: json['datePublished'] as String?,
      dateModified: json['dateModified'] as String?,
      breadcrumb: json['breadcrumb'] == null
          ? null
          : Breadcrumb.fromJson(json['breadcrumb'] as Map<String, dynamic>),
      inLanguage: json['inLanguage'] as String?,
      potentialAction: (json['potentialAction'] as List<dynamic>?)
          ?.map((e) => PotentialAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      itemListElement: (json['itemListElement'] as List<dynamic>?)
          ?.map((e) => ItemListElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$GraphToJson(Graph instance) => <String, dynamic>{
      '@type': instance.type,
      '@id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'isPartOf': instance.isPartOf,
      'datePublished': instance.datePublished,
      'dateModified': instance.dateModified,
      'breadcrumb': instance.breadcrumb,
      'inLanguage': instance.inLanguage,
      'potentialAction': instance.potentialAction,
      'itemListElement': instance.itemListElement,
      'description': instance.description,
    };
