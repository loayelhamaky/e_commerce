import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../di/di.dart';
import '../main_vm/main_state.dart';
import '../main_vm/main_vm.dart';
import 'main_ui_component/bottom_nav_bar/bottom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = 'Main';

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainVm vm = getIt();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainVm, MainState>(
      bloc: vm,
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: MyBottomNavBar(
              tappedIndex: state.currentSelectedTab,
              onTap: (index) => vm.setSelectedTab(index),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  IndexedStack(
                      index: state.currentSelectedTab,
                      children: state.myTabs
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
