import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const COLOR_PRIMARY = Colors.deepOrangeAccent;
const COLOR_ACCENT = Colors.orange;
const COLOR_BACKGROUND_DARK = Color(0xFF171822);
const COLOR_BACKGROUND = Colors.white;
const COLOR_BACKGROUND_LIGHT = Color(0xFFF1F3F6);

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: COLOR_PRIMARY,
  cardColor: const Color(0xffF1F3F6),
  dividerColor: const Color(0xff7b7f9e),
  iconTheme: const IconThemeData(
    color: Color(0xFF3A4276),
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0.0,
    titleTextStyle: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w800,
      letterSpacing: .50,
      color: COLOR_BACKGROUND_DARK,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.never,
    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
    errorStyle: TextStyle(
      color: Colors.transparent,
      fontSize: 0.001,
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent, width: 0.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent, width: 0.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent, width: 0.0),
    ),
    // disabledBorder: OutlineInputBorder(
    //   borderSide: BorderSide(color: Colors.transparent, width: 0.0),
    // ),

    disabledBorder: InputBorder.none,
  ),
  textTheme: TextTheme(
    labelLarge: GoogleFonts.poppins(
      fontSize: 15,
      height: 1.6,
      color: const Color(0xff212330),
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 12,
      color: const Color(0xff1B1D28),
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: GoogleFonts.poppins(
      height: 1.6,
      fontSize: 12,
      color: const Color(0xff7b7f9e),
      fontWeight: FontWeight.w400,
    ),
    displayMedium: GoogleFonts.poppins(
      fontSize: 24,
      color: const Color(0xff171822),
      fontWeight: FontWeight.w600,
    ),
    displaySmall: GoogleFonts.poppins(
      fontSize: 22,
      color: const Color(0xff3A4276),
      fontWeight: FontWeight.w800,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 15,
      color: const Color(0xff171822),
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: GoogleFonts.poppins(
      fontSize: 22,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: GoogleFonts.poppins(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: GoogleFonts.poppins(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.w700,
    ),
    titleSmall: GoogleFonts.poppins(
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.w700,
    ),
  ),
  colorScheme: ColorScheme.fromSwatch()
      .copyWith(secondary: COLOR_BACKGROUND_LIGHT)
      .copyWith(background: COLOR_BACKGROUND),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  iconTheme: const IconThemeData(
    color: Color(0xff7b7f9e),
  ),
  cardColor: const Color(0xFF212330),
  appBarTheme: const AppBarTheme(
    elevation: 0.0,
    titleTextStyle: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w800,
      letterSpacing: .50,
      color: COLOR_BACKGROUND_LIGHT,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.never,
    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
    errorStyle: TextStyle(
      color: Colors.transparent,
      fontSize: 0.001,
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent, width: 0.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent, width: 0.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent, width: 0.0),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent, width: 0.0),
    ),
  ),
  textTheme: TextTheme(
    bodyMedium: GoogleFonts.poppins(
      fontSize: 12,
      color: const Color(0xffffffff),
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: GoogleFonts.poppins(
      height: 1.6,
      fontSize: 12,
      color: const Color(0xff7b7f9e),
      fontWeight: FontWeight.w400,
    ),
    labelLarge: GoogleFonts.poppins(
      fontSize: 15,
      height: 1.6,
      color: const Color(0xff212330),
      fontWeight: FontWeight.w600,
    ),
    displayMedium: GoogleFonts.poppins(
      fontSize: 24,
      color: const Color(0xFFFFFFFF),
      fontWeight: FontWeight.w600,
    ),
    displaySmall: GoogleFonts.poppins(
      fontSize: 22,
      color: const Color(0xFFFFFFFF),
      fontWeight: FontWeight.w800,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 15,
      color: const Color(0xFFF1F3F6),
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: GoogleFonts.poppins(
      fontSize: 22,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: GoogleFonts.poppins(
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: GoogleFonts.poppins(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.w700,
    ),
    titleSmall: GoogleFonts.poppins(
      fontSize: 14,
      color: Colors.white,
      fontWeight: FontWeight.w700,
    ),
  ),
  // colorScheme: ColorScheme(background: COLOR_BACKGROUND_DARK),
);

TextStyle inputStyle = const TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 15.0,
);

double inputHeight = 50.0;

final txnMode = ['CASH', 'BANK'];

final dateFormat = ['dd-MM-yyyy', 'MM-dd-yyyy', 'yyyy-MM-dd'];
final currencyFormat = ['###,##0.00', '##,#0.00'];
final themes = ['LIGHT', 'DARK', 'SYSTEM'];
final List<Map<String, dynamic>> currencies = [
  {'code': 'rupee', 'name': 'Indian Rupees', 'symbol': '₹'},
  {'code': 'lira', 'name': 'Turkish lira', 'symbol': '₺'},
  {'code': 'pound', 'name': 'Pound', 'symbol': "£"},
  {'code': 'doller', 'name': 'US Doller', 'symbol': "\$"},
  {'code': 'yen', 'name': 'Yen', 'symbol': "¥"},
  {'code': 'franc', 'name': 'French franc', 'symbol': "₣"},
  {'code': 'peso', 'name': 'Peso', 'symbol': "₱"},
  {'code': 'ruble', 'name': 'Ruble', 'symbol': "₽"},
];

final yesNo = [
  {'key': true, 'value': 'Yes'},
  {'key': false, 'value': 'No'}
];

final List randomColor = [
  0xFFffebee,
  0xFFfce4ec,
  0xFFf3e5f5,
  0xFFede7f6,
  0xFFe8eaf6,
  0xFFe3f2fd,
  0xFFe1f5fe,
  0xFFe0f7fa,
  0xFFe0f2f1,
  0xFFe8f5e9,
  0xFFf1f8e9,
  0xFFf9fbe7,
  0xFFfffde7,
  0xFFfff8e1,
  0xFFfff3e0,
  0xFFfbe9e7,
  0xFFefebe9,
  0xFFfafafa,
  0xFFeceff1,
];
