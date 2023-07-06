import 'package:clothing_store_firestore_crud/src/domain/models/exception_model.dart';
import 'package:clothing_store_firestore_crud/src/domain/status/screen_status.dart';
import 'package:clothing_store_firestore_crud/src/domain/usecase/auth_usecase.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/login/cubit/login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authUseCase) : super(LoginState.initial());

  final AuthUseCase _authUseCase;

  void login() async {
    try {
      final email = state.emailController.text;
      final password = state.passController.text;
      await _authUseCase.signIn(email, password);
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

  void changeStatus() {
    emit(state.copyWith(status: ScreenStatus.initial));
  }
}
