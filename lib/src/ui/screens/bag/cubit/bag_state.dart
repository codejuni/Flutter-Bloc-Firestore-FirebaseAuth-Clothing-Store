// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clothing_store_firestore_crud/src/domain/status/screen_status.dart';
import 'package:equatable/equatable.dart';

import 'package:clothing_store_firestore_crud/src/domain/models/bag_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/models/exception_model.dart';

class BagState extends Equatable {
  final List<BagModel> bag;
  final ScreenStatus status;
  final ExceptionModel exception;
  final double totalPrice;

  const BagState({
    required this.bag,
    required this.status,
    required this.exception,
    required this.totalPrice,
  });

  factory BagState.initial() {
    return BagState(
      bag: const [],
      status: ScreenStatus.loading,
      exception: ExceptionModel.initial(),
      totalPrice: 0,
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [bag, status, exception, totalPrice];

  BagState copyWith({
    List<BagModel>? bag,
    ScreenStatus? status,
    ExceptionModel? exception,
    double? totalPrice,
  }) {
    return BagState(
      bag: bag ?? this.bag,
      status: status ?? this.status,
      exception: exception ?? this.exception,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}
