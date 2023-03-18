// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'potential_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PotentialAction _$PotentialActionFromJson(Map<String, dynamic> json) =>
    PotentialAction(
      type: json['@type'] as String?,
      target:
          (json['target'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PotentialActionToJson(PotentialAction instance) =>
    <String, dynamic>{
      '@type': instance.type,
      'target': instance.target,
    };
