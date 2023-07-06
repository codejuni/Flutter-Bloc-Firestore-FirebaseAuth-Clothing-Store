import 'package:clothing_store_firestore_crud/src/domain/status/screen_status.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/splash/cubit/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.initial());

  void changeStatus() {
    emit(state.copyWith(status: ScreenStatus.loading));
    print(state.status);
  }

  void init() async {
    await Future.delayed(const Duration(seconds: 3));
    emit(state.copyWith(status: ScreenStatus.success));
  }
}
