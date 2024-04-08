// ignore_for_file: unused_element

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

import 'firebase_attributs.dart';

class _AndroidAuthProvider implements AuthProviderBase {
  late FirebaseApp firebaseApp;

  // Init Firebase app
  @override
  Future<FirebaseApp?> initialize() async {
    if (Firebase.apps.isEmpty) {
      firebaseApp = await Firebase.initializeApp(
        name: FirebaseAttributs.APP_NAME,
        options: const FirebaseOptions(
          apiKey: FirebaseAttributs.API_KEY,
          projectId: FirebaseAttributs.PROJECT_ID,
          storageBucket: FirebaseAttributs.STORAGE_BUCKET,
          messagingSenderId: FirebaseAttributs.MESSAGING_SENDER_ID,
          appId: FirebaseAttributs.APP_ANDROID_ID,
        ),
      );
    } else {
      firebaseApp = await Firebase.initializeApp(name: FirebaseAttributs.APP_NAME);
    }
    return firebaseApp;
  }

  // Upload file to firebase storage
  Future<String> uploadFile(File file, {String? document, String? name}) async {
    try {
      Reference reference = document != null && name != null
          ? FirebaseStorage.instance.ref('$document/$name')
          : FirebaseStorage.instance.ref().child(file.path);
      final metadata = SettableMetadata(
        contentType: "",
        customMetadata: {'picked-file-path': file.path},
      );
      TaskSnapshot snapshot;
      if (kIsWeb) {
        snapshot = await reference.putData(await file.readAsBytes(), metadata);
      } else {
        snapshot = await reference.putFile(file, metadata);
      }
      // On va retourner le chemin du fichier
      return await snapshot.ref.getDownloadURL();
    } on Exception {
      debugPrint("Error");
      return "";
    }
  }
}

class AuthProvider extends _AndroidAuthProvider {}

abstract class AuthProviderBase {
  Future<FirebaseApp?> initialize();
}
