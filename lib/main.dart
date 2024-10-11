import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app/app.dart';
import 'di/di.dart';
import 'firebase_options.dart';

/// Full e-commerce app for practice
/// Used [ Clean Arch - Bloc - Provider - Repository pattern - DI and more ]
///
/// integrated firebase auth but got restricted due to many login times so
/// firebase auth doesn't work by my registered email but the code works

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyECommerceApp();
  }
}
