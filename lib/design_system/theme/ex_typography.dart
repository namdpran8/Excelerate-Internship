import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Excelerate typography definitions.
///
/// Builds the [TextTheme] used across the app with three font families:
/// - **DancingScript** — Display styles (decorative/brand)
/// - **Be Vietnam Pro** — Headline styles (modern tech feel)
/// - **Inter** — Title and body styles (clean readability)
///
/// This is consumed by [AppTheme] when assembling [ThemeData].
///
/// See also:
///   - [Material 3 Type Scale](https://m3.material.io/styles/typography/type-scale-tokens)

/// Typography factory for the Excelerate design system.
///
/// This class is not meant to be instantiated. Call [ExTypography.textTheme]
/// to get a fully configured [TextTheme].
class ExTypography {
  const ExTypography._();

  /// Builds the complete [TextTheme] with Excelerate's font choices.
  ///
  /// This is a factory method (not a static field) because [GoogleFonts]
  /// returns new [TextStyle] instances each call. Caching is handled by
  /// the [ThemeData] objects in [AppTheme].
  static TextTheme buildTextTheme() {
    return TextTheme(
      // The cursive font for Welcome / Large Displays
      displayLarge: GoogleFonts.dancingScript(fontSize: 57, fontWeight: FontWeight.bold, height: 1.12, letterSpacing: -0.25),
      displayMedium: GoogleFonts.dancingScript(fontSize: 45, fontWeight: FontWeight.bold, height: 1.15, letterSpacing: 0),
      displaySmall: GoogleFonts.dancingScript(fontSize: 36, fontWeight: FontWeight.bold, height: 1.22, letterSpacing: 0),

      // The modern tech font for Headlines
      headlineLarge: GoogleFonts.beVietnamPro(fontSize: 32, fontWeight: FontWeight.w600, height: 1.25, letterSpacing: 0),
      headlineMedium: GoogleFonts.beVietnamPro(fontSize: 28, fontWeight: FontWeight.w600, height: 1.28, letterSpacing: 0),
      headlineSmall: GoogleFonts.beVietnamPro(fontSize: 24, fontWeight: FontWeight.w600, height: 1.33, letterSpacing: 0),

      // The clean readable font for Titles and Body
      titleLarge: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w600, height: 1.27, letterSpacing: 0),
      titleMedium: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600, height: 1.5, letterSpacing: 0.15),
      titleSmall: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, height: 1.42, letterSpacing: 0.1),

      bodyLarge: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400, height: 1.5, letterSpacing: 0.5),
      bodyMedium: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400, height: 1.42, letterSpacing: 0.25),
      bodySmall: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, height: 1.33, letterSpacing: 0.4),

      // Label styles for buttons, chips, etc.
      labelLarge: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, height: 1.42, letterSpacing: 0.1),
      labelMedium: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, height: 1.33, letterSpacing: 0.5),
      labelSmall: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w600, height: 1.45, letterSpacing: 0.5),
    );
  }
}
