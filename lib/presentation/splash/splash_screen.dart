import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/utils/constants/app_assets.dart';
import '../../data/utils/shared_prefs_utils.dart';
import '../auth_screens/register/view.dart';
import '../main_screen/view/main_screen_view.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'Splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () async{
      String? token = await SharedPrefsUtils.getToken();
      token == null ?
      Navigator.pushReplacementNamed(context, RegisterScreen.routeName) :
          Navigator.pushReplacementNamed(context, MainScreen.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Image.asset(
      AppAssets.splash,
      fit: BoxFit.cover,
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
    ));
  }
}
