import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const primaryColor = Color(0xFF24262E);
  static const orangeColor = Color(0xFFFAA62B);
  static const gray = Color(0xFF83909A);
  static const gray2 = Color(0xFF30333D);
  static const gray3 = Color(0xFF2B2D35);
  static const gray4 = Color(0xFF444A54);
  static const gray5 = Color(0xFFB6BEC0);
  static const gray6 = Color(0xFFB5BABE);
  static const gray7 = Color(0xFFD8D8E3);
  static const gray8 = Color(0xFF54595F);
  static const gray9 = Color(0xFF707070);
  static const gray10 = Color(0xFF3D424C);
  static const gray11 = Color(0xFF8C9BA5);
  static const teal = Color(0xFF00D2D4);
  static const tomato = Color(0xFFC6382C);
  static const green = Color(0xFF41B95C);
  static const green2 = Color(0xFF53AE57);
  static const darkGreen = Color(0xFF355344);
  static const darkGreen2 = Color(0xFF0A3E3A);
  static const darkGreen3 = Color(0xFF164A50);
  static const red = Color(0xFFE74A1D);
  static const red2 = Color(0xFFD54E25);
  static const darkRed = Color(0xFF5B3839);
  static const orange = Color(0xFFFAA62B);
  static const orange2 = Color(0xFFDF8E3A);
  static const orange3 = Color(0xFFBB7A2A);

  static Color upColor = const Color(0xff58A225);
  static Color lightGreen = const Color(0xff75E58B);
  static Color downColor = Colors.red;
  static Color downColorLight = Color.fromARGB(255, 234, 146, 139);
  // static Color primaryColor = const Color(0xffFDC227);
  static Color primaryColorLight = const Color(0xff5BB15D);
  static Color primaryColorDark = const Color(0xff306334);
  static Color dividerColor = const Color(0xff71717D);
  static Color hintColor = const Color(0xff717D7D);

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    backgroundColor: const Color(0xff121117),
    primaryColor: primaryColor,
    primaryColorLight: primaryColorLight,
    primaryColorDark: primaryColorDark,
    cardColor: const Color(0xff2B2A3B),
    hintColor: hintColor,
    disabledColor: dividerColor,
    dividerColor: dividerColor,
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white),
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      centerTitle: true,
      elevation: 0,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(
      TextTheme(
        subtitle1: const TextStyle(),
        subtitle2: TextStyle(color: lightGreen),
        button: TextStyle(color: dividerColor),
        caption: TextStyle(color: dividerColor),
        headline5: const TextStyle(),
        headline6: const TextStyle(fontSize: 22),
        overline: const TextStyle(letterSpacing: 0),
      ),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.grey.shade50,
    primaryColor: primaryColor,
    primaryColorLight: primaryColorLight,
    primaryColorDark: primaryColorDark,
    cardColor: Colors.grey.shade200,
    hintColor: hintColor,
    disabledColor: dividerColor,
    dividerColor: dividerColor,
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      centerTitle: true,
      elevation: 0,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(
      TextTheme(
        subtitle1: const TextStyle(),
        subtitle2: TextStyle(color: lightGreen),
        button: TextStyle(color: dividerColor),
        caption: TextStyle(color: dividerColor),
        headline5: const TextStyle(),
        headline6: const TextStyle(fontSize: 22),
        overline: const TextStyle(letterSpacing: 0),
      ),
    ),
  );

  static ShaderCallback shaderCallback = (Rect bounds) => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[primaryColorLight, primaryColorDark],
        tileMode: TileMode.mirror,
      ).createShader(bounds);
}
