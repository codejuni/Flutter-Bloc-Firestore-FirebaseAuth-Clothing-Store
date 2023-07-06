import 'package:clothing_store_firestore_crud/src/domain/status/screen_status.dart';
import 'package:clothing_store_firestore_crud/src/ui/routes/route_name.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/home/cubit/home_cubit.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/login/login_screen.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/register/cubit/register_cubit.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/register/cubit/register_state.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/splash/cubit/splash_cubit.dart';
import 'package:clothing_store_firestore_crud/src/ui/widgets/custom_button.dart';
import 'package:clothing_store_firestore_crud/src/ui/widgets/custom_dialog_accept.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => RegisterCubit(context.read()),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state.status == ScreenStatus.error) {
              customDialogAccept(
                context: context,
                exception: state.exception,
                onTap: context.read<RegisterCubit>().changeStatus,
              );
            } else if (state.status == ScreenStatus.success) {
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
            return Column(
              children: [
                AppBar(
                  title: const Text('Create new user'),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: Column(
                      children: [
                        AuthFormField(
                          hint: 'email',
                          controller: state.emailController,
                          icon: Icons.email,
                        ),
                        const SizedBox(height: 30),
                        AuthFormField(
                          hint: 'name',
                          controller: state.nameController,
                          icon: Icons.email,
                        ),
                        const SizedBox(height: 30),
                        AuthFormField(
                          hint: 'surname',
                          controller: state.surnameController,
                          icon: Icons.email,
                        ),
                        const SizedBox(height: 30),
                        AuthFormField(
                          hint: 'password',
                          controller: state.passController,
                          icon: Icons.email,
                        ),
                        const SizedBox(height: 30),
                        AuthFormField(
                          hint: 'confirm password',
                          controller: state.confirmPassController,
                          icon: Icons.email,
                        ),
                        const SizedBox(height: 40),
                        CustomButton(
                          text: 'Sing Up',
                          onTap: context.read<RegisterCubit>().register,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
