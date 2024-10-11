import 'package:e_commerce_app/core/enums/app_enums.dart';
import 'package:e_commerce_app/core/utils/app_common_widgets/app_common_widgets.dart';
import 'package:e_commerce_app/core/utils/error/error_strings.dart';
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
  final MainVm vm = getIt<MainVm>();


  @override
  void initState() {
    super.initState();
    vm.getCategoriesAndProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: BlocBuilder<MainVm, MainState>(
            bloc: vm,
            builder: (context, state) {
              return MyBottomNavBar(
                tappedIndex: state.currentSelectedTab,
                onTap: (index) => vm.setSelectedTab(index),
              );
            },
          ),
          body: BlocBuilder<MainVm, MainState>(
            bloc: vm,
            builder: (context, state) {
              if (state.categoriesState == BaseApiState.loading ||
                  state.productState == BaseApiState.loading) {
                return AppCommonWidgets.cupertinoLoadingWidget(context);
              } else if (state.categoriesState == BaseApiState.success &&
                  state.productState == BaseApiState.success) {
                return IndexedStack(
                  index: state.currentSelectedTab,
                  children: state.myTabs,
                );
              } else if (state.categoriesState == BaseApiState.failure ||
                  state.productState == BaseApiState.failure) {
                return Center(
                  child: Text(
                      state.errorMessage ?? ErrorStrings.errorDefaultMessage),
                );
              } else {
                return const Center(child: Text("Unexpected state"));
              }
            },
          )),
    );
  }
}
