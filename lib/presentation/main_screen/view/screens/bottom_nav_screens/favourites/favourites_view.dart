import 'package:flutter/material.dart';

import '../../../main_ui_component/header_search_bar.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderSearchBar(),
        Container(color: Colors.yellow,height: 100,width: 100,)
      ],
    );
  }
}
