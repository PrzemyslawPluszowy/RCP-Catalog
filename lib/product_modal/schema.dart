import 'package:json_annotation/json_annotation.dart';

import 'graph.dart';

part 'schema.g.dart';

@JsonSerializable()
class Schema {
  @JsonKey(name: '@context')
  String? context;
  @JsonKey(name: '@graph')
  List<Graph>? graph;

  Schema({this.context, this.graph});

  @override
  String toString() => 'Schema(context: $context, graph: $graph)';

  factory Schema.fromJson(Map<String, dynamic> json) {
    return _$SchemaFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SchemaToJson(this);
}
