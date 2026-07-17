import 'package:flutter/material.dart';

/// A responsive scaffold that constrains its body width on large screens.
///
/// Wraps the standard Material [Scaffold] but automatically applies a maximum
/// width to the body content, ensuring it doesn't stretch uncomfortably on
/// tablets or desktop browsers.
///
/// ```dart
/// ExScaffold(
///   appBar: AppBar(title: const Text('Home')),
///   body: ListView(...),
/// )
/// ```
class ExScaffold extends StatelessWidget {
  /// Primary content of the scaffold.
  final Widget body;

  /// Optional app bar to display at the top of the scaffold.
  final PreferredSizeWidget? appBar;

  /// Optional bottom navigation bar.
  final Widget? bottomNavigationBar;

  /// Optional floating action button.
  final Widget? floatingActionButton;

  /// Optional background color. Defaults to [ColorScheme.surface].
  final Color? backgroundColor;

  /// Whether the body should extend behind the [appBar].
  final bool extendBodyBehindAppBar;

  /// The maximum width of the content area. Defaults to 840 (expanded breakpoint).
  final double maxWidth;

  const ExScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.backgroundColor,
    this.extendBodyBehindAppBar = false,
    this.maxWidth = 840.0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      body: SafeArea(
        bottom: false, // Let the bottom nav handle safe area if needed
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: body,
          ),
        ),
      ),
    );
  }
}
