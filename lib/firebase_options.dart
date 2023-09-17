// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyC2sEN9YbFzw_SNrYs1UtHt-1iubXREDBE',
    appId: '1:229125929621:web:d6fe504a3eee4bc114b99c',
    messagingSenderId: '229125929621',
    projectId: 'srchat-b18bb',
    authDomain: 'srchat-b18bb.firebaseapp.com',
    storageBucket: 'srchat-b18bb.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCl0j_S6eIhIBs_9-o7SlFjZEZNjd41HbQ',
    appId: '1:229125929621:android:842715f70c7826f014b99c',
    messagingSenderId: '229125929621',
    projectId: 'srchat-b18bb',
    storageBucket: 'srchat-b18bb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBwD8Ja0gAUyzumS1tnQ24I7-yivP_2iuU',
    appId: '1:229125929621:ios:99545d412580750314b99c',
    messagingSenderId: '229125929621',
    projectId: 'srchat-b18bb',
    storageBucket: 'srchat-b18bb.appspot.com',
    iosClientId: '229125929621-dll6s4m16eeemgvqeh11osk0fdpaooi4.apps.googleusercontent.com',
    iosBundleId: 'com.example.srchat1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBwD8Ja0gAUyzumS1tnQ24I7-yivP_2iuU',
    appId: '1:229125929621:ios:1424171ec3cc0c2414b99c',
    messagingSenderId: '229125929621',
    projectId: 'srchat-b18bb',
    storageBucket: 'srchat-b18bb.appspot.com',
    iosClientId: '229125929621-pa2rkjhb69vcp2j9bllikudcp8bj0bic.apps.googleusercontent.com',
    iosBundleId: 'com.example.srchat1.RunnerTests',
  );
}
