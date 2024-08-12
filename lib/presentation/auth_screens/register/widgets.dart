import 'package:flutter/material.dart';
import '../../../core/utils/constants/app_assets.dart';
import '../../../core/utils/constants/app_text_styles.dart';

class RegisterWidgets {
  static Widget routeImgInRegister(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Transform.translate(
          offset: const Offset(0, 15),
          filterQuality: FilterQuality.high,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.20,
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(AppAssets.routeLogoRegistration),
            ),
          ),
        ),
      ],
    );
  }

  // static Widget checkLoading(BuildContext context) {
  //   final vmImpl = Provider.of<RegisterVmImpl>(context);
  //   return Container(
  //     padding: const EdgeInsets.all(20),
  //     child: CircularProgressIndicator(
  //       color: vmImpl.registerState == RegisterState.loading
  //           ? AppColors.loading
  //           : Colors.transparent,
  //     ),
  //   );
  // }
  //
  // static Widget checkError(BuildContext context, VoidCallback onOkTap) {
  //   final vmImpl = Provider.of<RegisterVmImpl>(context);
  //   return !isRegisterErrorHidden && vmImpl.registerState == RegisterState.error
  //       ? showError(
  //           vmImpl.errorMessage == null
  //               ? 'some thing went wrong'
  //               : vmImpl.errorMessage!,
  //           context,
  //           onOkTap)
  //       : const SizedBox.shrink();
  // }

  static showLoading() {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const CircularProgressIndicator(
          color: Colors.blue,
        ),
      ),
    );
  }

  static createAccountLine(VoidCallback onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account?",
            style: AppTextStyles.registrationDescription),
        TextButton(
          onPressed: onTap,
          child: const Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  static Widget showError(
      String message, BuildContext context, VoidCallback onOkTap) {
    String shownMessage =
        message.contains(']') ? message.substring(message.indexOf(']')) : '';
    return Dialog(
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
              message == 'some thing went wrong'
                  ? message
                  : shownMessage.substring(1),
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
    );
  }

  static bool isRegisterErrorHidden = true;
}
