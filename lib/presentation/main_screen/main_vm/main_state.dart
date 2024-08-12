import 'package:flutter/material.dart';

import '../view/screens/bottom_nav_screens/categories/categories_view.dart';
import '../view/screens/bottom_nav_screens/favourites/favourites_view.dart';
import '../view/screens/bottom_nav_screens/home/view/home_view.dart';
import '../view/screens/bottom_nav_screens/profile/profile_view.dart';

class MainState {
  static const List<Widget> defaultTabs = [
    HomeView(),
    CategoriesView(),
    FavouritesView(),
    ProfileView(),
  ];

  final List<Widget> myTabs;
  final int currentSelectedTab;

  MainState({
    this.currentSelectedTab = 0,
    this.myTabs = defaultTabs,
  });

  MainState copyWith({
    int? currentSelectedTab,
    List<Widget>? myTabs,
  }) {
    return MainState(
      currentSelectedTab: currentSelectedTab ?? this.currentSelectedTab,
      myTabs: myTabs ?? this.myTabs,
    );
  }
}



