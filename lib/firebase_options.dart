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
    apiKey: 'AIzaSyDGzNMx2cDGwfdyIxGfwIKi9sn5J9OtQC0',
    appId: '1:238203142860:web:29ea235510d2bf19a53869',
    messagingSenderId: '238203142860',
    projectId: 'fir-app1-2b501',
    authDomain: 'fir-app1-2b501.firebaseapp.com',
    storageBucket: 'fir-app1-2b501.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD8MFj2yXmUXV4YSQvQC4RXvll356H98P4',
    appId: '1:238203142860:android:ca6ad059cdef7c4ea53869',
    messagingSenderId: '238203142860',
    projectId: 'fir-app1-2b501',
    storageBucket: 'fir-app1-2b501.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDqeyR6IId1mpnjbZdnbY48IOEPnEKMIYQ',
    appId: '1:238203142860:ios:c5d55a92614ffb7da53869',
    messagingSenderId: '238203142860',
    projectId: 'fir-app1-2b501',
    storageBucket: 'fir-app1-2b501.firebasestorage.app',
    iosBundleId: 'com.example.kullaniciapp1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDqeyR6IId1mpnjbZdnbY48IOEPnEKMIYQ',
    appId: '1:238203142860:ios:c5d55a92614ffb7da53869',
    messagingSenderId: '238203142860',
    projectId: 'fir-app1-2b501',
    storageBucket: 'fir-app1-2b501.firebasestorage.app',
    iosBundleId: 'com.example.kullaniciapp1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDGzNMx2cDGwfdyIxGfwIKi9sn5J9OtQC0',
    appId: '1:238203142860:web:a98976ed9b06f66da53869',
    messagingSenderId: '238203142860',
    projectId: 'fir-app1-2b501',
    authDomain: 'fir-app1-2b501.firebaseapp.com',
    storageBucket: 'fir-app1-2b501.firebasestorage.app',
  );
}
