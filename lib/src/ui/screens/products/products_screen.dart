import 'package:clothing_store_firestore_crud/src/domain/status/screen_status.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/products/cubit/products_cubit.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/products/cubit/products_state.dart';
import 'package:clothing_store_firestore_crud/src/ui/widgets/staggered_dual_view_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          return Column(
            children: [
              AppBar(
                leading: const BackButton(),
                title: Text(
                  state.status == ScreenStatus.loading
                      ? 'Loading..'
                      : state.query,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    state.status == ScreenStatus.success
                        ? StaggeredDualViewProducts(products: state.products)
                        : const SizedBox.shrink(),
                    state.status == ScreenStatus.loading
                        ? const Center(child: CircularProgressIndicator())
                        : const SizedBox.shrink()
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
