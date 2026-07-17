/// Elevation level constants for the Excelerate design system.
///
/// Material 3 uses tonal surface colors instead of drop shadows, but
/// elevation values are still used by [ElevationOverlay] and [Material]
/// to determine the surface tint level.
///
/// Usage:
/// ```dart
/// Card(elevation: ExElevations.level1)
/// ```
class ExElevations {
  const ExElevations._();

  /// 0.0 — Flat surface, no elevation (used by cards in this system).
  static const double level0 = 0.0;

  /// 1.0 — Subtle tonal elevation for containers.
  static const double level1 = 1.0;

  /// 3.0 — Medium elevation for raised surfaces.
  static const double level2 = 3.0;

  /// 6.0 — High elevation for modals and dialogs.
  static const double level3 = 6.0;
}
