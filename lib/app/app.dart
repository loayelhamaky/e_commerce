

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/utils/constants/app_strings.dart';
import '../presentation/auth_screens/login/view.dart';
import '../presentation/auth_screens/register/view.dart';
import '../presentation/main_screen/view/main_screen_view.dart';
import '../presentation/main_screen/view/screens/cart/cart_view.dart';
import '../presentation/main_screen/view/screens/product_details/view/product_details_view.dart';
import '../presentation/splash/splash_screen.dart';

class MyECommerceApp extends StatelessWidget {
  const MyECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (context, child) {
        return MaterialApp(
          title: AppStrings.appTitle,
          debugShowCheckedModeBanner: false,
          routes: {
            MainScreen.routeName: (context) => MainScreen(),
            SplashScreen.routeName: (context) => const SplashScreen(),
            RegisterScreen.routeName: (context) => RegisterScreen(),
            LoginScreen.routeName: (context) => LoginScreen(),
            CartView.routeName: (context) => CartView(),
            ProductDetailsView.routeName: (context) => ProductDetailsView(),
          },
          initialRoute: SplashScreen.routeName,
        );
      },
    );
  }
}