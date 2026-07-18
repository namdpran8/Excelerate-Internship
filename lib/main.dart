import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Excelerate',
      debugShowCheckedModeBanner: false,

      initialRoute: '/',

      routes: {
        '/': (context) => const HomeScreen(),


        '/programs': (context) => const DummyScreen(title: 'Program Listing Screen'),
        '/profile': (context) => const DummyScreen(title: 'Profile Screen'),
        '/feedback': (context) => const DummyScreen(title: 'Feedback Screen'),
        '/settings': (context) => const DummyScreen(title: 'Settings Screen'),
      },
    );
  }
}

class DummyScreen extends StatelessWidget {
  final String title;
  const DummyScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF8B1E2D),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text(
          '$title Comming Soon...',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}