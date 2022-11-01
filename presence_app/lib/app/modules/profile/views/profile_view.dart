import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileView'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Map<String, dynamic>? user = snapshot.data?.data();
            return Text(user?['email']);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        stream: controller.getEmployee(),
      ),
    );
  }
}
