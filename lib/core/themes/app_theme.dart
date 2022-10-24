import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();
  static Color backgroundColor = const Color(0xffffffff);
  static Color primaryColor = const Color(0xffFF4133);
  static Color textColor = const Color(0xff101541);

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    backgroundColor: backgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: textColor),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateColor.resolveWith(
          (states) => primaryColor),
    ),
    appBarTheme: AppBarTheme(
      elevation: 2,
      backgroundColor: backgroundColor,
      foregroundColor: Colors.black,
    ),
  );
}
