import 'dart:async';
import 'package:flutter/material.dart';

import '../../tokens/tokens.dart';

/// A medium-emphasis outlined button for secondary actions.
///
/// Wraps [OutlinedButton] to provide a consistent secondary-action surface
/// across the app. Styling (shape, padding, colors) is inherited from
/// [AppTheme]'s [OutlinedButtonThemeData].
///
/// Handles async [onPressed] callbacks natively by showing a loading
/// indicator and disabling duplicate taps.
///
/// ```dart
/// ExSecondaryButton(
///   onPressed: () async => await handleCancel(),
///   child: Text('Cancel'),
/// )
/// ```
class ExSecondaryButton extends StatefulWidget {
  /// Callback invoked when the button is tapped. Pass `null` to disable.
  /// If this returns a [Future], the button will show a loading state
  /// and disable itself until the future completes.
  final FutureOr<void> Function()? onPressed;

  /// The button's label — typically a [Text] widget.
  final Widget? child;

  /// Optional icon to display alongside the label.
  final Widget? icon;

  /// Controls the loading state manually. Displays a progress indicator if true.
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
  State<ExSecondaryButton> createState() => _ExSecondaryButtonState();
}

class _ExSecondaryButtonState extends State<ExSecondaryButton> {
  bool _isInternalLoading = false;

  void _handlePress() async {
    if (widget.onPressed == null || _isInternalLoading || widget.isLoading) return;
    
    final result = widget.onPressed!();
    if (result is Future) {
      setState(() => _isInternalLoading = true);
      try {
        await result;
      } finally {
        if (mounted) setState(() => _isInternalLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool showLoading = widget.isLoading || _isInternalLoading;
    final Widget content = showLoading
        ? const SizedBox(
            width: ExSizes.iconSm,
            height: ExSizes.iconSm,
            child: CircularProgressIndicator(strokeWidth: 2.0),
          )
        : widget.child ?? const SizedBox.shrink();

    final mergedStyle = (widget.style ?? const ButtonStyle()).copyWith(
      minimumSize: const WidgetStatePropertyAll(Size.fromHeight(ExSizes.buttonHeight)),
    );

    Widget button;
    if (widget.icon != null && !showLoading) {
      button = OutlinedButton.icon(
        onPressed: widget.onPressed == null ? null : _handlePress,
        icon: widget.icon!,
        label: content,
        focusNode: widget.focusNode,
        style: mergedStyle,
      );
    } else {
      button = OutlinedButton(
        onPressed: widget.onPressed == null ? null : _handlePress,
        focusNode: widget.focusNode,
        style: mergedStyle,
        child: content,
      );
    }

    if (widget.semanticsLabel != null) {
      return Semantics(
        label: widget.semanticsLabel,
        button: true,
        child: ExcludeSemantics(child: button),
      );
    }

    return button;
  }
}
