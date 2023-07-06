import 'package:clothing_store_firestore_crud/src/ui/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    //Icons
    iconTheme: const IconThemeData(
      color: Colors.black,
      size: 18,
    ),

    // primary
    primaryColor: Colors.amberAccent[200],

    //Scaffold
    scaffoldBackgroundColor: AppColors.scaffold,

    //AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.scaffold,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
        size: 20,
      ),
      actionsIconTheme: const IconThemeData(
        color: Colors.black,
        size: 20,
      ),
    ),

    // Card
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 5,
      shadowColor: Colors.black26,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),

    // text
    textTheme: TextTheme(
      titleLarge: const TextStyle(
        color: Colors.black,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: const TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: const TextStyle(
        color: Colors.black,
        fontSize: 17,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        color: AppColors.hint,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
