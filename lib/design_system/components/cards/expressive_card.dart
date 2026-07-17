/// A Material 3 Expressive surface card with tonal elevation and ink ripple.
///
/// Provides a tinted surface container with rounded corners and an optional
/// tap callback that triggers a Material ink ripple effect. Use this as the
/// base building block for any card-style layout.
///
/// ```dart
/// ExpressiveCard(
///   onTap: () => print('Tapped'),
///   padding: EdgeInsets.all(ExSpacing.lg),
///   child: Text('Card content'),
/// )
/// ```
///
/// See also:
///   - [ProgramCard] — a composite card built on top of this.
import 'package:flutter/material.dart';

class ExpressiveCard extends StatelessWidget {
  /// The card's content widget.
  final Widget child;

  /// Padding around [child] inside the card. Defaults to 24px on all sides.
  final EdgeInsetsGeometry? padding;

  /// Optional tap callback. When non-null, the card shows an ink ripple on tap.
  final VoidCallback? onTap;

  const ExpressiveCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24.0), // Increased default padding
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final backgroundColor = ElevationOverlay.applySurfaceTint(
      colorScheme.surface,
      colorScheme.primary,
      1.0, 
    );

    return Card(
      color: backgroundColor,
      elevation: 0,
      clipBehavior: Clip.antiAlias, // Ensure ripple stays within rounded borders
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      margin: EdgeInsets.zero,
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
