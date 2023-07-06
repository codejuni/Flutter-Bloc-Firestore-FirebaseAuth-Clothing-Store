import 'package:clothing_store_firestore_crud/src/domain/models/products/product_model.dart';
import 'package:clothing_store_firestore_crud/src/ui/routes/route_name.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/details/cubit/details_cubit.dart';
import 'package:clothing_store_firestore_crud/src/ui/utilities/tiles/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StaggeredDualViewProducts extends StatelessWidget {
  const StaggeredDualViewProducts({
    super.key,
    required this.products,
    this.shrinkWrap = false,
  });

  final List<ProductModel> products;
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
        return GestureDetector(
          onTap: () {
            context.read<DetailsCubit>().getProduct(products[index]);
            Navigator.pushNamed(context, RoutesName.details);
          },
          child: ProductTile(
            product: products[index],
          ),
        );
      },
    );
  }
}
