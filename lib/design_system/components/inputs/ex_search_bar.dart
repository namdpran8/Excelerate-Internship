import 'package:flutter/material.dart';
import '../../tokens/tokens.dart';

/// A pill-shaped search input field.
///
/// Provides a search-optimized text field with a leading search icon,
/// fully rounded corners (stadium shape), and an M3 surface background.
///
/// ```dart
/// ExSearchBar(
///   hintText: 'Search programs...',
///   onChanged: (query) => filterResults(query),
/// )
/// ```

/// Excelerate-styled search input field.
///
/// See also:
///   - [ExTextField] for general-purpose text input.
class ExSearchBar extends StatelessWidget {
  /// Placeholder text shown when the search field is empty.
  final String hintText;

  /// Called each time the search text changes.
  final ValueChanged<String>? onChanged;

  const ExSearchBar({
    super.key,
    this.hintText = 'Search...',
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: hintText,
      onChanged: onChanged,
      leading: const Icon(Icons.search),
      elevation: const WidgetStatePropertyAll(0), // ExElevations.level0
      padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: ExSpacing.md)),
    );
  }
}
