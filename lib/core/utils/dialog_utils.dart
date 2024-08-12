import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import '../../presentation/main_screen/view/screens/cart/cart_view.dart';
import 'constants/app_colors.dart';
import 'constants/app_strings.dart';
import 'constants/app_text_styles.dart';

class DialogUtils {
  static void showLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CupertinoActivityIndicator(
                    radius: 20.0,
                    color: AppColors.loading, // Use your custom color here
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Loading...',
                    style: TextStyle(color: AppColors.loading),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static void hidePopContext(BuildContext context) {
    Navigator.pop(context);
  }

  static void showPopError(
      String? message, BuildContext context, VoidCallback onOkTap) {
    showDialog(
        context: context,
        builder: (context) => Dialog(
              backgroundColor: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Text(message),
                    Text(
                      message!,
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: onOkTap,
                      child: const Text('Ok'),
                    ),
                  ],
                ),
              ),
            ));
  }

  static void showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  static void showOfflineSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
      AppStrings.internetErrorMessage,
      style: TextStyle(color: Colors.red),
    )));
  }

  static void showOnlineSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Internet connection restored',
            style: TextStyle(color: Colors.green)),
      ),
    );
  }

  static imageErrorBuilder(BuildContext context, Object error,
      StackTrace? stackTrace, String? image,double? height,double? width) {
    if (kDebugMode) {
      print(
          "image (${image ?? ''}) couldn't be downloaded : ${error.toString()}");
    }
    return Container(
      height: height,width: width,
        decoration: BoxDecoration(color: Colors.grey.shade200,shape: BoxShape.circle),
        child: const Icon(IconlyLight.image_2, color: Colors.red));
  }

}
