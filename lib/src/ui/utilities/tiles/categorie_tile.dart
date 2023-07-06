import 'package:clothing_store_firestore_crud/src/domain/models/categorie_model.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategorieTile extends StatelessWidget {
  const CategorieTile({
    super.key,
    required this.indexCategorie,
    required this.index,
    required this.categories,
  });

  final List<CategorieModel> categories;
  final int indexCategorie;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: index == indexCategorie
          ? Theme.of(context).primaryColor
          : Theme.of(context).cardTheme.color,
      child: InkWell(
        onTap: () {
          context.read<HomeCubit>().changeIndexCategorie(index);
        },
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Text(
            index == 0 ? 'All' : categories[index - 1].name,
          ),
        ),
      ),
    );
  }
}
