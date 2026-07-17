import 'package:flutter/material.dart';

/// Excelerate color scheme definitions for light and dark modes.
///
/// These [ColorScheme] objects define the full tonal palette for the app.
/// They are consumed by [AppTheme] when assembling [ThemeData].
///
/// Colors follow the Material 3 color system with surface container
/// hierarchy (lowest → low → default → high → highest) for layered
/// elevation surfaces.
///
/// See also:
///   - [Material 3 Color System](https://m3.material.io/styles/color/system)

/// All color definitions for the Excelerate design system.
///
/// This class is not meant to be instantiated. Access the schemes via
/// [ExColorScheme.light] and [ExColorScheme.dark].
class ExColorScheme {
  const ExColorScheme._();

  /// Light mode color scheme — warm coral primary, green secondary.
  static const ColorScheme light = ColorScheme.light(
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
    error: Color(0xFFBA1A1A),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF410002),
    tertiary: Color(0xFF705C2E),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFFBDFA6),
    onTertiaryContainer: Color(0xFF251A00),
    inverseSurface: Color(0xFF362F2E),
    inversePrimary: Color(0xFFFFB4A9),
    onInverseSurface: Color(0xFFFBEEEC),
    scrim: Color(0xFF000000),
    shadow: Color(0xFF000000),
  );

  /// Dark mode color scheme — inverted warm coral tones.
  static const ColorScheme dark = ColorScheme.dark(
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
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFDAD6),
    tertiary: Color(0xFFDEC38C),
    onTertiary: Color(0xFF3E2E04),
    tertiaryContainer: Color(0xFF564419),
    onTertiaryContainer: Color(0xFFFBDFA6),
    inverseSurface: Color(0xFFEEDFDD),
    inversePrimary: Color(0xFF8F4C43),
    onInverseSurface: Color(0xFF362F2E),
    scrim: Color(0xFF000000),
    shadow: Color(0xFF000000),
  );
}
