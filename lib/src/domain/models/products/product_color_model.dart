// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductColorModel {
  final String color;
  final List<String> images;
  final List<String> sizes;

  ProductColorModel({
    required this.color,
    required this.images,
    required this.sizes,
  });

  ProductColorModel copyWith({
    String? color,
    List<String>? images,
    List<String>? sizes,
  }) {
    return ProductColorModel(
      color: color ?? this.color,
      images: images ?? this.images,
      sizes: sizes ?? this.sizes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'color': color,
      'images': images.map((e) => e.toString()).toList(),
      'sizes': sizes.map((e) => e.toString()).toList(),
    };
  }

  factory ProductColorModel.fromMap(Map<String, dynamic> map) {
    return ProductColorModel(
      color: map['color'] as String,
      images: (map['images'] as List).map((e) => e.toString()).toList(),
      sizes: (map['sizes'] as List).map((e) => e.toString()).toList(),
    );
  }

  //String toJson() => json.encode(toMap());

  factory ProductColorModel.fromJson(String source) =>
      ProductColorModel.fromMap(json.decode(source));
}
