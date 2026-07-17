import 'package:flutter/material.dart';
import '../../tokens/radii.dart';
import '../../tokens/spacing.dart';

/// A Material 3 Expressive surface card with tonal elevation and ink ripple.
///
/// Provides a tinted surface container with rounded corners and an optional
/// tap callback that triggers a Material ink ripple effect. Use this as the
/// base building block for any card-style layout.
///
/// ```dart
/// ExCard(
///   onTap: () => print('Tapped'),
///   padding: EdgeInsets.all(ExSpacing.lg),
///   child: Text('Card content'),
/// )
/// ```
///
/// See also:
///   - [ProgramCard] — a composite card built on top of this.
class ExCard extends StatelessWidget {
  /// The card's content widget.
  final Widget child;

  /// Padding around [child] inside the card. Defaults to [ExSpacing.lg] on all sides.
  final EdgeInsetsGeometry? padding;

  /// Optional tap callback. When non-null, the card shows an ink ripple on tap.
  final VoidCallback? onTap;

  /// The card's margin. Defaults to zero.
  final EdgeInsetsGeometry? margin;

  const ExCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(ExSpacing.lg),
    this.margin = EdgeInsets.zero,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: margin,
      clipBehavior: Clip.antiAlias, // Ensure ripple stays within rounded borders
      shape: RoundedRectangleBorder(
        borderRadius: ExRadii.borderRadiusLg,
      ),
      // In Flutter 3.16+, Card.filled provides the surface variant color naturally,
      // but to match the previous custom tint logic, we can explicitly set the color
      // or just rely on the theme's cardTheme/colorScheme.
      color: ElevationOverlay.applySurfaceTint(
        Theme.of(context).colorScheme.surface,
        Theme.of(context).colorScheme.primary,
        1.0, 
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: child,
        ),
      ),
    );
  }
}
