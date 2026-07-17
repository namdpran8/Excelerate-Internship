import 'package:flutter/material.dart';

/// A high-emphasis filled button for primary actions.
///
/// Wraps [FilledButton] to provide a consistent primary-action surface
/// across the app. Styling (shape, padding, colors) is inherited from
/// [AppTheme]'s [FilledButtonThemeData].
///
/// ```dart
/// ExPrimaryButton(
///   onPressed: () => handleSubmit(),
///   child: Text('Get Started'),
/// )
/// ```
///
/// See also:
///   - [ExSecondaryButton] for medium-emphasis actions.
class ExPrimaryButton extends StatelessWidget {
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

  const ExPrimaryButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.isLoading = false,
    this.semanticsLabel,
    this.focusNode,
    this.style,
  }) : icon = null;

  /// Named constructor for a button with an icon.
  const ExPrimaryButton.icon({
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
      return FilledButton.icon(
        onPressed: isLoading ? null : onPressed,
        icon: icon!,
        label: content,
        focusNode: focusNode,
        style: style,
      );
    }

    return FilledButton(
      onPressed: isLoading ? null : onPressed,
      focusNode: focusNode,
      style: style,
      child: content,
    );
  }
}
