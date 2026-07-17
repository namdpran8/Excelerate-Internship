/// A composite card for displaying programs, courses, or internships.
///
/// Built on top of [ExpressiveCard], this provides a structured layout
/// with an image area, title, and description. Designed for use in lists
/// and grids that showcase educational content.
///
/// ```dart
/// ProgramCard(
///   title: 'Flutter Internship',
///   description: 'Learn Flutter by building real-world apps.',
///   imageUrl: 'path/to/image.png',
///   onTap: () => navigateToDetails(),
/// )
/// ```
import 'package:flutter/material.dart';
import 'expressive_card.dart';

class ProgramCard extends StatelessWidget {
  /// The program title displayed below the image area.
  final String title;

  /// A short description of the program (max 2 lines before ellipsis).
  final String description;

  /// URL or asset path for the program image (placeholder shown if empty).
  final String imageUrl;

  /// Callback when the entire card is tapped.
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
    return ExpressiveCard(
      onTap: onTap,
      padding: EdgeInsets.zero,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: const Icon(Icons.image, size: 48, color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
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
