import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PresenceController extends GetxController {
  RxString latitude = ''.obs;
  RxString longitude = ''.obs;
  RxString positionNow = ''.obs;
  final FirebaseAuth auth;
  FirebaseFirestore firestore;
  PresenceController({required this.auth, required this.firestore});
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> presence(Position position, String address) async {
    CollectionReference<Map<String, dynamic>> presence = firestore
        .collection('employee')
        .doc(auth.currentUser!.uid)
        .collection('presence');
    QuerySnapshot<Map<String, dynamic>> snapshot = await presence.get();
    DateTime now = DateTime.now();
    String today = DateFormat.yMd().format(now).replaceAll('/', '-');
    if (snapshot.docs.isEmpty) {
      presence.doc(today).set({
        'date': today,
        'masuk': {
          'date': today,
          'latitude': position.latitude,
          'longitude': position.longitude,
          'address': address,
          'time': DateFormat.jm().format(now),
        }
      });
    } else {
      QueryDocumentSnapshot<Map<String, dynamic>> doc = snapshot.docs.first;
      if (doc.id == today) {
        if (doc.data().containsKey('pulang')) {
          Get.defaultDialog(
            title: 'Anda sudah pulang',
            middleText: 'Anda sudah melakukan presensi pulang',
          );
        } else {
          presence.doc(today).update({
            'pulang': {
              'date': today,
              'latitude': position.latitude,
              'longitude': position.longitude,
              'address': address,
              'time': DateFormat.jm().format(now),
            }
          });
        }
      } else {
        presence.doc(today).set({
          'date': today,
          'masuk': {
            'date': today,
            'latitude': position.latitude,
            'longitude': position.longitude,
            'address': address,
            'time': DateFormat.jm().format(now),
          }
        });
      }
    }
  }

  Future updatePosition() async {
    Position position = await determinePosition();
    latitude.value = position.latitude.toString();
    longitude.value = position.longitude.toString();

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    positionNow.value = '${place.locality}, ${place.administrativeArea}';
    await presence(position, positionNow.value);
    await firestore.collection('employee').doc(auth.currentUser!.uid).update(
      {
        'positioned': {
          'latitude': latitude.value,
          'longitude': longitude.value,
        },
        'address': positionNow.value,
      },
    );
    Get.snackbar('Absent Success', 'Your position has been updated');
  }
}
