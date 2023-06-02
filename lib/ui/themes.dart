// Theme config for FlexColorScheme version 7.1.x. Make sure you use
// same or higher package version, but still same major version. If you
// use a lower package version, some properties may not be supported.
// In that case remove them after copying this theme to your app.

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

final lightTheme = FlexThemeData.light(
  scheme: FlexScheme.blueM3,
  fontFamily: 'Poppins',
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 4,
  subThemesData: const FlexSubThemesData(
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    inputDecoratorRadius: 8.0,
    inputDecoratorUnfocusedHasBorder: false,
    inputDecoratorFocusedHasBorder: false,
    inputDecoratorBorderWidth: 0,
  ),
  keyColors: const FlexKeyColors(
    useSecondary: true,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  textTheme: txtTheme,
);

final darkTheme = FlexThemeData.dark(
  scheme: FlexScheme.blueM3,
  fontFamily: 'Poppins',
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 13,
  subThemesData: const FlexSubThemesData(
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    inputDecoratorRadius: 8.0,
    inputDecoratorUnfocusedHasBorder: false,
    inputDecoratorFocusedHasBorder: false,
    inputDecoratorBorderWidth: 0,
    inputDecoratorFillColor: Color.fromARGB(255, 42, 42, 42),
  ),
  keyColors: const FlexKeyColors(
    useSecondary: true,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  textTheme: txtTheme,
  // inputDecorationTheme: const InputDecorationTheme(
  //   floatingLabelBehavior: FloatingLabelBehavior.never,
  //   contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
  //   errorStyle: TextStyle(
  //     color: Colors.transparent,
  //     fontSize: 0.001,
  //   ),
  //   errorBorder: OutlineInputBorder(
  //     borderSide: BorderSide(color: Colors.transparent, width: 0.0),
  //   ),
  //   focusedBorder: OutlineInputBorder(
  //     borderSide: BorderSide(color: Colors.transparent, width: 0.0),
  //   ),
  //   enabledBorder: OutlineInputBorder(
  //     borderSide: BorderSide(color: Colors.transparent, width: 0.0),
  //   ),
  //   disabledBorder: OutlineInputBorder(
  //     borderSide: BorderSide(color: Colors.transparent, width: 0.0),
  //   ),
  // ),
);

TextTheme txtTheme = const TextTheme(
  labelLarge: TextStyle(
    fontWeight: FontWeight.w600,
  ),
  displayMedium: TextStyle(
    fontWeight: FontWeight.w600,
  ),
  displaySmall: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w800,
  ),
  headlineLarge: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  ),
  headlineMedium: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  ),
  headlineSmall: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  ),
  titleLarge: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  ),
  titleMedium: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
  ),
  titleSmall: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  ),
  bodySmall: TextStyle(
    fontSize: 11,
  ),
  bodyMedium: TextStyle(
    fontSize: 13,
  ),
  bodyLarge: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  ),
);
