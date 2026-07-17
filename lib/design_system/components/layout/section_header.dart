/// A row header with a title and an optional action button.
///
/// Typically used to introduce a content section with a "See All" or
/// similar action on the trailing edge.
///
/// ```dart
/// SectionHeader(
///   title: 'Recommended Programs',
///   onSeeAll: () => navigateToFullList(),
/// )
/// ```
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  /// The section title displayed on the leading edge.
  final String title;

  /// Optional callback for the trailing action button.
  /// When `null`, the action button is hidden.
  final VoidCallback? onSeeAll;

  const SectionHeader({
    super.key,
    required this.title,
    this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        if (onSeeAll != null)
          TextButton(
            onPressed: onSeeAll,
            child: const Text('See All'),
          ),
      ],
    );
  }
}
