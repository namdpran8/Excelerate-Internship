/// Central theme assembly for the Excelerate design system.
///
/// Composes color schemes, typography, and component themes into complete
/// [ThemeData] objects. This is the only file that touches [ThemeData]
/// directly — all other theme concerns are delegated to:
/// - [ExColorScheme] — color definitions
/// - [ExTypography] — font configuration
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

import '../tokens/radii.dart';
import '../tokens/spacing.dart';
import 'ex_color_scheme.dart';
import 'ex_typography.dart';

/// Assembles the final [ThemeData] for the Excelerate app.
///
/// Access via [AppTheme.lightTheme] and [AppTheme.darkTheme].
class AppTheme {
  const AppTheme._();

  // ──────────────────────────────────────────────────────────────────────────
  // Component themes
  // ──────────────────────────────────────────────────────────────────────────

  static final FilledButtonThemeData _filledButtonTheme = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: ExRadii.borderRadiusFull,
      ),
      padding: const EdgeInsets.symmetric(horizontal: ExSpacing.lg, vertical: ExSpacing.md),
    ),
  );

  static final OutlinedButtonThemeData _outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: ExRadii.borderRadiusFull,
      ),
      padding: const EdgeInsets.symmetric(horizontal: ExSpacing.lg, vertical: ExSpacing.md),
    ),
  );

  static const PageTransitionsTheme _pageTransitionsTheme = PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.windows: ZoomPageTransitionsBuilder(),
      TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.linux: ZoomPageTransitionsBuilder(),
    },
  );

  // ──────────────────────────────────────────────────────────────────────────
  // Assembled ThemeData
  // ──────────────────────────────────────────────────────────────────────────

  /// Complete dark theme for the app.
  static final ThemeData darkTheme = ThemeData(
    colorScheme: ExColorScheme.dark,
    scaffoldBackgroundColor: ExColorScheme.dark.surface,
    useMaterial3: true,
    filledButtonTheme: _filledButtonTheme,
    outlinedButtonTheme: _outlinedButtonTheme,
    pageTransitionsTheme: _pageTransitionsTheme,
    textTheme: ExTypography.buildTextTheme(),
  );

  /// Complete light theme for the app.
  static final ThemeData lightTheme = ThemeData(
    colorScheme: ExColorScheme.light,
    scaffoldBackgroundColor: ExColorScheme.light.surface,
    useMaterial3: true,
    filledButtonTheme: _filledButtonTheme,
    outlinedButtonTheme: _outlinedButtonTheme,
    pageTransitionsTheme: _pageTransitionsTheme,
    textTheme: ExTypography.buildTextTheme(),
  );
}
