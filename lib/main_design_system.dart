import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'design_system/design_system.dart';
import 'debug/design_system_demo.dart';

/// Entry point specifically for testing the design system.
///
/// Run this file directly to launch the design system catalog without
/// navigating through the main application:
/// `flutter run -t lib/main_design_system.dart`
void main() {
  if (!kDebugMode) throw UnsupportedError('Design System Gallery is only available in debug mode.');
  runApp(const DesignSystemApp());
}

class DesignSystemApp extends StatelessWidget {
  const DesignSystemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Excelerate Design System',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const LivingDesignSystemPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
