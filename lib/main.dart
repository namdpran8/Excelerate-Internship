import 'package:flutter/material.dart';
import 'design_system.dart';
import 'screens/demo_screen.dart';

import 'constants/theme.dart';
import 'routes/app_routes.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/program_details_screen.dart';
import 'screens/program_listing_screen.dart';

void main() {
  runApp(const ExcelerateLearningApp());
}

class ExcelerateLearningApp extends StatelessWidget {
  const ExcelerateLearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Excelerate Learning Platform',
<<<<<<< HEAD
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.programs: (context) => const ProgramListingScreen(),
        AppRoutes.details: (context) => const ProgramDetailsScreen(),
      },
=======
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Automatically switches based on OS settings
      scrollBehavior: const MaterialScrollBehavior(), // Standard M3 physics
      home: const LivingDesignSystemPage(), // Swap this out for your actual home page later!
>>>>>>> 5529822 (Implement Material 3 Expressive design system)
    );
  }
}
