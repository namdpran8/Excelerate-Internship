import 'package:flutter/material.dart';
import '../../tokens/tokens.dart';

/// Excelerate-styled filter chip for tags, categories, or filters.
///
/// Provides a stadium-shaped chip with a checkmark when selected, custom
/// tint, and bold text on selection.
///
/// ```dart
/// ExFilterChip(
///   label: 'Design',
///   isSelected: true,
///   onSelected: (selected) => toggleFilter(selected),
/// )
/// ```
class ExFilterChip extends StatelessWidget {
  /// The text label displayed inside the chip.
  final String label;

  /// Whether the chip is currently in a selected state.
  final bool isSelected;

  /// Called when the chip's selection state changes.
  final ValueChanged<bool>? onSelected;

  /// Called when the chip's delete icon is tapped (if shown).
  final VoidCallback? onDeleted;

  const ExFilterChip({
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
      labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
        color: isSelected ? colorScheme.onPrimaryContainer : colorScheme.onSurfaceVariant,
        fontWeight: isSelected ? FontWeight.bold : null,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: ExRadii.borderRadiusFull,
        side: const BorderSide(color: Colors.transparent),
      ),
      padding: const EdgeInsets.symmetric(horizontal: ExSpacing.md, vertical: ExSpacing.sm),
    );
  }
}
