import 'dart:async';
import 'package:flutter/material.dart';

import '../../tokens/tokens.dart';

/// A high-emphasis filled button for primary actions.
///
/// Wraps [FilledButton] to provide a consistent primary-action surface
/// across the app. Styling (shape, padding, colors) is inherited from
/// [AppTheme]'s [FilledButtonThemeData].
///
/// Handles async [onPressed] callbacks natively by showing a loading
/// indicator and disabling duplicate taps.
///
/// ```dart
/// ExPrimaryButton(
///   onPressed: () async => await handleSubmit(),
///   child: Text('Get Started'),
/// )
/// ```
class ExPrimaryButton extends StatefulWidget {
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
  State<ExPrimaryButton> createState() => _ExPrimaryButtonState();
}

class _ExPrimaryButtonState extends State<ExPrimaryButton> {
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
      button = FilledButton.icon(
        onPressed: widget.onPressed == null ? null : _handlePress,
        icon: widget.icon!,
        label: content,
        focusNode: widget.focusNode,
        style: mergedStyle,
      );
    } else {
      button = FilledButton(
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
