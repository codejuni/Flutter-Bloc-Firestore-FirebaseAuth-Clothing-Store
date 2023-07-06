// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clothing_store_firestore_crud/src/domain/models/exception_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/status/screen_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class RegisterState extends Equatable {
  final TextEditingController emailController;
  final TextEditingController passController;
  final TextEditingController confirmPassController;
  final TextEditingController nameController;
  final TextEditingController surnameController;
  final ScreenStatus status;
  final ExceptionModel exception;

  const RegisterState({
    required this.emailController,
    required this.passController,
    required this.confirmPassController,
    required this.nameController,
    required this.surnameController,
    required this.status,
    required this.exception,
  });

  factory RegisterState.initial() {
    return RegisterState(
      emailController: TextEditingController(),
      passController: TextEditingController(),
      confirmPassController: TextEditingController(),
      nameController: TextEditingController(),
      surnameController: TextEditingController(),
      status: ScreenStatus.initial,
      exception: ExceptionModel.initial(),
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        emailController,
        nameController,
        surnameController,
        passController,
        confirmPassController,
        status,
        exception,
      ];

  RegisterState copyWith({
    TextEditingController? emailController,
    TextEditingController? passController,
    TextEditingController? confirmPassController,
    TextEditingController? nameController,
    TextEditingController? surnameController,
    ScreenStatus? status,
    ExceptionModel? exception,
  }) {
    return RegisterState(
      emailController: emailController ?? this.emailController,
      passController: passController ?? this.passController,
      confirmPassController:
          confirmPassController ?? this.confirmPassController,
      nameController: nameController ?? this.nameController,
      surnameController: surnameController ?? this.surnameController,
      status: status ?? this.status,
      exception: exception ?? this.exception,
    );
  }
}
