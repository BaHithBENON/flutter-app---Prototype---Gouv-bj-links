// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../utilities/variables/firestore_collections_names.dart';

class FireDatas {
  static FirebaseAuth AUTH = FirebaseAuth.instance;
  static FirebaseFirestore FIRESTORE = FirebaseFirestore.instance;

  static final banners =
    FIRESTORE.collection(FirestoreCollectionsNames.COLLECTION_BANNERS);

  static final flashInfos =
    FIRESTORE.collection(FirestoreCollectionsNames.COLLECTION_FLASH_INFOS);

  static final links =
    FIRESTORE.collection(FirestoreCollectionsNames.COLLECTION_LINKS);

  static final appLinks =
    FIRESTORE.collection(FirestoreCollectionsNames.COLLECTION_APP_LINKS);

  static final supportTeamLinks =
    FIRESTORE.collection(FirestoreCollectionsNames.COLLECTION_SUPPORT_TEAM_LINKS);

  static final clicksLinks =
    FIRESTORE.collection(FirestoreCollectionsNames.COLLECTION_CLICKS_LINKS);

  static final appUpdates =
    FIRESTORE.collection(FirestoreCollectionsNames.COLLECTION_APP_UPDATES);
}
