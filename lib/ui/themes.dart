// Theme config for FlexColorScheme version 7.1.x. Make sure you use
// same or higher package version, but still same major version. If you
// use a lower package version, some properties may not be supported.
// In that case remove them after copying this theme to your app.

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

final lightTheme = FlexThemeData.light(
  colors: const FlexSchemeColor(
    primary: Color(0xff004881),
    primaryContainer: Color(0xffd0e4ff),
    secondary: Color(0xffac3306),
    secondaryContainer: Color(0xffffdbcf),
    tertiary: Color(0xff006875),
    tertiaryContainer: Color(0xff95f0ff),
    appBarColor: Color(0xffffdbcf),
    error: Color(0xffb00020),
  ),

  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 4,
  subThemesData: const FlexSubThemesData(
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    inputDecoratorRadius: 8.0,
    inputDecoratorUnfocusedHasBorder: false,
    inputDecoratorFocusedHasBorder: false,
    
  ),

  keyColors: const FlexKeyColors(
    useSecondary: true,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  // To use the Playground font, add GoogleFonts package and uncomment
  // fontFamily: GoogleFonts.notoSans().fontFamily,
  textTheme: txtTheme,
);

final darkTheme = FlexThemeData.dark(
  colors: const FlexSchemeColor(
    primary: Color(0xff9fc9ff),
    primaryContainer: Color(0xff00325b),
    secondary: Color(0xffffb59d),
    secondaryContainer: Color(0xff872100),
    tertiary: Color(0xff86d2e1),
    tertiaryContainer: Color(0xff004e59),
    appBarColor: Color(0xff872100),
    error: Color(0xffcf6679),
  ),
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 13,
  subThemesData: const FlexSubThemesData(
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    inputDecoratorRadius: 16.0,
    inputDecoratorUnfocusedHasBorder: false,
    inputDecoratorFocusedHasBorder: false,
  ),
  keyColors: const FlexKeyColors(
    useSecondary: true,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  // To use the Playground font, add GoogleFonts package and uncomment
  // fontFamily: GoogleFonts.notoSans().fontFamily,
  textTheme: txtTheme,
);
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,

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
    fontSize: 12,
  ),
  bodyMedium: TextStyle(
    fontSize: 14,

    // fontWeight: FontWeight.w500,
  ),
  bodyLarge: TextStyle(
    // height: 1.6,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  ),
);
