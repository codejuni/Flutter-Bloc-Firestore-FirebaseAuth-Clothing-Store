// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clothing_store_firestore_crud/src/domain/status/screen_status.dart';
import 'package:equatable/equatable.dart';

class SplashState extends Equatable {
  final ScreenStatus status;
  const SplashState({
    required this.status,
  });

  factory SplashState.initial() {
    return const SplashState(
      status: ScreenStatus.loading,
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [status];

  SplashState copyWith({
    ScreenStatus? status,
  }) {
    return SplashState(
      status: status ?? this.status,
    );
  }
}
