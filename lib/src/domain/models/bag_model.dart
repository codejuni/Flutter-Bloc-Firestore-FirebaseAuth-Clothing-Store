// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:clothing_store_firestore_crud/src/domain/models/products/product_model.dart';

class BagModel {
  final ProductModel product;
  final int color;
  final int size;
  final int quantity;
  BagModel({
    required this.product,
    required this.color,
    required this.size,
    required this.quantity,
  });

  /* factory BagModel.fromMap(QueryDocumentSnapshot<Map<String, dynamic>> doc) async* {
    final map = doc.data();
    DocumentReference documentRef = map['ref'];
    ProductModel productModel = await getProduct(documentRef);

    return BagModel(
      product: dataProduct,
      color: map['color'] as int,
      size: map['size'] as int,
      quantity: map['quantity'] as int,
    );
  }

  Future<ProductModel> getProduct(DocumentReference documentRef) async {
    DocumentSnapshot productSnapshot = await documentRef.get();
    if (productSnapshot.exists) {
      // Accede a los datos del producto
      ProductModel product = ProductModel.fromMap(productSnapshot);
      return product;
      // ...
    } else {
      // El producto no existe
      throw 'No existe el producto mencionado';
    }
  }

  factory BagModel.fromJson(String source) =>
      BagModel.fromMap(json.decode(source) as Map<String, dynamic>); */
}
