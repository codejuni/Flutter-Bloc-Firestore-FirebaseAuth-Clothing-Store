// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clothing_store_firestore_crud/src/domain/status/delete_item_status.dart';
import 'package:clothing_store_firestore_crud/src/domain/status/screen_status.dart';
import 'package:equatable/equatable.dart';

import 'package:clothing_store_firestore_crud/src/domain/models/bag_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/models/exception_model.dart';

class BagState extends Equatable {
  final List<BagModel> bag;
  final ScreenStatus status;
  final ExceptionModel exception;
  final double totalPrice;
  final RemoveFromBagStatus removeStatus;

  const BagState({
    required this.bag,
    required this.status,
    required this.exception,
    required this.totalPrice,
    required this.removeStatus,
  });

  factory BagState.initial() {
    return BagState(
      bag: const [],
      status: ScreenStatus.loading,
      exception: ExceptionModel.initial(),
      totalPrice: 0,
      removeStatus: RemoveFromBagStatus.initial,
    );
  }

  /// Override this getter to enable the string representation of the state for debugging purposes.
  @override
  bool? get stringify => true;

  /// Override this getter to provide a list of properties used for equality comparison.
  @override
  List<Object?> get props => [bag, status, exception, totalPrice];

  /// Create a new `BagState` instance with updated values.
  BagState copyWith({
    List<BagModel>? bag,
    ScreenStatus? status,
    ExceptionModel? exception,
    double? totalPrice,
    RemoveFromBagStatus? removeStatus,
  }) {
    return BagState(
      bag: bag ?? this.bag,
      status: status ?? this.status,
      exception: exception ?? this.exception,
      totalPrice: totalPrice ?? this.totalPrice,
      removeStatus: removeStatus ?? this.removeStatus,
    );
  }
}
