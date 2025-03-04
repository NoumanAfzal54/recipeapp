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
    apiKey: 'AIzaSyD5YxODfC8nNjPXwhaOl7qJ2NKK93mbJh0',
    appId: '1:239149054341:web:224e1c376173b6aedb6cec',
    messagingSenderId: '239149054341',
    projectId: 'fir-c60b3',
    authDomain: 'fir-c60b3.firebaseapp.com',
    storageBucket: 'fir-c60b3.firebasestorage.app',
    measurementId: 'G-FC0M93059J',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDGtnb0yu6XgGbz4F_Hc_g5cjCHAIO7KMs',
    appId: '1:239149054341:android:b963751eaf4f301fdb6cec',
    messagingSenderId: '239149054341',
    projectId: 'fir-c60b3',
    storageBucket: 'fir-c60b3.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDMgwZ_GE1-hq2APviE6yELl9v2wq3DmGo',
    appId: '1:239149054341:ios:0bf9e3f6cb77a5b0db6cec',
    messagingSenderId: '239149054341',
    projectId: 'fir-c60b3',
    storageBucket: 'fir-c60b3.firebasestorage.app',
    iosBundleId: 'com.example.pop',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDMgwZ_GE1-hq2APviE6yELl9v2wq3DmGo',
    appId: '1:239149054341:ios:0bf9e3f6cb77a5b0db6cec',
    messagingSenderId: '239149054341',
    projectId: 'fir-c60b3',
    storageBucket: 'fir-c60b3.firebasestorage.app',
    iosBundleId: 'com.example.pop',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD5YxODfC8nNjPXwhaOl7qJ2NKK93mbJh0',
    appId: '1:239149054341:web:27f202963132ec57db6cec',
    messagingSenderId: '239149054341',
    projectId: 'fir-c60b3',
    authDomain: 'fir-c60b3.firebaseapp.com',
    storageBucket: 'fir-c60b3.firebasestorage.app',
    measurementId: 'G-W06SLDFQRW',
  );
}
