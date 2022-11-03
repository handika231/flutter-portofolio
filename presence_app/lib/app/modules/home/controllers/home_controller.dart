import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt count = 0.obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  increment() => count++;
  Stream<DocumentSnapshot<Map<String, dynamic>>> fetchDataUser() {
    return firestore
        .collection('employee')
        .doc(auth.currentUser!.uid)
        .snapshots();
  }
}
