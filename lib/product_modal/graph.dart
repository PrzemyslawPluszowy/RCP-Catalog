import 'package:json_annotation/json_annotation.dart';

import 'breadcrumb.dart';
import 'is_part_of.dart';
import 'item_list_element.dart';
import 'potential_action.dart';

part 'graph.g.dart';

@JsonSerializable()
class Graph {
  @JsonKey(name: '@type')
  String? type;
  @JsonKey(name: '@id')
  String? id;
  String? url;
  String? name;
  IsPartOf? isPartOf;
  String? datePublished;
  String? dateModified;
  Breadcrumb? breadcrumb;
  String? inLanguage;
  List<PotentialAction>? potentialAction;
  List<ItemListElement>? itemListElement;
  String? description;

  Graph({
    this.type,
    this.id,
    this.url,
    this.name,
    this.isPartOf,
    this.datePublished,
    this.dateModified,
    this.breadcrumb,
    this.inLanguage,
    this.potentialAction,
    this.itemListElement,
    this.description,
  });

  @override
  String toString() {
    return 'Graph(type: $type, id: $id, url: $url, name: $name, isPartOf: $isPartOf, datePublished: $datePublished, dateModified: $dateModified, breadcrumb: $breadcrumb, inLanguage: $inLanguage, potentialAction: $potentialAction, itemListElement: $itemListElement, description: $description)';
  }

  factory Graph.fromJson(Map<String, dynamic> json) => _$GraphFromJson(json);

  Map<String, dynamic> toJson() => _$GraphToJson(this);
}
