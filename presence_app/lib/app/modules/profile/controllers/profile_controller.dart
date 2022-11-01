import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Stream<QuerySnapshot> getEmployee() {
  //   return firestore
  //       .collection('employee')
  //       .where('uid', isEqualTo: auth.currentUser!.uid)
  //       .snapshots();
  // }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getEmployee() {
    return firestore
        .collection('employee')
        .doc(auth.currentUser!.uid)
        .snapshots();
  }
}
