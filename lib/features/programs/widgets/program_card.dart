import 'package:flutter/material.dart';
import '../../../design_system/design_system.dart';

/// A composite card for displaying programs, courses, or internships.
///
/// Built on top of [ExCard], this provides a structured layout
/// with an image area, title, and description. Designed for use in lists
/// and grids that showcase educational content.
///
/// ```dart
/// ProgramCard(
///   title: 'Flutter Internship',
///   description: 'Learn Flutter by building real-world apps.',
///   imageUrl: '',
///   onTap: () {},
/// ),
/// ```

class ProgramCard extends StatelessWidget {
  /// The title of the program.
  final String title;

  /// A short description of the program.
  final String description;

  /// URL for the program's header image.
  final String imageUrl;

  /// Action when the card is tapped.
  final VoidCallback onTap;

  const ProgramCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ExCard(
      onTap: onTap,
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Image placeholder for demo
          Container(
            height: 140,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(ExRadii.lg),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(ExRadii.lg),
              ),
              child: imageUrl.isNotEmpty
                  ? Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Icon(
                        Icons.image,
                        size: 48,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    )
                  : Icon(
                      Icons.image,
                      size: 48,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(ExSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
