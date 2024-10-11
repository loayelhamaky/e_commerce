import 'package:e_commerce_app/presentation/main_screen/view/screens/bottom_nav_screens/categories/view/categories_view.dart';
import 'package:e_commerce_app/presentation/main_screen/view/screens/bottom_nav_screens/home/home_view/home_view.dart';
import 'package:e_commerce_app/presentation/main_screen/view/screens/bottom_nav_screens/profile/view/profile_view.dart';
import 'package:e_commerce_app/presentation/main_screen/view/screens/bottom_nav_screens/wishlist/view/wish_list_view.dart';
import 'package:e_commerce_app/presentation/main_screen/view/screens/bottom_nav_screens/wishlist/wishlist_vm/wish_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/utils/constants/app_strings.dart';
import '../presentation/auth_screens/login/view.dart';
import '../presentation/auth_screens/register/view.dart';
import '../presentation/main_screen/view/main_screen_view.dart';
import '../presentation/main_screen/view/screens/product_details/view/product_details_view.dart';
import '../presentation/main_screen/view/screens/subcategories_products_screen/view/view.dart';
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
            MainScreen.routeName: (context) => const MainScreen(),
            SplashScreen.routeName: (context) => const SplashScreen(),
            RegisterScreen.routeName: (context) => RegisterScreen(),
            LoginScreen.routeName: (context) => LoginScreen(),
            ProductDetailsView.routeName: (context) =>
                const ProductDetailsView(),
            // CartView.routeName: (context) => const CartView(),
            // HomeView.routeName: (context) => const HomeView(),
            // CategoriesView.routeName: (context) => const CategoriesView(),
            // WishListView.routeName: (context) => const WishListView(),
            SubCategoryProductsView.routeName: (context) =>
                const SubCategoryProductsView(),
          },
          initialRoute: SplashScreen.routeName,
        );
      },
    );
  }
}
