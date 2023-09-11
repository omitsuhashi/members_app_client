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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAPWM2q8VSAuE7ARo1guAbmCy859Ljv9LI',
    appId: '1:535382618380:web:9641ea05e9e485f08c1929',
    messagingSenderId: '535382618380',
    projectId: 'members-dev-25f27',
    authDomain: 'members-dev-25f27.firebaseapp.com',
    storageBucket: 'members-dev-25f27.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCFAPZqgh7kJMvMF0LYlec27pA7epENYPY',
    appId: '1:535382618380:android:a4ccb5df4f0265ba8c1929',
    messagingSenderId: '535382618380',
    projectId: 'members-dev-25f27',
    storageBucket: 'members-dev-25f27.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDjLRmhXf_lFiRMdF69rmUoUa6X6ZnRuCQ',
    appId: '1:535382618380:ios:698090ce0a7cd3568c1929',
    messagingSenderId: '535382618380',
    projectId: 'members-dev-25f27',
    storageBucket: 'members-dev-25f27.appspot.com',
    iosClientId: '535382618380-6bhscm6keevb6p031cfb3drg9ckpoohh.apps.googleusercontent.com',
    iosBundleId: 'com.the3.members.client.client',
  );
}
