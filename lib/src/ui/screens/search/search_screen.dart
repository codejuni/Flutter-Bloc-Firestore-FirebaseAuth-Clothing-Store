import 'package:clothing_store_firestore_crud/src/ui/routes/route_name.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/products/cubit/products_cubit.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/search/cubit/search_cubit.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/search/cubit/search_state.dart';
import 'package:clothing_store_firestore_crud/src/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SearchCubit(),
        child: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            return Column(
              children: [
                AppBar(
                  leading: const BackButton(),
                  title: const Text('Search'),
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          style: Theme.of(context).textTheme.bodyMedium,
                          onChanged: context.read<SearchCubit>().onChanged,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            labelStyle: Theme.of(context).textTheme.bodySmall,
                            labelText: 'What are you looking for?',
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomButton(
                          text: 'Start searching',
                          onTap: () {
                            print(state.query);
                            bool stateQuery =
                                context.read<SearchCubit>().search();
                            if (stateQuery) {
                              context.read<ProductsCubit>().init(
                                    state.query,
                                  );
                              Navigator.pushNamed(context, RoutesName.products);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
