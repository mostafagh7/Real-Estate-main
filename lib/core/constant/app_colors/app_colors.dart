import 'package:flutter/material.dart';

extension AppColors on ColorScheme {

  // light Theme Colors
  static Color lightSecondaryColor = const Color(0xffFFFFFF);
  static Color lightSubHeadingColor1 = const Color(0xff343F53);

  // dark theme color
  static Color darkPrimaryColor = const Color(0xff1E1E2C);
  static Color darkSubHeadingColor1 = const Color(0xDDF2F1F6);



  Color get primaryColor => brightness == Brightness.light ? primary : darkSubHeadingColor1;
  Color get secondaryColor => brightness == Brightness.light ? lightSecondaryColor : darkSubHeadingColor1;

  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black1c = Color(0xFF1C1C1C);
  static const Color black14 = Color(0xFF141414);
  static const Color grey9A = Color(0xFF9A9A9A);
  static const Color grey3B= Color(0xFF3B3B3B);
  static const Color whiteF1= Color(0xFFF1F1F1);
  static const Color whiteF0= Color(0xFFF0F0F0);
  static const Color babyBlue= Color(0xFF87CEEB);
}
