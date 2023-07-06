import 'package:clothing_store_firestore_crud/src/domain/models/products/product_model.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Hero(
            tag: 'details_${product.colors[0].images[0]}',
            child: Card(
              child: Image.network(
                product.colors[0].images[0],
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          product.name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 5),
        Text(
          '\$${product.price.toStringAsFixed(2)}',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
