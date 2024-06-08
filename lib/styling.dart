// File: lib/app_styles.dart
import 'package:flutter/material.dart';

class AppStyles {

  //Text Styles
  static final TextStyle header1 = TextStyle(
      color: AppColors.secondary,
      fontSize: 32,
      fontWeight: FontWeight.bold,
      fontFamily: "Philosopher");
      
  static final TextStyle header2 = TextStyle(
      color: AppColors.tertiary,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontFamily: "Philosopher");

  static final TextStyle header3 = TextStyle(
      color: AppColors.secondary, fontSize: 16, fontWeight: FontWeight.bold);

  static final TextStyle header4 = TextStyle(
      color: AppColors.tertiary, fontSize: 14, fontWeight: FontWeight.bold);

  static final TextStyle paragraph = TextStyle(
      color: AppColors.tertiary, fontSize: 14, fontWeight: FontWeight.normal);

//Button Styles
  static final ButtonStyle btnPrimary = ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(AppColors.primary),
      foregroundColor: MaterialStatePropertyAll(AppColors.secondary));

  static final ButtonStyle btnText = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.transparent),
    foregroundColor: MaterialStateProperty.all(AppColors.primary),
    padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
    textStyle: MaterialStateProperty.all(TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    )),
  );
}

class AppColors {
  static const Color primary = Color(0xffA80000);
  static const Color secondary = Color(0xffffffff);
  static const Color tertiary = Color(0xff1A0000);
  static const Color darkPrimary = Color(0xff660000);
  static const Color lightPrimary = Color(0xffFFCCCC);
  static const Color inputPlaceholder = Color(0xffB4B4B4);
  static const Color disabledInput = Color(0xfff0f0f0);
  static Color overlay = const Color(0xff1A0000).withOpacity(.4);
}
