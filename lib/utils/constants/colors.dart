import 'package:flutter/material.dart';

class TColors {
  TColors._();
  //app bar colors
  static const Color primary = Color(0xFF4b68ff);
  static const Color secondary = Color(0xFFffe24b);
  static const Color accent = Color(0xFFb0c7ff);
  static const Gradient linearGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [Color(0xFFff9a9e), Color(0xFFfad0c4), Color(0xFFfad0c4)],
  );
  //text colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6c7570);
  static const Color textWhite = Colors.white;
  //background colors
  static const Color lightBG = Color(0xFFf6f6f6);
  static const Color darkBG = Color(0xFF272727);
  static const Color primaryBG = Color(0xFFf3f5ff);
  //backgrounds container colors
  static const Color lightContainer = Color(0xFFf6f6f6);
  static Color darkContainer = TColors.white.withOpacity(0.1);
  //Button colors
  static const Color buttonPrimary = Color(0xFF4b68ff);
  static const Color buttonSecondary = Color(0xFF6c757d);
  static const Color buttonDisabled = Color(0xFFc4c4c4);
  //Border Colors
  static const Color borderPrimary = Color(0xFFd9d9d9);
  static const Color borderSecondary = Color(0xFFe6e6e6);
  //Error and validation colors
  static const Color error = Color(0xFFd32f2f);
  static const Color success = Color(0xFF388e3c);
  static const Color warning = Color(0xFFf57c00);
  static const Color info = Color(0xFF1976d2);
  //Neutral shades
  static const Color black = Color(0xFF232323);
  static const Color darkGrey = Color(0xFF939393);
  static const Color darkerGrey = Color(0xff4e4e4e);
  static const Color softGrey = Color(0xFFf4f4f4);
  static const Color lightGrey = Color(0xFFf9f9f9);
  static const Color grey = Color(0xFFe0e0e0);
  static const Color white = Color(0xffffffff);
}
