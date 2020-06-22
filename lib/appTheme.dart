import 'package:flutter/material.dart';

class AppTheme {
  AppTheme();

  static const Color primaryColor = Color(0xFFf67262);
  static const Color secondaryColor = Color(0xFFF78361);
  static const Color thirdColor = Color(0xFFF54B64);
  static const Color nearlyWhite = Color(0xFFFAFAFA);

  static const Color background = Color(0xFFFDF8F6);

  static const List<Color> colorsGradient = <Color>[
    Color(0xFF633AF6),
    Color(0xFF519FF7),
  ];

  static const InputDecoration inputDecoration = InputDecoration(
    enabledBorder: const OutlineInputBorder(
        borderSide: const BorderSide(color: AppTheme.primaryColor, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(10))),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppTheme.primaryColor, width: 2.4),
      borderRadius: BorderRadius.all(Radius.circular(18.0)),
    ),
  );

  static ThemeData lightTheme = ThemeData.light().copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: primaryColor,
      backgroundColor: background,
      scaffoldBackgroundColor: background,
      cardColor: Colors.white,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
      ),
      accentColor: primaryColor,
      buttonColor: Colors.white,
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.white,
        //  <-- this auto selects the right color
      ));
}
