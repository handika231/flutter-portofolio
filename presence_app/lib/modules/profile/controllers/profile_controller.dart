import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:presence_app/common/constant.dart';
import 'package:presence_app/utils/db/pref_helper.dart';

import '../../../routes/app_pages.dart';

class ProfileController extends GetxController {
  final PrefHelper pref;
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  Rx<Status> status = Status.loading.obs;
  RxMap user = {}.obs;
  ProfileController(
      {required this.pref, required this.auth, required this.firestore}) {
    fetchEmployee();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getEmployee() {
    return firestore.collection('employee').doc(auth.currentUser!.uid).get();
  }

  Future<void> fetchEmployee() async {
    status(Status.loading);
    try {
      final employee = await getEmployee();
      user(employee.data()!);
      status(Status.success);
    } catch (e) {
      status(Status.error);
    }
  }

  Future<void> logout() async {
    await auth.signOut();
    await pref.setLogin(false);
    Get.offAllNamed(Routes.LOGIN);
  }
}
