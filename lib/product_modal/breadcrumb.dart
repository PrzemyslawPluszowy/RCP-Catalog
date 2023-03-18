import 'package:json_annotation/json_annotation.dart';

part 'breadcrumb.g.dart';

@JsonSerializable()
class Breadcrumb {
  @JsonKey(name: '@id')
  String? id;

  Breadcrumb({this.id});

  @override
  String toString() => 'Breadcrumb(id: $id)';

  factory Breadcrumb.fromJson(Map<String, dynamic> json) {
    return _$BreadcrumbFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BreadcrumbToJson(this);
}
