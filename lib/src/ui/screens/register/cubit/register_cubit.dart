import 'package:clothing_store_firestore_crud/src/domain/models/exception_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/status/screen_status.dart';
import 'package:clothing_store_firestore_crud/src/domain/usecase/auth_usecase.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/register/cubit/register_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._authUseCase) : super(RegisterState.initial());

  final AuthUseCase _authUseCase;

  void register() async {
    try {
      String email = state.emailController.text;
      String name = state.nameController.text;
      String surname = state.surnameController.text;
      String password = state.passController.text;
      String confirmPassword = state.confirmPassController.text;

      if (email.isEmpty ||
          name.isEmpty ||
          surname.isEmpty ||
          password.isEmpty ||
          confirmPassword.isEmpty) {
        emit(state.copyWith(
          status: ScreenStatus.error,
          exception: ExceptionModel(
            title: 'Error!',
            message: 'All fields need to be completed',
          ),
        ));
      } else {
        if (password == confirmPassword) {
          await _authUseCase.signUp(
            email: email,
            password: password,
            confirmPass: confirmPassword,
            name: name,
            surname: surname,
          );
          emit(state.copyWith(status: ScreenStatus.success));
        } else {
          emit(state.copyWith(
            status: ScreenStatus.error,
            exception: ExceptionModel(
              title: 'Error!',
              message: 'Passwords are not the same',
            ),
          ));
        }
      }
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
        status: ScreenStatus.error,
        exception: ExceptionModel(
          title: 'Error!',
          message: e.message.toString(),
        ),
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ScreenStatus.error,
        exception: ExceptionModel(
          title: 'Error!',
          message: e.toString(),
        ),
      ));
    }
  }

  void changeStatus() {
    emit(state.copyWith(status: ScreenStatus.initial));
  }
}
