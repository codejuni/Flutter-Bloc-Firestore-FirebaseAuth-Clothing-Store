// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class SearchState extends Equatable {
  final String query;
  const SearchState({
    required this.query,
  });

  factory SearchState.initial() {
    return const SearchState(
      query: '',
    );
  }

  @override
  List<Object?> get props => [query];

  SearchState copyWith({
    String? query,
  }) {
    return SearchState(
      query: query ?? this.query,
    );
  }
}
