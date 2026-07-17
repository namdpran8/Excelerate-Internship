/// A medium-emphasis outlined button for secondary actions.
///
/// Wraps [OutlinedButton] to provide a consistent secondary-action surface
/// across the app. Styling (shape, padding, colors) is inherited from
/// [AppTheme]'s [OutlinedButtonThemeData].
///
/// ```dart
/// SecondaryButton(
///   onPressed: () => handleCancel(),
///   child: Text('Cancel'),
/// )
/// ```
///
/// See also:
///   - [PrimaryButton] for high-emphasis actions.
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  /// Callback invoked when the button is tapped. Pass `null` to disable.
  final VoidCallback? onPressed;

  /// The button's label — typically a [Text] widget.
  final Widget child;

  const SecondaryButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
