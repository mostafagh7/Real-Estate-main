import 'package:flutter/material.dart';

import '../../ui/widgets/font_family.dart';
import 'app_font_weight.dart';
import 'font_size.dart';

class AppTextStyle {

  static TextStyle getTextStyle(double fontSize, Color color, FontWeight fontWeight,String? fontFamily, {TextDecoration? textDecoration,Color? decorationColor}){
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
     decoration: textDecoration,
      decorationColor: decorationColor
    );
  }

  static TextStyle getRegularStyle({double fontSize = AppFontSize.size_12,FontWeight? fontWeight, required Color color,String? fontFamily,TextDecoration? textDecoration}){
    return getTextStyle(fontSize, color,fontWeight?? AppFontWeight.regular,fontFamily??AppFontFamily.fontMontserrat,textDecoration: textDecoration);
  }

  static TextStyle getMediumStyle(
      {double fontSize = AppFontSize.size_12, required Color color,FontWeight? fontWeight,String? fontFamily}){
    return getTextStyle(fontSize, color,fontWeight?? AppFontWeight.medium,AppFontFamily.fontMontserrat);
  }

  static TextStyle getLightStyle(
      {double fontSize = AppFontSize.size_12, required Color color,FontWeight? fontWeight,String? fontFamily}){
    return getTextStyle(fontSize, color,fontWeight?? AppFontWeight.light,AppFontFamily.fontMontserrat);
  }

  static TextStyle getBoldStyle(
      {double fontSize = AppFontSize.size_12, required Color color,FontWeight? fontWeight,String? fontFamily,TextDecoration? textDecoration}){
    return getTextStyle(fontSize, color,fontWeight?? AppFontWeight.bold,AppFontFamily.fontMontserrat,textDecoration: textDecoration);
  }

  static TextStyle getSemiBoldStyle(
      {double fontSize = AppFontSize.size_12, required Color color,FontWeight? fontWeight,String? fontFamily,TextDecoration? textDecoration}){
    return getTextStyle(fontSize, color,fontWeight?? AppFontWeight.semiBold,AppFontFamily.fontMontserrat,textDecoration: textDecoration);
  }

  static const normalWhite_12 = TextStyle(
    fontSize: AppFontSize.size_12,
    color: Colors.white,
    fontWeight: FontWeight.normal,
    fontFamily: 'Cairo',
  );

}