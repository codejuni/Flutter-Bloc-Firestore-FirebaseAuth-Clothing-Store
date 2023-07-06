import 'package:clothing_store_firestore_crud/src/ui/routes/route_name.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/bag/bag_screen.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/details/details_screen.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/home/home_screen.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/login/login_screen.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/products/products_screen.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/profile/profile_screen.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/register/register_screen.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/search/search_screen.dart';
import 'package:clothing_store_firestore_crud/src/ui/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class RoutesPage {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return pushNamedWithSlideAnimation(
          const SplashScreen(),
          settings,
        );

      case RoutesName.home:
        return pushNamedWithSlideAnimation(
          const HomeScreen(),
          settings,
        );

      case RoutesName.search:
        return pushNamedWithSlideAnimation(
          const SearchScreen(),
          settings,
        );

      case RoutesName.products:
        return pushNamedWithSlideAnimation(
          const ProductsScreen(),
          settings,
        );

      case RoutesName.details:
        return pushNamedWithSlideAnimation(
          const DetailsScreen(),
          settings,
        );

      case RoutesName.bag:
        return pushNamedWithSlideAnimation(
          const BagScreen(),
          settings,
        );

      case RoutesName.login:
        return pushNamedWithSlideAnimation(
          const LoginScreen(),
          settings,
        );

      case RoutesName.profile:
        return pushNamedWithSlideAnimation(
          const ProfileScreen(),
          settings,
        );

      case RoutesName.register:
        return pushNamedWithSlideAnimation(
          const RegisterScreen(),
          settings,
        );

      default:
    }

    return MaterialPageRoute(
      builder: (context) {
        return const Scaffold(
          body: Center(
            child: Text('No route defined'),
          ),
        );
      },
    );
  }

  static PageRouteBuilder pushNamedWithSlideAnimation(
    Widget page,
    RouteSettings settings,
  ) {
    return PageRouteBuilder(
      reverseTransitionDuration: const Duration(milliseconds: 800),
      transitionDuration: const Duration(milliseconds: 800),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      fullscreenDialog: true,
      settings: settings,
      maintainState: true,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: animation,
              reverseCurve: Curves.decelerate,
              curve: Curves.decelerate,
            ),
          ),
          child: child,
        );
      },
    );
  }
}
