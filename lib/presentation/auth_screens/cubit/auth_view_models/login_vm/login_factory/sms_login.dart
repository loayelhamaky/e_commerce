import 'package:e_commerce_app/presentation/auth_screens/cubit/auth_view_models/login_vm/login_factory/login_factory.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginWithSms implements LoginFactory {
  BuildContext context;
  String? verificationId;
  LoginWithSms(this.context, this.verificationId);
  @override
  void login() {
    TextEditingController phoneController = TextEditingController();

    try {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Enter your phone number"),
            content: TextField(
              controller: phoneController,
              decoration:
                  const InputDecoration(hintText: "example: +201092452462"),
              keyboardType: TextInputType.phone,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  sendSms(phoneController.text.trim());
                },
                child: const Text("Send Code"),
              ),
            ],
          );
        },
      );
    } catch (e) {
      throw e.toString();
    }
  }

  void sendSms(String phoneNumber) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {
          this.verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          this.verificationId = verificationId;
        },
      );
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> verifyOtp(String smsCode) async {
    if (verificationId == null) return;
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: smsCode,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      throw e.toString();
    }
  }

  void promptForOtp(BuildContext context) {
    showOtpDialog(context, (userOtp) {
      verifyOtp(userOtp);
    });
  }

  void showOtpDialog(BuildContext context, Function(String) onOtpEntered) {
    TextEditingController otpController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Enter OTP"),
          content: TextField(
            controller: otpController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: "Enter the OTP",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onOtpEntered(otpController.text);
              },
              child: const Text("Verify"),
            ),
          ],
        );
      },
    );
  }
}
