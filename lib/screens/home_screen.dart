import 'package:flutter/material.dart';

// Temporary placeholder to be replaced by the assigned screen owner.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: const Center(child: Text('Home Screen')),
    );
  }
}
