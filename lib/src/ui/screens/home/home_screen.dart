import 'package:clothing_store_firestore_crud/src/domain/models/exception_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/status/screen_status.dart';
import 'package:clothing_store_firestore_crud/src/ui/routes/route_name.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/home/cubit/home_cubit.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/home/cubit/home_state.dart';
import 'package:clothing_store_firestore_crud/src/ui/utilities/tiles/categorie_tile.dart';
import 'package:clothing_store_firestore_crud/src/ui/utilities/tiles/custom_list_tile.dart';
import 'package:clothing_store_firestore_crud/src/ui/widgets/custom_dialog_accept_cancel.dart';
import 'package:clothing_store_firestore_crud/src/ui/widgets/staggered_dual_view_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state.status == ScreenStatus.success
              ? Column(
                  children: [
                    AppBar(
                      centerTitle: false,
                      leading: Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, RoutesName.profile);
                          },
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              state.user.image,
                            ),
                          ),
                        ),
                      ),
                      title: Text('Hi, ${state.user.name}'),
                      actions: [
                        IconButton(
                          onPressed: () async {
                            Navigator.pushNamed(context, RoutesName.search);
                          },
                          splashRadius: 20,
                          icon: const Icon(Icons.search),
                        ),
                        IconButton(
                          onPressed: () {
                            if (state.user.token!.isEmpty) {
                              customDialogAcceptCancel(
                                context: context,
                                exception: ExceptionModel(
                                  title: 'Not logged in',
                                  message: 'Do you want to log in?',
                                ),
                                changeState:
                                    context.read<HomeCubit>().changeStatus,
                                accept: () {
                                  Navigator.pushNamed(
                                    context,
                                    RoutesName.login,
                                  );
                                },
                              );
                            } else {
                              Navigator.pushNamed(context, RoutesName.bag);
                            }
                          },
                          splashRadius: 20,
                          icon: const Icon(Icons.shopping_bag_outlined),
                        ),
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomListTile(title: 'Categories'),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 45,
                              margin: const EdgeInsets.only(top: 15),
                              child: ListView.separated(
                                itemCount: state.categories.length + 1,
                                scrollDirection: Axis.horizontal,
                                clipBehavior: Clip.none,
                                separatorBuilder: (context, index) {
                                  return const SizedBox(width: 15);
                                },
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                                itemBuilder: (context, index) {
                                  return CategorieTile(
                                    categories: state.categories,
                                    indexCategorie: state.indexCategorie,
                                    index: index,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            StaggeredDualViewProducts(
                              products: state.products,
                              shrinkWrap: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
