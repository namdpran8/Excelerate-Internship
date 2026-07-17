/// Border radius constants for the Excelerate design system.
///
/// Use these values for all [BorderRadius] definitions to ensure consistent
/// corner rounding across every component.
///
/// Usage:
/// ```dart
/// BorderRadius.circular(ExRadii.md)
/// ```
import 'package:flutter/material.dart';

class ExRadii {
  const ExRadii._();

  /// 8.0 — Small rounding for buttons, text fields.
  static const double sm = 8.0;

  /// 12.0 — Medium rounding for small cards, tooltips.
  static const double md = 12.0;

  /// 16.0 — Large rounding for primary cards.
  static const double lg = 16.0;

  /// 28.0 — Extra-large rounding for prominent containers.
  static const double xl = 28.0;

  /// 9999.0 — Full / stadium rounding for pills, search bars, chips.
  static const double full = 9999.0;

  // ────────────────────────────────────────────────────────────────────────
  // Pre-built BorderRadius shortcuts for common use cases.
  // ────────────────────────────────────────────────────────────────────────

  /// [BorderRadius] with [sm] rounding on all corners.
  static final BorderRadius borderRadiusSm = BorderRadius.circular(sm);

  /// [BorderRadius] with [md] rounding on all corners.
  static final BorderRadius borderRadiusMd = BorderRadius.circular(md);

  /// [BorderRadius] with [lg] rounding on all corners.
  static final BorderRadius borderRadiusLg = BorderRadius.circular(lg);

  /// [BorderRadius] with [full] rounding (stadium shape).
  static final BorderRadius borderRadiusFull = BorderRadius.circular(full);
}
