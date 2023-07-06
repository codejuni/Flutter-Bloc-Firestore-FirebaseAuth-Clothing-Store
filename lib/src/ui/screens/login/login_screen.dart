import 'package:clothing_store_firestore_crud/src/domain/status/screen_status.dart';
import 'package:clothing_store_firestore_crud/src/ui/routes/route_name.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/home/cubit/home_cubit.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/login/cubit/login_cubit.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/login/cubit/login_state.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/splash/cubit/splash_cubit.dart';
import 'package:clothing_store_firestore_crud/src/ui/widgets/custom_button.dart';
import 'package:clothing_store_firestore_crud/src/ui/widgets/custom_dialog_accept.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(leading: const BackButton()),
      body: BlocProvider(
        create: (context) => LoginCubit(
          context.read(),
        ),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.status == ScreenStatus.error) {
              customDialogAccept(
                context: context,
                exception: state.exception,
                onTap: context.read<LoginCubit>().changeStatus,
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
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
                vertical: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontSize: 35,
                                  ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Enter your details to continue',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AuthFormField(
                          hint: 'email',
                          controller: state.emailController,
                          icon: Icons.email,
                        ),
                        const SizedBox(height: 30),
                        AuthFormField(
                          hint: 'password',
                          controller: state.passController,
                          icon: Icons.lock,
                          obscureText: true,
                          onEditingComplete: context.read<LoginCubit>().login,
                        ),
                        const SizedBox(height: 40),
                        CustomButton(
                          text: 'Sign In',
                          onTap: context.read<LoginCubit>().login,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Haven\'t joined yet?',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RoutesName.register);
                        },
                        child: Text(
                          'Create new user',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class AuthFormField extends StatelessWidget {
  const AuthFormField({
    super.key,
    required this.hint,
    required this.controller,
    required this.icon,
    this.obscureText,
    this.onEditingComplete,
  });

  final String hint;
  final TextEditingController controller;
  final IconData icon;
  final bool? obscureText;
  final VoidCallback? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: Theme.of(context).textTheme.bodyMedium,
      keyboardType: TextInputType.emailAddress,
      obscureText: obscureText ?? false,
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        suffixIcon: Icon(
          icon,
          color: Theme.of(context).textTheme.bodySmall!.color,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 5),
        labelText: hint,
        labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).textTheme.bodySmall!.color,
            ),
      ),
    );
  }
}
