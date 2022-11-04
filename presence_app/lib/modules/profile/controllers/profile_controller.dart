import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:presence_app/routes/navigation.dart';
import 'package:presence_app/utils/db/pref_helper.dart';

import '../../../routes/app_pages.dart';

class ProfileController extends GetxController {
  final PrefHelper _pref;
  ProfileController(this._pref);
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<DocumentSnapshot<Map<String, dynamic>>> getEmployee() {
    return firestore
        .collection('employee')
        .doc(auth.currentUser!.uid)
        .snapshots();
  }

  Future logout() async {
    await auth.signOut();
    _pref.setLogin(false);
    Navigation.navigateToAndRemoveUntil(Routes.LOGIN);
  }
}
