/// A styled text input field with filled background and underline focus indicator.
///
/// Wraps [TextField] with the Excelerate visual treatment: filled background
/// using [surfaceVariant], rounded top corners, and a primary-colored
/// underline on focus.
///
/// ```dart
/// ExTextField(
///   labelText: 'Email',
///   hintText: 'Enter your email',
///   prefixIcon: Icon(Icons.email),
/// )
/// ```
import 'package:flutter/material.dart';

/// Excelerate-styled text input field.
///
/// See also:
///   - [ExSearchBar] for search-specific inputs.
class ExTextField extends StatelessWidget {
  /// Placeholder text shown when the field is empty.
  final String? hintText;

  /// Floating label that animates above the field when focused.
  final String? labelText;

  /// Icon displayed at the start of the field.
  final Widget? prefixIcon;

  /// Controller for reading or manipulating the field's text value.
  final TextEditingController? controller;

  const ExTextField({
    super.key,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: Theme.of(context).colorScheme.surfaceVariant,
        border: const UnderlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
          ),
          borderSide: BorderSide.none,
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
          ),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
