import 'package:clothing_store_firestore_crud/src/domain/status/screen_status.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/details/cubit/details_cubit.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/details/cubit/details_state.dart';
import 'package:clothing_store_firestore_crud/src/ui/utilities/tiles/color_product_tile.dart';
import 'package:clothing_store_firestore_crud/src/ui/widgets/custom_button.dart';
import 'package:clothing_store_firestore_crud/src/ui/widgets/custom_dialog_accept.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<DetailsCubit, DetailsState>(
        listener: (context, state) {
          if (state.status == ScreenStatus.error) {
            print('Este es el error : ${state.exception.message}');
          } else if (state.status == ScreenStatus.success) {
            customDialogAccept(
              context: context,
              exception: state.exception,
              onTap: context.read<DetailsCubit>().changeStatus,
            );
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              AppBar(
                leading: const BackButton(),
                title: const Text('Details'),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                          clipBehavior: Clip.none,
                          itemCount:
                              state.product.colors[state.color].images.length,
                          controller:
                              context.read<DetailsCubit>().pageController,
                          itemBuilder: (context, index) {
                            final images =
                                state.product.colors[state.color].images[index];
                            return Hero(
                              tag: 'details_$images',
                              child: Card(
                                child: Image.network(
                                  images,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        height: 10,
                        margin: const EdgeInsets.only(
                          top: 10,
                          bottom: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(
                            state.product.colors[state.color].images.length,
                            (index) => AnimatedContainer(
                              width: state.indexImage == index ? 16 : 8,
                              height: 8,
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              duration: const Duration(milliseconds: 400),
                              decoration: BoxDecoration(
                                color: state.indexImage == index
                                    ? Theme.of(context).primaryColor
                                    : Colors.black,
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              state.product.name,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          Row(
                            children: List.generate(state.product.colors.length,
                                (index) {
                              final color = state.product.colors[index];
                              return InkWell(
                                onTap: () {
                                  context
                                      .read<DetailsCubit>()
                                      .changeColor(index);
                                },
                                child: ColorProductTile(
                                  color: color,
                                  selected: state.color == index,
                                ),
                              );
                            }),
                          )
                        ],
                      ),
                      Container(
                        height: 40,
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return const SizedBox(width: 10);
                          },
                          scrollDirection: Axis.horizontal,
                          clipBehavior: Clip.none,
                          itemCount:
                              state.product.colors[state.color].sizes.length,
                          itemBuilder: (context, index) {
                            final size =
                                state.product.colors[state.color].sizes[index];
                            return Card(
                              color: state.size == index
                                  ? Theme.of(context).primaryColor
                                  : Colors.white,
                              child: InkWell(
                                onTap: () {
                                  context
                                      .read<DetailsCubit>()
                                      .changeSize(index);
                                },
                                child: Container(
                                  height: 40,
                                  width: 60,
                                  alignment: Alignment.center,
                                  child: Text(
                                    size,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '\$${state.product.price.toStringAsFixed(2)}',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: CustomButton(
                              onTap: context.read<DetailsCubit>().addToBag,
                              text: 'Add to Bag',
                              icon: Icons.shopping_bag_outlined,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
