import 'package:flutter/material.dart';
import 'package:caretosharemobile/core/utils/colors.dart';

final appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
  fontFamily: 'Aptos',
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontFamily: 'Aptos'),
    displayMedium: TextStyle(fontFamily: 'Aptos'),
    displaySmall: TextStyle(fontFamily: 'Aptos'),
    headlineLarge: TextStyle(fontFamily: 'Aptos'),
    headlineMedium: TextStyle(fontFamily: 'Aptos'),
    headlineSmall: TextStyle(fontFamily: 'Aptos'),
    titleLarge: TextStyle(fontFamily: 'Aptos'),
    titleMedium: TextStyle(fontFamily: 'Aptos'),
    titleSmall: TextStyle(fontFamily: 'Aptos'),
    bodyLarge: TextStyle(fontFamily: 'Aptos'),
    bodyMedium: TextStyle(fontFamily: 'Aptos'),
    bodySmall: TextStyle(fontFamily: 'Aptos'),
    labelLarge: TextStyle(fontFamily: 'Aptos'),
    labelMedium: TextStyle(fontFamily: 'Aptos'),
    labelSmall: TextStyle(fontFamily: 'Aptos'),
  ),
  textSelectionTheme: TextSelectionThemeData(
    selectionHandleColor: primaryColor,
    cursorColor: primaryColor,
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(primaryColor),
      foregroundColor: WidgetStateProperty.all(white),
    ),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    circularTrackColor: primaryColor.withAlpha(20),
    color: primaryColor,
  ),
  checkboxTheme: CheckboxThemeData(
    checkColor: WidgetStateProperty.all(white),
    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return primaryColor;
      }
      return Colors.transparent;
    }),
    side: BorderSide(color: black, width: 2),
  ),
  radioTheme: RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return primaryColor;
      }
      return Colors.black;
    }),
  ),
  datePickerTheme: DatePickerThemeData(backgroundColor: white),
);
