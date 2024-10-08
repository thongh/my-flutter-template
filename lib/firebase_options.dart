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
    apiKey: 'AIzaSyAbgAWDiOr_fTOUXULhwn7AyRzpNNOGfTo',
    appId: '1:319731334863:web:4af38b8b5b38f49c0341ba',
    messagingSenderId: '319731334863',
    projectId: 'myfirebaseproject1-b79d4',
    authDomain: 'myfirebaseproject1-b79d4.firebaseapp.com',
    storageBucket: 'myfirebaseproject1-b79d4.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBuuCpXsBDge-nwvmb_W9w9t6iF2qg6-_U',
    appId: '1:319731334863:android:67043164d270adcd0341ba',
    messagingSenderId: '319731334863',
    projectId: 'myfirebaseproject1-b79d4',
    storageBucket: 'myfirebaseproject1-b79d4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCSHxAPb7osHeLAuOEt9Kmkt3FkHSF1ipM',
    appId: '1:319731334863:ios:9b1f924fc8964adc0341ba',
    messagingSenderId: '319731334863',
    projectId: 'myfirebaseproject1-b79d4',
    storageBucket: 'myfirebaseproject1-b79d4.appspot.com',
    iosBundleId: 'com.example.myFirstFlutterApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCSHxAPb7osHeLAuOEt9Kmkt3FkHSF1ipM',
    appId: '1:319731334863:ios:9b1f924fc8964adc0341ba',
    messagingSenderId: '319731334863',
    projectId: 'myfirebaseproject1-b79d4',
    storageBucket: 'myfirebaseproject1-b79d4.appspot.com',
    iosBundleId: 'com.example.myFirstFlutterApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAbgAWDiOr_fTOUXULhwn7AyRzpNNOGfTo',
    appId: '1:319731334863:web:3e07a86af28b5d4f0341ba',
    messagingSenderId: '319731334863',
    projectId: 'myfirebaseproject1-b79d4',
    authDomain: 'myfirebaseproject1-b79d4.firebaseapp.com',
    storageBucket: 'myfirebaseproject1-b79d4.appspot.com',
  );
}
