import 'package:flutter/material.dart';
import 'error_strings.dart';

class ErrorModel {
  final String message;
  final VoidCallback onOkTap;
  final VoidCallback onRefreshTap;

  ErrorModel({
    required this.message,
    required this.onOkTap,
    required this.onRefreshTap,
  });
}

class ErrorDialog extends StatelessWidget {
  final ErrorModel errorModel;

  const ErrorDialog({Key? key, required this.errorModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(ErrorStrings.error),
      content: Text(errorModel.message),
      actions: [
        TextButton(
          onPressed: errorModel.onOkTap,
          child: Text(ErrorStrings.ok),
        ),
        TextButton(
          onPressed: errorModel.onRefreshTap,
          child: Text(ErrorStrings.refresh),
        ),
      ],
    );
  }
}
