import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class PresenceController extends GetxController {
  RxString latitude = ''.obs;
  RxString longitude = ''.obs;
  RxString positionNow = ''.obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
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

  Future updatePosition() async {
    Position position = await determinePosition();
    latitude.value = position.latitude.toString();
    longitude.value = position.longitude.toString();

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    positionNow.value = '${place.locality}, ${place.administrativeArea}';
    await firestore.collection('employee').doc(auth.currentUser!.uid).update(
      {
        'positioned': {
          'latitude': latitude.value,
          'longitude': longitude.value,
        },
        'address': placemarks[0].street,
      },
    );
    Get.snackbar('Absent Success', 'Your position has been updated');
  }
}
