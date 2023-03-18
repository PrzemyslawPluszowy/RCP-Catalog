import 'package:json_annotation/json_annotation.dart';

part 'potential_action.g.dart';

@JsonSerializable()
class PotentialAction {
  @JsonKey(name: '@type')
  String? type;
  List<String>? target;

  PotentialAction({this.type, this.target});

  @override
  String toString() => 'PotentialAction(type: $type, target: $target)';

  factory PotentialAction.fromJson(Map<String, dynamic> json) {
    return _$PotentialActionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PotentialActionToJson(this);
}
