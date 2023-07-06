import 'package:clothing_store_firestore_crud/src/domain/status/screen_status.dart';
import 'package:clothing_store_firestore_crud/src/domain/usecase/auth_usecase.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/profile/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._authUseCase) : super(ProfileState.initial());

  final AuthUseCase _authUseCase;

  void signOut() async {
    try {
      await _authUseCase.signOut();
      emit(state.copyWith(status: ScreenStatus.success));
    } catch (_) {
      emit(state.copyWith(status: ScreenStatus.error));
    }
  }
}
