import 'package:json_annotation/json_annotation.dart';

part 'og_image.g.dart';

@JsonSerializable()
class OgImage {
  int? width;
  int? height;
  String? url;
  String? type;

  OgImage({this.width, this.height, this.url, this.type});

  @override
  String toString() {
    return 'OgImage(width: $width, height: $height, url: $url, type: $type)';
  }

  factory OgImage.fromJson(Map<String, dynamic> json) {
    return _$OgImageFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OgImageToJson(this);
}
