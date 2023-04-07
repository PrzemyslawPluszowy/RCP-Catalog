// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);
import 'dart:convert';

import 'package:hive/hive.dart';
// import 'package:html/parser.dart';
// import 'package:hive_generator/hive_generator.dart';
part 'product_modal.g.dart';

List<Product> welcomeFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String welcomeToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<ImageList> defaultImageList = [
  ImageList(
      id: 99999,
      dateCreated: DateTime.now(),
      alt: '',
      dateCreatedGmt: DateTime.now(),
      dateModified: DateTime.now(),
      name: 'no data',
      dateModifiedGmt: DateTime.now(),
      src: '')
];
List<Category> defaultCategory = [
  Category(id: 99999, name: 'error, no data', slug: '')
];

@HiveType(typeId: 0, adapterName: 'Prod')
class Product {
  Product({
    this.id,
    this.name,
    this.slug,
    this.permalink,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.description,
    this.shortDescription,
    required this.price,
    required this.categories,
    required this.tags,
    required this.images,
  });
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? slug;
  @HiveField(3)
  final String? permalink;
  @HiveField(4)
  final DateTime? dateCreated;
  @HiveField(5)
  final DateTime? dateCreatedGmt;
  @HiveField(6)
  final DateTime? dateModified;
  @HiveField(7)
  final DateTime? dateModifiedGmt;
  @HiveField(8)
  final String? description;
  @HiveField(9)
  final String? shortDescription;
  @HiveField(10)
  final String price;
  @HiveField(11)
  final List<Category> categories;
  @HiveField(12)
  final List<Category> tags;
  @HiveField(13)
  final List<ImageList> images;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        permalink: json["permalink"],
        dateCreated: json["date_created"] == null
            ? null
            : DateTime.parse(json["date_created"]),
        dateCreatedGmt: json["date_created_gmt"] == null
            ? null
            : DateTime.parse(json["date_created_gmt"]),
        dateModified: json["date_modified"] == null
            ? null
            : DateTime.parse(json["date_modified"]),
        dateModifiedGmt: json["date_modified_gmt"] == null
            ? null
            : DateTime.parse(json["date_modified_gmt"]),
        description: json["description"],
        shortDescription: json["short_description"],
        price: json["price"],
        categories: json["categories"] == null
            ? defaultCategory
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
        tags: json["tags"] == null
            ? []
            : List<Category>.from(
                json["tags"]!.map((x) => Category.fromJson(x))),
        images: json["images"] == null
            ? defaultImageList
            : List<ImageList>.from(
                json["images"]!.map((x) => ImageList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "permalink": permalink,
        "date_created": dateCreated?.toIso8601String(),
        "date_created_gmt": dateCreatedGmt?.toIso8601String(),
        "date_modified": dateModified?.toIso8601String(),
        "date_modified_gmt": dateModifiedGmt?.toIso8601String(),
        "description": description,
        "short_description": shortDescription,
        "price": price,
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories.map((x) => x.toJson())),
        "tags":
            tags == null ? [] : List<dynamic>.from(tags.map((x) => x.toJson())),
        "images": images == null
            ? defaultImageList
            : List<dynamic>.from(images.map((x) => x.toJson())),
      };
}

@HiveType(
  typeId: 1,
)
class Category {
  Category({
    this.id,
    this.name,
    this.slug,
  });
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? slug;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
      };
}

@HiveType(typeId: 2)
class ImageList {
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
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final DateTime? dateCreated;
  @HiveField(2)
  final DateTime? dateCreatedGmt;
  @HiveField(3)
  final DateTime? dateModified;
  @HiveField(4)
  final DateTime? dateModifiedGmt;
  @HiveField(5)
  final String? src;
  @HiveField(6)
  final String? name;
  @HiveField(7)
  final String? alt;

  factory ImageList.fromJson(Map<String, dynamic> json) => ImageList(
        id: json["id"],
        dateCreated: json["date_created"] == null
            ? null
            : DateTime.parse(json["date_created"]),
        dateCreatedGmt: json["date_created_gmt"] == null
            ? null
            : DateTime.parse(json["date_created_gmt"]),
        dateModified: json["date_modified"] == null
            ? null
            : DateTime.parse(json["date_modified"]),
        dateModifiedGmt: json["date_modified_gmt"] == null
            ? null
            : DateTime.parse(json["date_modified_gmt"]),
        src: json["src"],
        name: json["name"],
        alt: json["alt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date_created": dateCreated?.toIso8601String(),
        "date_created_gmt": dateCreatedGmt?.toIso8601String(),
        "date_modified": dateModified?.toIso8601String(),
        "date_modified_gmt": dateModifiedGmt?.toIso8601String(),
        "src": src,
        "name": name,
        "alt": alt,
      };
}

@HiveType(typeId: 3)
class CartProduct {
  @HiveField(0)
  final Product product;
  @HiveField(1)
  int itemCount;

  CartProduct({required this.product, this.itemCount = 1});
}
