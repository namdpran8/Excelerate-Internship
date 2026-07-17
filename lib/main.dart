/// Application entry point.
///
/// Delegates all configuration (theme, routing, behavior) to [ExcelerateLearningApp]
/// in [app.dart]. This file should remain minimal — any app-level setup
/// (Firebase.initializeApp, etc.) goes here before [runApp].
import 'package:flutter/material.dart';
import 'app.dart';

void main() {
  runApp(const ExcelerateLearningApp());
}