import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:presence_app/modules/login/controllers/login_controller.dart';
import 'package:presence_app/utils/db/pref_helper.dart';

import 'app/application_controller.dart';
import 'modules/profile/controllers/profile_controller.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory<FirebaseAuth>(() => FirebaseAuth.instance);
  locator.registerFactory<FirebaseFirestore>(() => FirebaseFirestore.instance);
  locator.registerFactory<FirebaseStorage>(() => FirebaseStorage.instance);
  locator.registerFactory<PrefHelper>(() => PrefHelper());
  locator.registerLazySingleton(() => ApplicationController(locator()));
  locator.registerLazySingleton(() => LoginController(locator()));
  locator.registerLazySingleton(() => ProfileController(locator()));
}