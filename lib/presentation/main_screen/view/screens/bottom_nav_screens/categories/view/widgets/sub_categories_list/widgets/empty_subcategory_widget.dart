import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../../../core/utils/constants/app_text_styles.dart';

class EmptySubCategoriesWidget extends StatefulWidget {
  final String selectedCategoryName;

  const EmptySubCategoriesWidget({Key? key, required this.selectedCategoryName}) : super(key: key);

  @override
  EmptySubCategoriesWidgetState createState() => EmptySubCategoriesWidgetState();
}

class EmptySubCategoriesWidgetState extends State<EmptySubCategoriesWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _slideAnimation = Tween<double>(
      begin: 50.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SlideTransition(
            position: _slideAnimation.drive(Tween<Offset>(
              begin: const Offset(0, 0.2),
              end: Offset.zero,
            )),
            child: Icon(
              Icons.shopping_bag_outlined,
              size: 100,
              color: Colors.grey.shade400,
            ),
          ),
          SizedBox(height: 20.h),
          FadeTransition(
            opacity: _fadeAnimation,
            child: Text(
              'No products available for ${widget.selectedCategoryName}',
              maxLines: 2,
              textAlign: TextAlign.center,
              style: AppTextStyles.heading.copyWith(
                fontSize: 18.sp,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          FadeTransition(
            opacity: _fadeAnimation,
            child: Text(
              'Check back later or explore other categories!',
              style: AppTextStyles.medium.copyWith(
                fontSize: 14.sp,
                color: Colors.grey.shade500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
