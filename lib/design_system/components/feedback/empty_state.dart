import 'package:flutter/material.dart';
import '../../tokens/tokens.dart';

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
        padding: const EdgeInsets.all(ExSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: ExSizes.avatarLg,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: ExSpacing.md),
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
