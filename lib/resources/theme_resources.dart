import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageResources{
  ImageResources._();

  static const String logo = "assets/images/teatime-logo.png";
  static const String loginBg = "assets/images/bg-image.jpg";
  static const String loader = "assets/images/loader.gif";

}
class ThemeColors{
  ThemeColors._();
  static const Color red = Color(0xFF8b0015);

  // Color(0xFFe31a21);
  static const Color bizarre = Color(0xFFEFDFD6);
  static const Color woodSmoke = Color(0xFF050506);
  static const Color outerSpace = Color(0xFF32383E);
  static const Color outerSpace1 = Color(0xFF272c31);
  static const Color shadowColor = Color(0xFF405545);
}
class StyleResources{
  StyleResources._();
  static ThemeData lightTheme = ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme(),
    primarySwatch: Colors.red,
    primaryColor: ThemeColors.red,
    accentColor:ThemeColors.bizarre,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    backgroundColor: ThemeColors.bizarre,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: ThemeColors.red,
      ),
      color: ThemeColors.bizarre,
    ),
    scaffoldBackgroundColor: ThemeColors.bizarre,
  );
  static ThemeData darkTheme = ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme(),
    primarySwatch: Colors.red,
    primaryColor: ThemeColors.red,
    accentColor:ThemeColors.woodSmoke,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: ThemeColors.red,
      ),
      color: ThemeColors.outerSpace,
    ),
    backgroundColor: ThemeColors.outerSpace,
    scaffoldBackgroundColor: ThemeColors.outerSpace,
  );
}