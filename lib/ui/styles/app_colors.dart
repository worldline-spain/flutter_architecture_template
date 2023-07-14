import 'package:flutter/material.dart';

class AppColors {
  static const Color white = Color(0xffFFFFFF);
  static const Color black = Color(0xff000000);

  static const Color primary = Color(0xff003366);
  static const Color primaryAccent = Color(0xff003399);
  static const Color errorBackground = Color(0xffF6D6D6);

  static MaterialColor materialColor = MaterialColorGenerator.from(primary);
}

class MaterialColorGenerator {
  static MaterialColor from(Color color) {
    return MaterialColor(color.value, <int, Color>{
      50: color.withOpacity(0.1),
      100: color.withOpacity(0.2),
      200: color.withOpacity(0.3),
      300: color.withOpacity(0.4),
      400: color.withOpacity(0.5),
      500: color.withOpacity(0.6),
      600: color.withOpacity(0.7),
      700: color.withOpacity(0.8),
      800: color.withOpacity(0.9),
      900: color.withOpacity(1.0),
    });
  }
}
