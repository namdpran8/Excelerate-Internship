import 'package:flutter/material.dart';

/// A row header with a title and an optional action button.
///
/// Typically used to introduce a content section with a "See All" or
/// similar action on the trailing edge.
///
/// ```dart
/// ExSectionHeader(
///   title: 'Recommended Programs',
///   onTrailingPressed: () => navigateToFullList(),
///   trailingText: 'View More',
/// )
/// ```
class ExSectionHeader extends StatelessWidget {
  /// The section title displayed on the leading edge.
  final String title;

  /// Optional callback for the trailing action button.
  /// When `null`, the action button is hidden unless [trailingWidget] is provided.
  final VoidCallback? onTrailingPressed;

  /// Optional text for the trailing button. Defaults to 'See All'.
  final String trailingText;

  /// Optional custom trailing widget. If provided, replaces the default TextButton.
  final Widget? trailingWidget;

  const ExSectionHeader({
    super.key,
    required this.title,
    this.onTrailingPressed,
    this.trailingText = 'See All',
    this.trailingWidget,
  });

  @override
  Widget build(BuildContext context) {
    Widget? trailing;

    if (trailingWidget != null) {
      trailing = trailingWidget;
    } else if (onTrailingPressed != null) {
      trailing = TextButton(
        onPressed: onTrailingPressed,
        child: Text(trailingText),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (trailing != null) trailing,
      ],
    );
  }
}
