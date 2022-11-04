import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:presence_app/common/constant.dart';

class HomeController extends GetxController {
  late FirebaseFirestore firestore;
  late FirebaseAuth auth;
  Rx<Status> status = Status.loading.obs;
  RxMap user = {}.obs;
  HomeController({required this.firestore, required this.auth}) {
    fetchEmployee();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getEmployee() {
    return firestore.collection('employee').doc(auth.currentUser!.uid).get();
  }

  Future<void> fetchEmployee() async {
    status.value = Status.loading;
    try {
      final employee = await getEmployee();
      user(employee.data()!);
      status.value = Status.success;
    } catch (e) {
      status.value = Status.error;
    }
  }
}
