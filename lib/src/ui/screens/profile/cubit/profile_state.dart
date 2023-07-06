// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clothing_store_firestore_crud/src/domain/status/screen_status.dart';
import 'package:equatable/equatable.dart';

class ProfileState extends Equatable {
  final ScreenStatus status;

  const ProfileState({
    required this.status,
  });

  factory ProfileState.initial() {
    return const ProfileState(
      status: ScreenStatus.initial,
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [status];

  ProfileState copyWith({
    ScreenStatus? status,
  }) {
    return ProfileState(
      status: status ?? this.status,
    );
  }
}
