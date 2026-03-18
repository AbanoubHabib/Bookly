import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  ///  Primary Color
  static const Color kPrimaryColor = Color(0xffEF8262);

  ///  Dark Background
  static const Color kDarkBackgroundColor = Color(0xff100B20);

  static const Color kLightBackgroundColor = Color(0xffC9CDCF);

  static const Color kLightSurfaceColor = Color(0xffE4E4E7);

  static const Color kBorderColor = Color(0xff000000);

  // =========================
  //  DARK THEME
  // =========================
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: kDarkBackgroundColor,
    primaryColor: kPrimaryColor,

    ///  Fonts
    textTheme: GoogleFonts.montserratTextTheme(
      ThemeData.dark().textTheme,
    ),

    ///  Colors
    colorScheme: const ColorScheme.dark(
      primary: kPrimaryColor,
      surface: Color(0xff1A142D),
      onSurface: Colors.white,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: kDarkBackgroundColor,
      elevation: 0,
      centerTitle: true,
    ),
    dividerColor: Colors.white24,
  );

  // =========================
  // LIGHT THEME
  // =========================
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: kLightBackgroundColor,
    primaryColor: kPrimaryColor,

    /// Fonts
    textTheme: GoogleFonts.montserratTextTheme(
      ThemeData.light().textTheme,
    ),

    /// Colors
    colorScheme: ColorScheme.light(
      primary: kPrimaryColor,
      secondary: kPrimaryColor.withValues(alpha: 0.8),
      surface: kLightSurfaceColor,
      onSurface: const Color(0xff100B20),
    ),

    /// AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: kLightBackgroundColor,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Color(0xff100B20)),
      titleTextStyle: TextStyle(
        color: Color(0xff100B20),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    /// Borders + Inputs
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: kLightSurfaceColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: kBorderColor.withValues(alpha: 0.2),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: kBorderColor.withValues(alpha: 0.15),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: kPrimaryColor,
          width: 1.5,
        ),
      ),
    ),

    dividerColor: Colors.black12,
  );
}


