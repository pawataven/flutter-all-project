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
/// 
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
    apiKey: 'AIzaSyBq5QCR83chEsxqlgfYZlVFEpYfAs3K2Yw',
    appId: '1:181565865560:web:ba71ed3e911c05e97e542d',
    messagingSenderId: '181565865560',
    projectId: 'quizzmakdatabase',
    authDomain: 'quizzmakdatabase.firebaseapp.com',
    storageBucket: 'quizzmakdatabase.firebasestorage.app',
    measurementId: 'G-K9LPCKJMX5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD0L1l_ZDGVdbfnPwRLwe8IwDZlXfYoKCc',
    appId: '1:181565865560:android:c64cb03af1120f567e542d',
    messagingSenderId: '181565865560',
    projectId: 'quizzmakdatabase',
    storageBucket: 'quizzmakdatabase.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDTPLlHm2R3F-eVSlIpXjLSrhiTjZqVxHk',
    appId: '1:181565865560:ios:7bdce63155a1a1887e542d',
    messagingSenderId: '181565865560',
    projectId: 'quizzmakdatabase',
    storageBucket: 'quizzmakdatabase.firebasestorage.app',
    iosBundleId: 'com.example.quizzmak',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDTPLlHm2R3F-eVSlIpXjLSrhiTjZqVxHk',
    appId: '1:181565865560:ios:7bdce63155a1a1887e542d',
    messagingSenderId: '181565865560',
    projectId: 'quizzmakdatabase',
    storageBucket: 'quizzmakdatabase.firebasestorage.app',
    iosBundleId: 'com.example.quizzmak',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBq5QCR83chEsxqlgfYZlVFEpYfAs3K2Yw',
    appId: '1:181565865560:web:50b3c96031ab12f27e542d',
    messagingSenderId: '181565865560',
    projectId: 'quizzmakdatabase',
    authDomain: 'quizzmakdatabase.firebaseapp.com',
    storageBucket: 'quizzmakdatabase.firebasestorage.app',
    measurementId: 'G-QBKDL1GLH7',
  );
}
