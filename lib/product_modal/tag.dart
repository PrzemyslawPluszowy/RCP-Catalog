import 'package:json_annotation/json_annotation.dart';

part 'tag.g.dart';

@JsonSerializable()
class Tag {
  int? id;
  String? name;
  String? slug;

  Tag({this.id, this.name, this.slug});

  @override
  String toString() => 'Tag(id: $id, name: $name, slug: $slug)';

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}
