import 'package:flutter/material.dart';
import '../../../main_ui_component/header_search_bar.dart';



class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderSearchBar(),
        Center(child: Container(color: Colors.red,height: 100,width: 100,))
      ],
    );
  }
}
