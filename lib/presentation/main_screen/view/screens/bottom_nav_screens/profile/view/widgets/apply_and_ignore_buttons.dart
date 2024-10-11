import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileApplyIgnoreButton extends StatelessWidget {
  final String label;
  final bool visible;
  final Function() onPressed;
  const ProfileApplyIgnoreButton(
      {super.key,required this.label, required this.visible, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: ElevatedButton(
          onPressed: () => onPressed(),
          child: Text(label),
        ),
      ),
    );
  }
}
