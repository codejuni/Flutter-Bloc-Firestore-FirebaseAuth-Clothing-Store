import 'package:clothing_store_firestore_crud/src/domain/models/exception_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/status/screen_status.dart';
import 'package:clothing_store_firestore_crud/src/domain/usecase/auth_usecase.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/register/cubit/register_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Registercubit extends Cubit<RegisterState> {
  Registercubit(this._authUseCase) : super(RegisterState.initial());

  final AuthUseCase _authUseCase;

  void register() async {
    try {
      await _authUseCase.signUp(
        email: state.emailController.text,
        password: state.passController.text,
        confirmPass: state.confirmPassController.text,
        name: state.nameController.text,
        surname: state.surnameController.text,
      );
      emit(state.copyWith(status: ScreenStatus.success));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
        status: ScreenStatus.error,
        exception: ExceptionModel(
          title: 'Error',
          message: e.message.toString(),
        ),
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ScreenStatus.error,
        exception: ExceptionModel(
          title: 'Error',
          message: e.toString(),
        ),
      ));
    }
  }
}
