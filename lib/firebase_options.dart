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
    apiKey: 'AIzaSyD9zgrmUPU22h3c7PsuOGwC2JsGBusvWV0',
    appId: '1:171365138892:web:1043a7f643c16bdbe51d69',
    messagingSenderId: '171365138892',
    projectId: 'examen-de-manejo-52988',
    authDomain: 'examen-de-manejo-52988.firebaseapp.com',
    storageBucket: 'examen-de-manejo-52988.appspot.com',
    measurementId: 'G-MTTX7XRY7P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDL1wfdUdsexFZU-OV1jR69PHWpG6XZ-Zk',
    appId: '1:171365138892:android:0685ba708b8838b2e51d69',
    messagingSenderId: '171365138892',
    projectId: 'examen-de-manejo-52988',
    storageBucket: 'examen-de-manejo-52988.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDxo6dBzDUfzp0EyoN_uxjfjyw3cUI8GTU',
    appId: '1:171365138892:ios:4334ad1ab0c62842e51d69',
    messagingSenderId: '171365138892',
    projectId: 'examen-de-manejo-52988',
    storageBucket: 'examen-de-manejo-52988.appspot.com',
    iosBundleId: 'com.example.examenManejo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDxo6dBzDUfzp0EyoN_uxjfjyw3cUI8GTU',
    appId: '1:171365138892:ios:4334ad1ab0c62842e51d69',
    messagingSenderId: '171365138892',
    projectId: 'examen-de-manejo-52988',
    storageBucket: 'examen-de-manejo-52988.appspot.com',
    iosBundleId: 'com.example.examenManejo',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD9zgrmUPU22h3c7PsuOGwC2JsGBusvWV0',
    appId: '1:171365138892:web:f05ea23b4f3de563e51d69',
    messagingSenderId: '171365138892',
    projectId: 'examen-de-manejo-52988',
    authDomain: 'examen-de-manejo-52988.firebaseapp.com',
    storageBucket: 'examen-de-manejo-52988.appspot.com',
    measurementId: 'G-HN4JVG9GRM',
  );
}
