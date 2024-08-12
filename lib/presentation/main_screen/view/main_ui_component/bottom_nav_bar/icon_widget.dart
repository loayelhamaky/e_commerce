import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavWidget extends StatelessWidget {
  final IconData icon;
  const BottomNavWidget(this.icon, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: 45.h,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(icon),
    );
  }
}
