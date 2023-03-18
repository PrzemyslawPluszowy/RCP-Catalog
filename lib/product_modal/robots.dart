import 'package:json_annotation/json_annotation.dart';

part 'robots.g.dart';

@JsonSerializable()
class Robots {
  String? index;
  String? follow;
  @JsonKey(name: 'max-snippet')
  String? maxSnippet;
  @JsonKey(name: 'max-image-preview')
  String? maxImagePreview;
  @JsonKey(name: 'max-video-preview')
  String? maxVideoPreview;

  Robots({
    this.index,
    this.follow,
    this.maxSnippet,
    this.maxImagePreview,
    this.maxVideoPreview,
  });

  @override
  String toString() {
    return 'Robots(index: $index, follow: $follow, maxSnippet: $maxSnippet, maxImagePreview: $maxImagePreview, maxVideoPreview: $maxVideoPreview)';
  }

  factory Robots.fromJson(Map<String, dynamic> json) {
    return _$RobotsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RobotsToJson(this);
}
