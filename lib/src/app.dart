import 'package:clothing_store_firestore_crud/src/dependencies.dart';
import 'package:clothing_store_firestore_crud/src/ui/routes/route_name.dart';
import 'package:clothing_store_firestore_crud/src/ui/routes/route_page.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/details/cubit/details_cubit.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/home/cubit/home_cubit.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/products/cubit/products_cubit.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/splash/cubit/splash_cubit.dart';
import 'package:clothing_store_firestore_crud/src/ui/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// The root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Create repositories using MultiRepositoryProvider
    return MultiRepositoryProvider(
      providers: buildRepositories,
      child: MultiBlocProvider(
        providers: [
          // Provide SplashCubit to initialize the app
          BlocProvider(
            create: (context) => SplashCubit()..init(),
          ),
          // Provide HomeCubit for the home screen
          BlocProvider(
            create: (context) => HomeCubit(
              context.read(),
              context.read(),
              context.read(),
            )..init(),
          ),
          // Provide DetailsCubit for the details screen
          BlocProvider(
            create: (context) => DetailsCubit(
              context.read(),
            ),
          ),
          // Provide ProductsCubit for the products screen
          BlocProvider(
            create: (context) => ProductsCubit(
              context.read(),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'App Chat',
          theme: AppTheme.light,
          onGenerateRoute: RoutesPage.onGenerateRoute,
          initialRoute: RoutesName.splash,
        ),
      ),
    );
  }
}
