import 'package:json_annotation/json_annotation.dart';

part 'item_list_element.g.dart';

@JsonSerializable()
class ItemListElement {
  @JsonKey(name: '@type')
  String? type;
  int? position;
  String? name;
  String? item;

  ItemListElement({this.type, this.position, this.name, this.item});

  @override
  String toString() {
    return 'ItemListElement(type: $type, position: $position, name: $name, item: $item)';
  }

  factory ItemListElement.fromJson(Map<String, dynamic> json) {
    return _$ItemListElementFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ItemListElementToJson(this);
}
