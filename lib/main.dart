import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app/app.dart';
import 'di/di.dart';
import 'firebase_options.dart';

/// Full e-commerce app for practice , Real Api
///
/// Used [ Clean Arc - MVVM - Bloc - Provider - Repository pattern - DI (injectable-get it) ]
///
/// register and login has different (logic, data handling) from other app presentation
///
/// For register.. used provider, different design and error handling from login,
/// For login used cubit

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies(); // Ensure this is called after Firebase.initializeApp
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyECommerceApp();
  }
}
