/// A filter chip with animated selection state.
///
/// Wraps [FilterChip] with Excelerate styling: pill shape, tonal surface
/// tint, and bold text on selection.
///
/// ```dart
/// CustomChip(
///   label: 'Design',
///   isSelected: true,
///   onSelected: (selected) => toggleFilter(selected),
/// )
/// ```
import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  /// The text label displayed inside the chip.
  final String label;

  /// Whether the chip is currently in a selected state.
  final bool isSelected;

  /// Called when the chip's selection state changes.
  final ValueChanged<bool>? onSelected;

  /// Called when the chip's delete icon is tapped (if shown).
  final VoidCallback? onDeleted;

  const CustomChip({
    super.key,
    required this.label,
    this.isSelected = false,
    this.onSelected,
    this.onDeleted,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: onSelected,
      onDeleted: onDeleted,
      backgroundColor: ElevationOverlay.applySurfaceTint(colorScheme.surface, colorScheme.primary, 0.5), // subtle tint
      selectedColor: colorScheme.primaryContainer,
      labelStyle: TextStyle(
        color: isSelected ? colorScheme.onPrimaryContainer : colorScheme.onSurfaceVariant,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9999.0),
        side: const BorderSide(color: Colors.transparent),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
    );
  }
}
