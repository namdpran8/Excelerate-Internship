/// A circular avatar displaying user initials.
///
/// Shows a [CircleAvatar] with bold initials on a tonal primary background.
/// Scales font size proportionally to [radius].
///
/// ```dart
/// ExAvatar(
///   initials: 'PK',
///   radius: 24,
/// )
/// ```
import 'package:flutter/material.dart';

/// Excelerate-styled circular avatar.
class ExAvatar extends StatelessWidget {
  /// One or two characters to display (e.g., first + last initial).
  final String initials;

  /// The avatar's radius in logical pixels. Defaults to 20.
  final double radius;

  const ExAvatar({
    super.key,
    required this.initials,
    this.radius = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      child: Text(
        initials,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: radius * 0.8),
      ),
    );
  }
}
