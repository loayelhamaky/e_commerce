import 'package:flutter/material.dart';

import 'error_model.dart';

class ErrorNotifier extends StatelessWidget {
  final Widget child;
  final String? errorMessage;
  final VoidCallback? onRefresh;

  const ErrorNotifier({
    Key? key,
    required this.child,
    this.errorMessage,
    this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (errorMessage != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ErrorDialog(
              errorModel: ErrorModel(
                message: errorMessage!,
                onOkTap: () {
                  Navigator.of(context).pop();
                },
                onRefreshTap: () {
                  Navigator.of(context).pop();
                  if (onRefresh != null) onRefresh!();
                },
              ),
            );
          },
        );
      });
    }
    return child;
  }
}
