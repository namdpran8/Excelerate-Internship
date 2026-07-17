import 'package:flutter/material.dart';

import '../../tokens/sizes.dart';

/// A circular avatar for displaying user profiles or initials.
///
/// Uses standard design system sizes. If an [imageUrl] is provided, it
/// displays the image; otherwise, it falls back to displaying [initials]
/// with a primary-tinted background.
///
/// ```dart
/// ExAvatar(
///   initials: 'JD',
///   size: ExSizes.avatarLg,
/// )
/// ```
class ExAvatar extends StatelessWidget {
  /// One or two characters to display (e.g., first + last initial).
  final String initials;

  /// The avatar's radius in logical pixels. Defaults to 20.
  final double radius;

  /// Optional URL for the user's profile image. If null, displays [initials].
  final String? imageUrl;

  /// Semantic description announced by screen readers.
  final String? semanticsLabel;

  const ExAvatar({
    super.key,
    required this.initials,
    this.radius = ExSizes.avatarMd / 2,
    this.imageUrl,
    this.semanticsLabel,
  });

  @override
  Widget build(BuildContext context) {
    final String? trimmedImageUrl = imageUrl?.trim();
    final ImageProvider<Object>? foregroundImage =
        trimmedImageUrl == null || trimmedImageUrl.isEmpty
        ? null
        : NetworkImage(trimmedImageUrl);

    final avatar = CircleAvatar(
      radius: radius,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      foregroundImage: foregroundImage,
      onForegroundImageError: foregroundImage == null ? null : (_, __) {},
      child: Text(
        initials,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
    );

    return Semantics(
      image: foregroundImage != null,
      label: semanticsLabel ?? initials,
      child: ExcludeSemantics(child: avatar),
    );
  }
}
