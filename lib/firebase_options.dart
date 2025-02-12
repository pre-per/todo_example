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
    apiKey: 'AIzaSyA8LxT8yNqBDUDI_HGm2lA3QGn-w4Epwow',
    appId: '1:819206182226:web:cae5db509c7a33b016d68b',
    messagingSenderId: '819206182226',
    projectId: 'todo-example-983da',
    authDomain: 'todo-example-983da.firebaseapp.com',
    storageBucket: 'todo-example-983da.firebasestorage.app',
    measurementId: 'G-G40Z3G2H5Q',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDaAJuYok0QZTLJ1iVEhYR7h-8n-SrIxMc',
    appId: '1:819206182226:android:66254994480bc3cd16d68b',
    messagingSenderId: '819206182226',
    projectId: 'todo-example-983da',
    storageBucket: 'todo-example-983da.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCM9S5wGy_byOn3DrrmvUZMCowOP-jmtAM',
    appId: '1:819206182226:ios:6b8364456112df6d16d68b',
    messagingSenderId: '819206182226',
    projectId: 'todo-example-983da',
    storageBucket: 'todo-example-983da.firebasestorage.app',
    iosBundleId: 'com.example.todoExample',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCM9S5wGy_byOn3DrrmvUZMCowOP-jmtAM',
    appId: '1:819206182226:ios:6b8364456112df6d16d68b',
    messagingSenderId: '819206182226',
    projectId: 'todo-example-983da',
    storageBucket: 'todo-example-983da.firebasestorage.app',
    iosBundleId: 'com.example.todoExample',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA8LxT8yNqBDUDI_HGm2lA3QGn-w4Epwow',
    appId: '1:819206182226:web:e911f93837d7f59616d68b',
    messagingSenderId: '819206182226',
    projectId: 'todo-example-983da',
    authDomain: 'todo-example-983da.firebaseapp.com',
    storageBucket: 'todo-example-983da.firebasestorage.app',
    measurementId: 'G-W2YV1RQDTV',
  );
}
