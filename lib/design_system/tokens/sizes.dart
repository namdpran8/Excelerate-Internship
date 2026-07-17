/// Component size constants for the Excelerate design system.
///
/// Use these values to enforce consistent dimensions for specific UI elements
/// such as buttons, avatars, icons, and inputs.
///
/// Usage:
/// ```dart
/// SizedBox(height: ExSizes.buttonHeight, width: ExSizes.buttonHeight)
/// Icon(icon, size: ExSizes.iconMd)
/// ```
class ExSizes {
  const ExSizes._();

  // ────────────────────────────────────────────────────────────────────────
  // Buttons
  // ────────────────────────────────────────────────────────────────────────
  
  /// 48.0 — Standard minimum height for tap targets (buttons, inputs).
  static const double buttonHeight = 48.0;

  // ────────────────────────────────────────────────────────────────────────
  // Icons
  // ────────────────────────────────────────────────────────────────────────
  
  /// 16.0 — Small icon.
  static const double iconSm = 16.0;

  /// 24.0 — Medium (standard) icon size.
  static const double iconMd = 24.0;

  /// 32.0 — Large icon size.
  static const double iconLg = 32.0;

  // ────────────────────────────────────────────────────────────────────────
  // Avatars
  // ────────────────────────────────────────────────────────────────────────
  
  /// 24.0 — Small avatar.
  static const double avatarSm = 24.0;

  /// 40.0 — Medium avatar.
  static const double avatarMd = 40.0;

  /// 56.0 — Large avatar.
  static const double avatarLg = 56.0;

  // ────────────────────────────────────────────────────────────────────────
  // Progress Indicators
  // ────────────────────────────────────────────────────────────────────────
  
  /// 4.0 — Standard stroke width for linear/circular progress.
  static const double progressStrokeWidth = 4.0;
  
  /// 36.0 — Standard size for circular progress indicator.
  static const double circularProgressSize = 36.0;
}
