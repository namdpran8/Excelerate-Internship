/// A pill-shaped search input field.
///
/// Provides a search-optimized text field with a leading search icon,
/// fully rounded corners (stadium shape), and a filled background
/// using [surfaceContainerHigh].
///
/// ```dart
/// ExSearchBar(
///   hintText: 'Search programs...',
///   onChanged: (query) => filterResults(query),
/// )
/// ```
import 'package:flutter/material.dart';

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
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surfaceContainerHigh,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9999.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
      ),
    );
  }
}
