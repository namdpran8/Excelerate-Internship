/// Central theme configuration for the Excelerate design system.
///
/// Provides [lightTheme] and [darkTheme] as complete [ThemeData] objects
/// ready for use in [MaterialApp]. Includes button theming, page transitions,
/// typography, and color schemes.
///
/// Usage:
/// ```dart
/// MaterialApp(
///   theme: AppTheme.lightTheme,
///   darkTheme: AppTheme.darkTheme,
///   themeMode: ThemeMode.system,
/// )
/// ```
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Dark Color Scheme
  static final ColorScheme _darkColorScheme = const ColorScheme.dark(
    surface: Color(0xFF141310),
    surfaceContainerLowest: Color(0xFF0F0E0B),
    surfaceContainerLow: Color(0xFF1D1C18),
    surfaceContainer: Color(0xFF21201B),
    surfaceContainerHigh: Color(0xFF2B2A26),
    surfaceContainerHighest: Color(0xFF363530),
    onSurface: Color(0xFFE6E2DB),
    onSurfaceVariant: Color(0xFFD7C2BF),
    outline: Color(0xFF9F8C8A),
    outlineVariant: Color(0xFF524341),
    primary: Color(0xFFFFDAD5),
    onPrimary: Color(0xFF51221C),
    primaryContainer: Color(0xFFFFB4A9),
    onPrimaryContainer: Color(0xFF7A433B),
    secondary: Color(0xFFA5D299),
    onSecondary: Color(0xFF11380F),
    surfaceVariant: Color(0xFF363530),
  );

  // Light Color Scheme
  static final ColorScheme _lightColorScheme = const ColorScheme.light(
    surface: Color(0xFFFFF8F6),
    surfaceContainerLowest: Color(0xFFFFFFFF),
    surfaceContainerLow: Color(0xFFFEF1EE),
    surfaceContainer: Color(0xFFF9EBE8),
    surfaceContainerHigh: Color(0xFFF3E5E3),
    surfaceContainerHighest: Color(0xFFEEDFDD),
    onSurface: Color(0xFF211A19),
    onSurfaceVariant: Color(0xFF534341),
    outline: Color(0xFF857370),
    outlineVariant: Color(0xFFD8C2BF),
    primary: Color(0xFF8F4C43),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFFFDAD5),
    onPrimaryContainer: Color(0xFF3A0905),
    secondary: Color(0xFF3D6835),
    onSecondary: Color(0xFFFFFFFF),
    surfaceVariant: Color(0xFFF5E0DD),
  );

  static final FilledButtonThemeData _filledButtonTheme = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
    ),
  );

  static final OutlinedButtonThemeData _outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
    ),
  );

  static final PageTransitionsTheme _pageTransitionsTheme = const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.windows: ZoomPageTransitionsBuilder(),
      TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.linux: ZoomPageTransitionsBuilder(),
    },
  );

  static TextTheme _buildTextTheme() {
    return TextTheme(
      // The cursive font for Welcome / Large Displays
      displayLarge: GoogleFonts.dancingScript(fontSize: 57, fontWeight: FontWeight.bold),
      displayMedium: GoogleFonts.dancingScript(fontSize: 45, fontWeight: FontWeight.bold),
      displaySmall: GoogleFonts.dancingScript(fontSize: 36, fontWeight: FontWeight.bold),
      
      // The modern tech font for Headlines
      headlineLarge: GoogleFonts.beVietnamPro(fontSize: 32, fontWeight: FontWeight.w600),
      headlineMedium: GoogleFonts.beVietnamPro(fontSize: 28, fontWeight: FontWeight.w600),
      headlineSmall: GoogleFonts.beVietnamPro(fontSize: 24, fontWeight: FontWeight.w600),
      
      // The clean readable font for Titles and Body
      titleLarge: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w600),
      titleMedium: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
      titleSmall: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
      
      bodyLarge: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400),
      bodyMedium: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400),
      bodySmall: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400),
    );
  }

  static final ThemeData darkTheme = ThemeData(
    colorScheme: _darkColorScheme,
    scaffoldBackgroundColor: _darkColorScheme.surface,
    useMaterial3: true,
    filledButtonTheme: _filledButtonTheme,
    outlinedButtonTheme: _outlinedButtonTheme,
    pageTransitionsTheme: _pageTransitionsTheme,
    textTheme: _buildTextTheme(),
  );

  static final ThemeData lightTheme = ThemeData(
    colorScheme: _lightColorScheme,
    scaffoldBackgroundColor: _lightColorScheme.surface,
    useMaterial3: true,
    filledButtonTheme: _filledButtonTheme,
    outlinedButtonTheme: _outlinedButtonTheme,
    pageTransitionsTheme: _pageTransitionsTheme,
    textTheme: _buildTextTheme(),
  );
}
