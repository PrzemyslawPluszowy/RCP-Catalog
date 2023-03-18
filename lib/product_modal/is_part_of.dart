import 'package:json_annotation/json_annotation.dart';

part 'is_part_of.g.dart';

@JsonSerializable()
class IsPartOf {
  @JsonKey(name: '@id')
  String? id;

  IsPartOf({this.id});

  @override
  String toString() => 'IsPartOf(id: $id)';

  factory IsPartOf.fromJson(Map<String, dynamic> json) {
    return _$IsPartOfFromJson(json);
  }

  Map<String, dynamic> toJson() => _$IsPartOfToJson(this);
}
