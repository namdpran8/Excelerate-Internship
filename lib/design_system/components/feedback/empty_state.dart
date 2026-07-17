/// A full-screen empty state placeholder.
///
/// Displays a centered icon and message when content is unavailable,
/// such as empty lists, no search results, or uninitialized states.
///
/// ```dart
/// EmptyState(
///   icon: Icons.search_off,
///   message: 'No results found. Try adjusting your filters.',
/// )
/// ```
import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  /// Descriptive text explaining why no content is shown.
  final String message;

  /// Large icon displayed above the message. Defaults to [Icons.inbox].
  final IconData icon;

  const EmptyState({
    super.key,
    required this.message,
    this.icon = Icons.inbox,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 64,
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
