import 'package:flutter/material.dart';

class ExpressiveCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
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
