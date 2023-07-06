import 'package:flutter/material.dart';

class AppColors {
  static Color hexToColor(String hexColor) {
    String formattedColor = hexColor.replaceAll("#", "");
    int colorInt = int.parse(formattedColor, radix: 16);

    if (formattedColor.length == 6) {
      colorInt +=
          0xFF000000; // Agrega el canal alfa si no está presente en el código hexadecimal
    }

    return Color(colorInt);
  }

  static Color primaryColor = hexToColor('FFC107');
  static Color? hint = Colors.grey[400];
  static Color? scaffold = hexToColor('F8F8FF');
  static Color? dark = hexToColor('263238');
  static Color? lightNightBlue = hexToColor('000080');
  static Color? darkNightBlue = hexToColor('191970');
}
