import 'package:clothing_store_firestore_crud/src/domain/status/delete_item_status.dart';
import 'package:clothing_store_firestore_crud/src/domain/status/screen_status.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/bag/cubit/bag_cubit.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/bag/cubit/bag_state.dart';
import 'package:clothing_store_firestore_crud/src/ui/utilities/tiles/bag_tile.dart';
import 'package:clothing_store_firestore_crud/src/ui/widgets/custom_dialog_accept.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BagScreen extends StatelessWidget {
  const BagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => BagCubit(context.read())..init(),
        child: BlocConsumer<BagCubit, BagState>(
          listener: (context, state) {
            if (state.removeStatus == RemoveFromBagStatus.success ||
                state.removeStatus == RemoveFromBagStatus.error) {
              customDialogAccept(
                context: context,
                exception: state.exception,
                onTap: context.read<BagCubit>().changeRemoveStatus,
              );
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                AppBar(
                  leading: const BackButton(),
                  title: const Text('My Shopping Bag'),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      state.status == ScreenStatus.success
                          ? Column(
                              children: [
                                ListView.separated(
                                  itemCount: state.bag.length,
                                  padding: const EdgeInsets.all(15),
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(height: 30);
                                  },
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return BagTile(
                                      bag: state.bag[index],
                                      removeFromBag: () {
                                        context
                                            .read<BagCubit>()
                                            .removeFromBag(index);
                                      },
                                    );
                                  },
                                ),
                              ],
                            )
                          : const SizedBox.shrink(),
                      state.status == ScreenStatus.loading
                          ? const Center(child: CircularProgressIndicator())
                          : const SizedBox.shrink(),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
