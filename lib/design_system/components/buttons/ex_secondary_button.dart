import 'package:flutter/material.dart';

/// A medium-emphasis outlined button for secondary actions.
///
/// Wraps [OutlinedButton] to provide a consistent secondary-action surface
/// across the app. Styling (shape, padding, colors) is inherited from
/// [AppTheme]'s [OutlinedButtonThemeData].
///
/// ```dart
/// ExSecondaryButton(
///   onPressed: () => handleCancel(),
///   child: Text('Cancel'),
/// )
/// ```
///
/// See also:
///   - [ExPrimaryButton] for high-emphasis actions.
class ExSecondaryButton extends StatelessWidget {
  /// Callback invoked when the button is tapped. Pass `null` to disable.
  final VoidCallback? onPressed;

  /// The button's label — typically a [Text] widget.
  final Widget? child;

  /// Optional icon to display alongside the label.
  final Widget? icon;

  /// Controls the loading state. Displays a progress indicator if true.
  final bool isLoading;
  
  /// Semantic label for accessibility.
  final String? semanticsLabel;

  /// Focus node for keyboard navigation.
  final FocusNode? focusNode;
  
  /// Optional style overrides.
  final ButtonStyle? style;

  const ExSecondaryButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.isLoading = false,
    this.semanticsLabel,
    this.focusNode,
    this.style,
  }) : icon = null;

  /// Named constructor for a button with an icon.
  const ExSecondaryButton.icon({
    super.key,
    required this.onPressed,
    required this.icon,
    required Widget label,
    this.isLoading = false,
    this.semanticsLabel,
    this.focusNode,
    this.style,
  }) : child = label;

  @override
  Widget build(BuildContext context) {
    final Widget content = isLoading
        ? const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2.0),
          )
        : child ?? const SizedBox.shrink();

    if (icon != null && !isLoading) {
      return OutlinedButton.icon(
        onPressed: isLoading ? null : onPressed,
        icon: icon!,
        label: content,
        focusNode: focusNode,
        style: style,
      );
    }

    return OutlinedButton(
      onPressed: isLoading ? null : onPressed,
      focusNode: focusNode,
      style: style,
      child: content,
    );
  }
}
