import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@lazySingleton
class RetryRequestHelper {
  final InternetConnectionChecker checker = InternetConnectionChecker();
  StreamSubscription<InternetConnectionStatus>? subscription;
  bool shouldRetry = false;
  final Function function;

  RetryRequestHelper({required this.function}) {
    subscription = checker.onStatusChange.listen((event) async {
      if (event == InternetConnectionStatus.disconnected) {
        shouldRetry = true;
        print("Disconnected, waiting to retry...");
      } else if (event == InternetConnectionStatus.connected && shouldRetry) {
        print("Reconnected");
        await function.call();
        print("called function");
        shouldRetry = false;
      }
    });
  }

  /// Dispose of the subscription
  void closeSubscription() {
    subscription?.cancel();
  }
}
