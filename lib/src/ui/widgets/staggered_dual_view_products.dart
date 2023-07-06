import 'package:clothing_store_firestore_crud/src/domain/models/products/product_model.dart';
import 'package:clothing_store_firestore_crud/src/ui/routes/route_name.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/details/cubit/details_cubit.dart';
import 'package:clothing_store_firestore_crud/src/ui/utilities/tiles/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Widget for displaying a staggered dual view of products
class StaggeredDualViewProducts extends StatelessWidget {
  const StaggeredDualViewProducts({
    Key? key,
    required this.products,
    this.shrinkWrap = false,
  }) : super(key: key);

  // The list of products to display
  final List<ProductModel> products;

  // Whether the GridView should shrink-wrap its content
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 0.53,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      shrinkWrap: shrinkWrap,
      physics: shrinkWrap
          ? const NeverScrollableScrollPhysics()
          : const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        // Handle product tile tap event
        return GestureDetector(
          onTap: () {
            // Retrieve the selected product and pass it to the DetailsCubit
            context.read<DetailsCubit>().getProduct(products[index]);
            // Navigate to the details screen
            Navigator.pushNamed(context, RoutesName.details);
          },
          // Display the product tile
          child: ProductTile(
            product: products[index],
          ),
        );
      },
    );
  }
}
