import 'package:clothing_store_firestore_crud/src/domain/status/screen_status.dart';
import 'package:clothing_store_firestore_crud/src/ui/routes/route_name.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/splash/cubit/splash_cubit.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/splash/cubit/splash_state.dart';
import 'package:clothing_store_firestore_crud/src/ui/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state.status == ScreenStatus.success) {
            context.read<SplashCubit>().changeStatus();
            Navigator.pushReplacementNamed(context, RoutesName.home);
          }
        },
        builder: (context, state) {
          return const Center(child: CustomLoading());
        },
      ),
    );
  }
}
