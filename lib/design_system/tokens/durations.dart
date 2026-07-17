/// Animation duration constants for the Excelerate design system.
///
/// Use these values for all [AnimationController] durations and
/// [AnimatedContainer] / [AnimatedOpacity] durations to ensure
/// consistent motion across the app.
///
/// Usage:
/// ```dart
/// AnimationController(duration: ExDurations.medium, vsync: this)
/// ```
class ExDurations {
  const ExDurations._();

  /// 200ms — Quick micro-interactions (fade, color change).
  static const Duration short = Duration(milliseconds: 200);

  /// 400ms — Standard transitions (expand, slide).
  static const Duration medium = Duration(milliseconds: 400);

  /// 1000ms — Continuous animations (progress indicator cycles).
  static const Duration long = Duration(seconds: 1);

  /// 2000ms — Slow continuous animations (circular loaders).
  static const Duration extraLong = Duration(seconds: 2);
}
