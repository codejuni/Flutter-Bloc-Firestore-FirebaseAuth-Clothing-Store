import 'package:clothing_store_firestore_crud/src/ui/screens/search/cubit/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState.initial());

  bool search() {
    if (state.query.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  void onChanged(String value) {
    emit(state.copyWith(query: value));
  }
}
