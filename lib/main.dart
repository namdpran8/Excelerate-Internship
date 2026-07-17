import 'package:flutter/material.dart';

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
      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      scrollBehavior: const MaterialScrollBehavior(),

      initialRoute: AppRoutes.login,

      routes: {
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.programs: (context) => const ProgramListingScreen(),
        AppRoutes.details: (context) => const ProgramDetailsScreen(),
      },
    );
  }
}