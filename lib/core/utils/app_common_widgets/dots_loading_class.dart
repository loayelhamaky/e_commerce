import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class DotsLoadingIndicator extends StatefulWidget {
  const DotsLoadingIndicator({Key? key}) : super(key: key);

  @override
  _DotsLoadingIndicatorState createState() => _DotsLoadingIndicatorState();
}

class _DotsLoadingIndicatorState extends State<DotsLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late Timer _timer;
  int _currentDot = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      setState(() {
        _currentDot = (_currentDot + 1) % 3; // Loop through 0, 1, 2
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return AnimatedScale(
          scale: _currentDot == index ? 1.5 : 1.0,
          duration: const Duration(milliseconds: 300),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.0),
            child: CircleAvatar(
              radius: 5,
              backgroundColor: AppColors.primary, // Customize your color here
            ),
          ),
        );
      }),
    );
  }
}
//// CupertinoActivityIndicator(
// //   animating: true,
// //   radius: 25.r,
// //   color: AppColors.primary,