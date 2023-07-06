import 'package:clothing_store_firestore_crud/src/domain/status/screen_status.dart';
import 'package:clothing_store_firestore_crud/src/ui/routes/route_name.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/home/cubit/home_cubit.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/profile/cubit/profile_cubit.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/profile/cubit/profile_state.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/splash/cubit/splash_cubit.dart';
import 'package:clothing_store_firestore_crud/src/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProfileCubit(context.read()),
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state.status == ScreenStatus.success) {
              context.read<SplashCubit>().init();
              context.read<HomeCubit>().init();
              Navigator.pushNamedAndRemoveUntil(
                context,
                RoutesName.splash,
                (route) => false,
              );
            }
          },
          builder: (context, state) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(
                  MediaQuery.of(context).size.width * 0.1,
                ),
                child: CustomButton(
                  text: 'Sign Out',
                  onTap: context.read<ProfileCubit>().signOut,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
