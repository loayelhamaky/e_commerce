import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'app_common_widgets/dots_loading_class.dart';
import 'constants/app_colors.dart';

class DialogUtils {
  static void hidePopContext(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
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

  static void showSnackBar(
      BuildContext context, Color textColor, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message, style: TextStyle(color: textColor)),
      duration: const Duration(seconds: 1),
    ));
  }

  static imageErrorBuilder(BuildContext context, Object error,
      StackTrace? stackTrace, String? image, double? height, double? width) {
    if (kDebugMode) {
      print(
          "image (${image ?? ''}) couldn't be downloaded : ${error.toString()}");
    }
    return Container(
        height: height,
        width: width,
        decoration:
            BoxDecoration(color: Colors.grey.shade200, shape: BoxShape.circle),
        child: const Icon(IconlyLight.image_2, color: Colors.red));
  }

  static void showLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: AppColors.primary.withOpacity(0.18),
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const Center(
            child: Dialog(
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              DotsLoadingIndicator(),
            ]),
          ),
        ));
      },
    );
  }
}
