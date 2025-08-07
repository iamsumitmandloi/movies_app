import 'package:flutter/material.dart';

class AppTheme {
  static const Color netflixRed = Color(0xFFE50914);

  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF2D2D2D);
  static const Color darkCard = Color(0xFF1E1E1E);
  static const Color darkOnSurface = Color(0xFFE0E0E0);

  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightSurface = Color(0xFFF8F9FA);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightOnSurface = Color(0xFF212529);

  static const Color success = Color(0xFF28A745);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFDC3545);
  static const Color info = Color(0xFF17A2B8);

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(
        primary: netflixRed,
        secondary: netflixRed,
        background: darkBackground,
        surface: darkSurface,
        onSurface: darkOnSurface,
        error: error,
      ),
      scaffoldBackgroundColor: darkBackground,
      cardColor: darkCard,
      appBarTheme: const AppBarTheme(
        backgroundColor: darkBackground,
        foregroundColor: darkOnSurface,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: darkOnSurface,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: netflixRed,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: darkSurface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: netflixRed),
        ),
        hintStyle: TextStyle(color: darkOnSurface.withOpacity(0.6)),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: darkCard,
        selectedItemColor: netflixRed,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      textTheme: _getTextTheme(darkOnSurface),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: netflixRed,
        secondary: netflixRed,
        background: lightBackground,
        surface: lightSurface,
        onSurface: lightOnSurface,
        error: error,
      ),
      scaffoldBackgroundColor: lightBackground,
      cardColor: lightCard,
      appBarTheme: const AppBarTheme(
        backgroundColor: lightBackground,
        foregroundColor: lightOnSurface,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: lightOnSurface,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: netflixRed,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: lightSurface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: netflixRed),
        ),
        hintStyle: TextStyle(color: lightOnSurface.withOpacity(0.6)),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: lightCard,
        selectedItemColor: netflixRed,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      textTheme: _getTextTheme(lightOnSurface),
    );
  }

  static TextTheme _getTextTheme(Color textColor) {
    return TextTheme(
      displayLarge: TextStyle(
        color: textColor,
        fontSize: 57,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.25,
      ),
      displayMedium: TextStyle(
        color: textColor,
        fontSize: 45,
        fontWeight: FontWeight.w400,
      ),
      displaySmall: TextStyle(
        color: textColor,
        fontSize: 36,
        fontWeight: FontWeight.w400,
      ),
      headlineLarge: TextStyle(
        color: textColor,
        fontSize: 32,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: TextStyle(
        color: textColor,
        fontSize: 28,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        color: textColor,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        color: textColor,
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      ),
      titleSmall: TextStyle(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
      bodyLarge: TextStyle(
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
      bodyMedium: TextStyle(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      bodySmall: TextStyle(
        color: textColor,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
      ),
      labelLarge: TextStyle(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
      labelMedium: TextStyle(
        color: textColor,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
      ),
      labelSmall: TextStyle(
        color: textColor,
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
      ),
    );
  }
}
