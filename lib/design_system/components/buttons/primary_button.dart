/// A high-emphasis filled button for primary actions.
///
/// Wraps [FilledButton] to provide a consistent primary-action surface
/// across the app. Styling (shape, padding, colors) is inherited from
/// [AppTheme]'s [FilledButtonThemeData].
///
/// ```dart
/// PrimaryButton(
///   onPressed: () => handleSubmit(),
///   child: Text('Get Started'),
/// )
/// ```
///
/// See also:
///   - [SecondaryButton] for medium-emphasis actions.
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  /// Callback invoked when the button is tapped. Pass `null` to disable.
  final VoidCallback? onPressed;

  /// The button's label — typically a [Text] widget.
  final Widget child;

  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
