// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clothing_store_firestore_crud/src/domain/models/exception_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/status/screen_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LoginState extends Equatable {
  final TextEditingController emailController;
  final TextEditingController passController;
  final ScreenStatus status;
  final ExceptionModel exception;
  const LoginState({
    required this.emailController,
    required this.passController,
    required this.status,
    required this.exception,
  });

  factory LoginState.initial() {
    return LoginState(
      emailController: TextEditingController(),
      passController: TextEditingController(),
      status: ScreenStatus.initial,
      exception: ExceptionModel.initial(),
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        emailController,
        passController,
        status,
        exception,
      ];

  LoginState copyWith({
    TextEditingController? emailController,
    TextEditingController? passController,
    ScreenStatus? status,
    ExceptionModel? exception,
  }) {
    return LoginState(
      emailController: emailController ?? this.emailController,
      passController: passController ?? this.passController,
      status: status ?? this.status,
      exception: exception ?? this.exception,
    );
  }
}
