import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class ImageList {
  int? id;
  @JsonKey(name: 'date_created')
  String? dateCreated;
  @JsonKey(name: 'date_created_gmt')
  String? dateCreatedGmt;
  @JsonKey(name: 'date_modified')
  String? dateModified;
  @JsonKey(name: 'date_modified_gmt')
  String? dateModifiedGmt;
  String? src;
  String? name;
  String? alt;

  ImageList({
    this.id,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.src,
    this.name,
    this.alt,
  });

  @override
  String toString() {
    return 'Image(id: $id, dateCreated: $dateCreated, dateCreatedGmt: $dateCreatedGmt, dateModified: $dateModified, dateModifiedGmt: $dateModifiedGmt, src: $src, name: $name, alt: $alt)';
  }

  factory ImageList.fromJson(Map<String, dynamic> json) =>
      _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
