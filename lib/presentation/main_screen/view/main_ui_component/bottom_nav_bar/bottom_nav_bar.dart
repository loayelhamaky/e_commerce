import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import 'icon_widget.dart';

class MyBottomNavBar extends StatelessWidget {
  final int tappedIndex;
  final ValueChanged<int> onTap;
  const MyBottomNavBar(
      {super.key, required this.tappedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      decoration: BoxDecoration(
        color: AppColors.appText, 
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28.r),
          topRight: Radius.circular(28.r),
        ),
      ),
      child: BottomNavigationBar(
        items: items(tappedIndex),
        backgroundColor: Colors.transparent,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        selectedIconTheme: const IconThemeData(color: AppColors.appText),
        iconSize: 28.sp,
        unselectedIconTheme: const IconThemeData(
          color: Colors.white,
        ),
        elevation: 8,
        currentIndex: tappedIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  static List<BottomNavigationBarItem> items(int tappedIndex) => [
        BottomNavigationBarItem(
            icon: tappedIndex == 0
                ? const BottomNavWidget(IconlyLight.home)
                : const Icon(IconlyLight.home),
            label: 'Home'),
        BottomNavigationBarItem(
          icon: tappedIndex == 1
              ? const BottomNavWidget(IconlyLight.category)
              : const Icon(IconlyLight.category),
          label: 'Category',
        ),
        BottomNavigationBarItem(
          icon: tappedIndex == 2
              ? const BottomNavWidget(IconlyLight.heart)
              : const Icon(IconlyLight.heart),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: tappedIndex == 3
              ? const BottomNavWidget(IconlyLight.profile)
              : const Icon(IconlyLight.profile),
          label: 'Profile',
        ),
      ];
}
