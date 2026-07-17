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
///   imageUrl: '',
///   onTap: () {},
/// ),
/// ```
import 'package:flutter/material.dart';

import 'ex_card.dart';

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
