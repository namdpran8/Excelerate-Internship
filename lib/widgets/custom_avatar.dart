import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  final String initials;
  final double radius;

  const CustomAvatar({
    super.key,
    required this.initials,
    this.radius = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      child: Text(
        initials,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: radius * 0.8),
      ),
    );
  }
}
