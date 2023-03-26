// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_modal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class Prod extends TypeAdapter<Product> {
  @override
  final int typeId = 0;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      id: fields[0] as int?,
      name: fields[1] as String?,
      slug: fields[2] as String?,
      permalink: fields[3] as String?,
      dateCreated: fields[4] as DateTime?,
      dateCreatedGmt: fields[5] as DateTime?,
      dateModified: fields[6] as DateTime?,
      dateModifiedGmt: fields[7] as DateTime?,
      description: fields[8] as String?,
      shortDescription: fields[9] as String?,
      price: fields[10] as String?,
      categories: (fields[11] as List).cast<Category>(),
      tags: (fields[12] as List).cast<Category>(),
      images: (fields[13] as List).cast<ImageList>(),
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.slug)
      ..writeByte(3)
      ..write(obj.permalink)
      ..writeByte(4)
      ..write(obj.dateCreated)
      ..writeByte(5)
      ..write(obj.dateCreatedGmt)
      ..writeByte(6)
      ..write(obj.dateModified)
      ..writeByte(7)
      ..write(obj.dateModifiedGmt)
      ..writeByte(8)
      ..write(obj.description)
      ..writeByte(9)
      ..write(obj.shortDescription)
      ..writeByte(10)
      ..write(obj.price)
      ..writeByte(11)
      ..write(obj.categories)
      ..writeByte(12)
      ..write(obj.tags)
      ..writeByte(13)
      ..write(obj.images);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Prod &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryAdapter extends TypeAdapter<Category> {
  @override
  final int typeId = 1;

  @override
  Category read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Category(
      id: fields[0] as int?,
      name: fields[1] as String?,
      slug: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.slug);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ImageListAdapter extends TypeAdapter<ImageList> {
  @override
  final int typeId = 2;

  @override
  ImageList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageList(
      id: fields[0] as int?,
      dateCreated: fields[1] as DateTime?,
      dateCreatedGmt: fields[2] as DateTime?,
      dateModified: fields[3] as DateTime?,
      dateModifiedGmt: fields[4] as DateTime?,
      src: fields[5] as String?,
      name: fields[6] as String?,
      alt: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ImageList obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.dateCreated)
      ..writeByte(2)
      ..write(obj.dateCreatedGmt)
      ..writeByte(3)
      ..write(obj.dateModified)
      ..writeByte(4)
      ..write(obj.dateModifiedGmt)
      ..writeByte(5)
      ..write(obj.src)
      ..writeByte(6)
      ..write(obj.name)
      ..writeByte(7)
      ..write(obj.alt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
