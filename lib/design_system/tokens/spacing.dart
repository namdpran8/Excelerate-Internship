/// Spacing constants for the Excelerate design system.
///
/// Use these values for all padding, margin, and gap measurements to ensure
/// visual consistency across every screen.
///
/// The scale follows a 4px base unit:
/// ```
/// xs(4) → sm(8) → md(16) → lg(24) → xl(32) → xxl(48)
/// ```
///
/// Usage:
/// ```dart
/// Padding(padding: EdgeInsets.all(ExSpacing.md))
/// SizedBox(height: ExSpacing.sm)
/// ```
class ExSpacing {
  const ExSpacing._();

  /// 4.0 — Tight spacing between related inline elements.
  static const double xs = 4.0;

  /// 8.0 — Default spacing between closely related elements.
  static const double sm = 8.0;

  /// 16.0 — Standard content padding and inter-element gaps.
  static const double md = 16.0;

  /// 24.0 — Section-level padding and card content padding.
  static const double lg = 24.0;

  /// 32.0 — Major section separation and empty-state padding.
  static const double xl = 32.0;

  /// 48.0 — Page-level separation and large whitespace blocks.
  static const double xxl = 48.0;
}
