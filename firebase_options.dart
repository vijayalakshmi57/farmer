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
    apiKey: 'AIzaSyABXbdh20LaOLOtS74bv_G1Y7V-lBA3t3Y',
    appId: '1:444792770322:web:472e46b334af368abeadcb',
    messagingSenderId: '444792770322',
    projectId: 'farm-ec422',
    authDomain: 'farm-ec422.firebaseapp.com',
    databaseURL: 'https://farm-ec422-default-rtdb.firebaseio.com',
    storageBucket: 'farm-ec422.firebasestorage.app',
    measurementId: 'G-S2GC8RB415',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB7QAGqRiOiI--oUWR83UjvKNaOxuUecrU',
    appId: '1:444792770322:android:e32abd52352c2edcbeadcb',
    messagingSenderId: '444792770322',
    projectId: 'farm-ec422',
    databaseURL: 'https://farm-ec422-default-rtdb.firebaseio.com',
    storageBucket: 'farm-ec422.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAj6wODCOyL9e4kuM5JvhMxhj39TJSKY2g',
    appId: '1:444792770322:ios:65cbdd9ce8ea21c9beadcb',
    messagingSenderId: '444792770322',
    projectId: 'farm-ec422',
    databaseURL: 'https://farm-ec422-default-rtdb.firebaseio.com',
    storageBucket: 'farm-ec422.firebasestorage.app',
    iosClientId: '444792770322-t5b6farj11nuhj5r9s83dt3a0r4nd5c5.apps.googleusercontent.com',
    iosBundleId: 'com.example.farms',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAj6wODCOyL9e4kuM5JvhMxhj39TJSKY2g',
    appId: '1:444792770322:ios:65cbdd9ce8ea21c9beadcb',
    messagingSenderId: '444792770322',
    projectId: 'farm-ec422',
    databaseURL: 'https://farm-ec422-default-rtdb.firebaseio.com',
    storageBucket: 'farm-ec422.firebasestorage.app',
    iosClientId: '444792770322-t5b6farj11nuhj5r9s83dt3a0r4nd5c5.apps.googleusercontent.com',
    iosBundleId: 'com.example.farms',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyABXbdh20LaOLOtS74bv_G1Y7V-lBA3t3Y',
    appId: '1:444792770322:web:3c35a6964ba474cdbeadcb',
    messagingSenderId: '444792770322',
    projectId: 'farm-ec422',
    authDomain: 'farm-ec422.firebaseapp.com',
    databaseURL: 'https://farm-ec422-default-rtdb.firebaseio.com',
    storageBucket: 'farm-ec422.firebasestorage.app',
    measurementId: 'G-FFBJJ5ZKDT',
  );

}