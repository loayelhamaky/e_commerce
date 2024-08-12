// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAmZc9lCpuM3Xd711DVAo9dYyTGfLgPSyI',
    appId: '1:42531535916:web:0713f4a310a1107348e589',
    messagingSenderId: '42531535916',
    projectId: 'e-commerce-fb5c4',
    authDomain: 'e-commerce-fb5c4.firebaseapp.com',
    storageBucket: 'e-commerce-fb5c4.appspot.com',
    measurementId: 'G-TGEFGJ1G50',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCUvG97SgZnRpdju0_FgEWPmEBmIfC0Xis',
    appId: '1:42531535916:android:c8b77cb608d8a00d48e589',
    messagingSenderId: '42531535916',
    projectId: 'e-commerce-fb5c4',
    storageBucket: 'e-commerce-fb5c4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBsv1n38_twIZqsZpZp75jkVhlGEcSG3uM',
    appId: '1:42531535916:ios:76738e898741145748e589',
    messagingSenderId: '42531535916',
    projectId: 'e-commerce-fb5c4',
    storageBucket: 'e-commerce-fb5c4.appspot.com',
    iosBundleId: 'com.example.eCommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBsv1n38_twIZqsZpZp75jkVhlGEcSG3uM',
    appId: '1:42531535916:ios:76738e898741145748e589',
    messagingSenderId: '42531535916',
    projectId: 'e-commerce-fb5c4',
    storageBucket: 'e-commerce-fb5c4.appspot.com',
    iosBundleId: 'com.example.eCommerce',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAmZc9lCpuM3Xd711DVAo9dYyTGfLgPSyI',
    appId: '1:42531535916:web:1937b948e093c2ab48e589',
    messagingSenderId: '42531535916',
    projectId: 'e-commerce-fb5c4',
    authDomain: 'e-commerce-fb5c4.firebaseapp.com',
    storageBucket: 'e-commerce-fb5c4.appspot.com',
    measurementId: 'G-RQSD5M2FN0',
  );
}
