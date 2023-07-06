// ignore_for_file: public_member_api_docs, sort_constructors_first

// Model class representing a product color
class ProductColorModel {
  final String color;
  final List<String> images;
  final List<String> sizes;

  // Constructor for creating a ProductColorModel instance
  ProductColorModel({
    required this.color,
    required this.images,
    required this.sizes,
  });

  // Factory method for creating a ProductColorModel instance from a map
  factory ProductColorModel.fromMap(Map<String, dynamic> map) {
    return ProductColorModel(
      color: map['color'] as String,
      images: (map['images'] as List).map((e) => e.toString()).toList(),
      sizes: (map['sizes'] as List).map((e) => e.toString()).toList(),
    );
  }
}
