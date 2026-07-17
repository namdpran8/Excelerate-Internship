import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A styled text input field with filled background and underline focus indicator.
///
/// Wraps [TextFormField] with the Excelerate visual treatment, inheriting
/// its styling from [AppTheme]'s [InputDecorationTheme].
///
/// ```dart
/// ExTextField(
///   labelText: 'Email',
///   hintText: 'Enter your email',
///   prefixIcon: Icon(Icons.email),
/// )
/// ```

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

  /// Initial text when no [controller] is supplied.
  final String? initialValue;

  /// Optional icon displayed at the end of the field.
  final Widget? suffixIcon;

  /// Validates the field when it belongs to a [Form].
  final FormFieldValidator<String>? validator;

  /// Receives the final field value when the enclosing [Form] is saved.
  final FormFieldSetter<String>? onSaved;

  /// Controls when [validator] runs automatically.
  final AutovalidateMode? autovalidateMode;

  /// Displays a server-side or externally managed error message.
  final String? errorText;

  /// Supporting text displayed below the field.
  final String? helperText;

  /// Called whenever the field value changes.
  final ValueChanged<String>? onChanged;

  /// Called when the user submits the field.
  final ValueChanged<String>? onFieldSubmitted;

  /// Focus node for keyboard and focus management.
  final FocusNode? focusNode;

  /// Configures the on-screen keyboard.
  final TextInputType? keyboardType;

  /// Configures the keyboard action button.
  final TextInputAction? textInputAction;

  /// Controls capitalization behavior for text input.
  final TextCapitalization textCapitalization;

  /// Whether the user can interact with the field.
  final bool enabled;

  /// Whether the field is visible but cannot be edited.
  final bool readOnly;

  /// Obscures the entered text, for example for passwords.
  final bool obscureText;

  /// Maximum number of visible lines.
  final int? maxLines;

  /// Minimum number of visible lines.
  final int? minLines;

  /// Maximum number of accepted characters.
  final int? maxLength;

  /// Input formatters applied before a value is accepted.
  final List<TextInputFormatter>? inputFormatters;

  /// Whether this field receives focus automatically.
  final bool autofocus;

  /// Whether suggestions are enabled for this field.
  final bool enableSuggestions;

  /// Whether autocorrect is enabled for this field.
  final bool autocorrect;

  const ExTextField({
    super.key,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.controller,
    this.initialValue,
    this.suffixIcon,
    this.validator,
    this.onSaved,
    this.autovalidateMode,
    this.errorText,
    this.helperText,
    this.onChanged,
    this.onFieldSubmitted,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.enabled = true,
    this.readOnly = false,
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.inputFormatters,
    this.autofocus = false,
    this.enableSuggestions = true,
    this.autocorrect = true,
  }) : assert(controller == null || initialValue == null),
       assert(!obscureText || maxLines == 1),
       assert(minLines == null || maxLines == null || minLines <= maxLines);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      validator: validator,
      onSaved: onSaved,
      autovalidateMode: autovalidateMode,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      enabled: enabled,
      readOnly: readOnly,
      obscureText: obscureText,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      autofocus: autofocus,
      enableSuggestions: enableSuggestions,
      autocorrect: autocorrect,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        errorText: errorText,
        helperText: helperText,
      ),
    );
  }
}
